import 'package:flutter/material.dart';
import 'package:front/enums/tipo_treino.dart';
import 'package:front/controller/APIController.dart';
import 'package:front/model/treino.dart';

import '../theme/app_colors.dart';
import 'treino_page.dart';

class TreinosPage extends StatefulWidget {
  const TreinosPage({super.key});

  @override
  State<TreinosPage> createState() => _TreinosPageState();
}

class _TreinosPageState extends State<TreinosPage> {
  TipoTreino tipoTreino = TipoTreino.ACADEMIA;

  void _escolherTipoTreino(TipoTreino tipo) {
    setState(() {
      tipoTreino = tipo;
    });
    Navigator.pop(context);
  }

  void _showTipoTreinoModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Escolha o tipo de treino',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Selecione a modalidade que você deseja.',
                style: TextStyle(fontSize: 14, color: AppColors.secondaryText),
              ),
              const SizedBox(height: 24),
              _OpcaoTreino(
                titulo: 'Treino de Academia',
                descricao: 'Força, hipertrofia e condicionamento',
                icone: Icons.fitness_center_rounded,
                selecionado: tipoTreino == TipoTreino.ACADEMIA,
                onTap: () => _escolherTipoTreino(TipoTreino.ACADEMIA),
              ),
              const SizedBox(height: 12),
              _OpcaoTreino(
                titulo: 'Treino Laboral',
                descricao: 'Alongamentos e exercícios no trabalho',
                icone: Icons.accessibility_new_rounded,
                selecionado: tipoTreino == TipoTreino.LABORAL,
                onTap: () => _escolherTipoTreino(TipoTreino.LABORAL),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título Superior
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 16),
              child: Text(
                'Treinos',
                style: TextStyle(
                  fontFamily: 'BebasNeue',
                  fontSize: 36,
                  color: AppColors.text,
                  letterSpacing: -0.5,
                ),
              ),
            ),

            // Card Seletor
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ModalidadeSelectorCard(
                tipo: tipoTreino,
                onTap: _showTipoTreinoModal,
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: TelaTreino(tipo: tipoTreino)
            ),
          ],
        ),
      ),
    );
  }
}

class ModalidadeSelectorCard extends StatelessWidget {
  final TipoTreino tipo;
  final VoidCallback onTap;

  const ModalidadeSelectorCard({
    super.key,
    required this.tipo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isAcademia = tipo == TipoTreino.ACADEMIA;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                isAcademia
                    ? Icons.fitness_center_rounded
                    : Icons.accessibility_new_rounded,
                color: AppColors.green,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isAcademia ? 'Treino de Academia' : 'Treino Laboral',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    isAcademia
                        ? 'Seu treino de hoje'
                        : 'Alongamentos e exercícios',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.secondaryText,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}

class _OpcaoTreino extends StatelessWidget {
  final String titulo;
  final String descricao;
  final IconData icone;
  final bool selecionado;
  final VoidCallback onTap;

  const _OpcaoTreino({
    required this.titulo,
    required this.descricao,
    required this.icone,
    required this.selecionado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selecionado
              ? AppColors.green.withValues(alpha: 0.05)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selecionado ? AppColors.green : AppColors.border,
            width: selecionado ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icone,
              color: selecionado ? AppColors.green : AppColors.secondaryText,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: selecionado ? AppColors.green : AppColors.text,
                    ),
                  ),
                  Text(
                    descricao,
                    style: TextStyle(
                      fontSize: 12,
                      color: selecionado
                          ? AppColors.green.withValues(alpha: 0.7)
                          : AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            if (selecionado)
              const Icon(
                Icons.check_circle_rounded,
                color: AppColors.green,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}

class TelaTreino extends StatelessWidget {
  final TipoTreino tipo;
  const TelaTreino({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TreinosLista(tipo: tipo),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}

class TreinosLista extends StatelessWidget {
  final TipoTreino tipo;
  const TreinosLista({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    // ID de usuário da sessão
    final String idUsuario = Session.usuario?.id ?? ''; 

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'TREINOS',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        FutureBuilder<List<Treino>>(
          future: getTreinos(idUsuario, tipo),
          builder: (context, snapshot) {
//... rest of the code
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(color: AppColors.green),
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Erro ao carregar treinos: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            final treinos = snapshot.data ?? [];

            if (treinos.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Nenhum treino encontrado para esta categoria.',
                    style: TextStyle(color: AppColors.secondaryText),
                  ),
                ),
              );
            }

            return Column(
              children: treinos.asMap().entries.map((entry) {
                final index = entry.key;
                final treino = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TreinoCard(
                    numero: index + 1,
                    treino: treino,
                    series: '', // Pode vir de outra tabela ou DTO se necessário
                    repeticoes: '',
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}

class TreinoCard extends StatelessWidget {
  final int numero;
  final Treino treino;
  final String series;
  final String repeticoes;
  final bool concluido;

  const TreinoCard({
    super.key,
    required this.numero,
    required this.treino,
    required this.series,
    required this.repeticoes,
    this.concluido = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TreinoPage(treino: treino),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              // Número
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: concluido ? AppColors.lightGreen : AppColors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: concluido
                    ? const Icon(
                        Icons.check_rounded,
                        color: AppColors.green,
                        size: 20,
                      )
                    : Text(
                        '$numero',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
              ),

              const SizedBox(width: 8),

              // Ícone
              Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  color: AppColors.lightGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.accessibility_new_rounded,
                  color: AppColors.green,
                  size: 21,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      treino.nome,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      treino.categoria.name,
                      style: const TextStyle(
                        color: AppColors.secondaryText,
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // Séries / reps
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      series,
                      style: const TextStyle(
                        color: AppColors.green,
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      repeticoes,
                      style: const TextStyle(
                        color: AppColors.secondaryText,
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 3),

              Icon(
                concluido
                    ? Icons.check_circle_rounded
                    : Icons.chevron_right_rounded,
                size: 20,
                color: concluido
                    ? AppColors.green
                    : AppColors.secondaryText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}