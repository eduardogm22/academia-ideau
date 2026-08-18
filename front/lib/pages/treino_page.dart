import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'exercicio_page.dart';

enum TipoTreino {
  academia,
  laboral,
}

class TreinoPage extends StatefulWidget {
  const TreinoPage({super.key});

  @override
  State<TreinoPage> createState() => _TreinoPageState();
}

class _TreinoPageState extends State<TreinoPage> {
  TipoTreino tipoTreino = TipoTreino.laboral;

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
                'Selecione a modalidade que você deseja realizar agora.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 24),
              _OpcaoTreino(
                titulo: 'Treino de Academia',
                descricao: 'Força, hipertrofia e condicionamento',
                icone: Icons.fitness_center_rounded,
                selecionado: tipoTreino == TipoTreino.academia,
                onTap: () => _escolherTipoTreino(TipoTreino.academia),
              ),
              const SizedBox(height: 12),
              _OpcaoTreino(
                titulo: 'Treino Laboral',
                descricao: 'Alongamentos e exercícios no trabalho',
                icone: Icons.accessibility_new_rounded,
                selecionado: tipoTreino == TipoTreino.laboral,
                onTap: () => _escolherTipoTreino(TipoTreino.laboral),
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
                'Treino',
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
              child: tipoTreino == TipoTreino.academia
                  ? const TelaTreinoAcademia()
                  : const TelaTreinoLaboral(),
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
    final bool isAcademia = tipo == TipoTreino.academia;

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
                isAcademia ? Icons.fitness_center_rounded : Icons.accessibility_new_rounded,
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
                    isAcademia ? 'Seu treino de hoje' : 'Alongamentos e exercícios',
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
          color: selecionado ? AppColors.green.withValues(alpha: 0.05) : Colors.transparent,
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
                      color: selecionado ? AppColors.green.withValues(alpha: 0.7) : AppColors.secondaryText,
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

class TelaTreinoLaboral extends StatelessWidget {
  const TelaTreinoLaboral({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 100), // Padding extra para BottomNav
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SEU TREINO',
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 12),
              TreinoResumoCard(),
              SizedBox(height: 28),
              Text(
                'EXERCÍCIOS',
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 12),
              ExerciciosLista(),
              SizedBox(height: 14),
              AvisoCard(),
              SizedBox(height: 16),
              BotoesTreino(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class TelaTreinoAcademia extends StatelessWidget {
  const TelaTreinoAcademia({super.key});

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
              const Text(
                'SEU TREINO',
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.fitness_center_rounded, size: 48, color: AppColors.placeholder),
                    SizedBox(height: 16),
                    Text(
                      'Treino de Academia',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Conteúdo do treino de academia em desenvolvimento.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.secondaryText),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// RESUMO

class TreinoResumoCard extends StatelessWidget {
  const TreinoResumoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TREINO ATUAL',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.4,
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: const BoxDecoration(
                  color: AppColors.lightGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.accessibility_new_rounded,
                  color: AppColors.green,
                  size: 29,
                ),
              ),

              const SizedBox(width: 12),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alongamento de Pescoço',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Mobilidade e alongamento',
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          const Row(
            children: [
              Expanded(
                child: InfoTreino(
                  icon: Icons.timer_outlined,
                  valor: '25 min',
                  label: 'Duração',
                ),
              ),

              SizedBox(width: 6),

              Expanded(
                child: InfoTreino(
                  icon: Icons.fitness_center_rounded,
                  valor: '8',
                  label: 'Exercícios',
                ),
              ),

              SizedBox(width: 6),

              Expanded(
                child: InfoTreino(
                  icon: Icons.bar_chart_rounded,
                  valor: '40%',
                  label: 'Concluído',
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: const LinearProgressIndicator(
              value: 0.4,
              minHeight: 6,
              color: AppColors.green,
              backgroundColor: Color(0xFFE9ECEA),
            ),
          ),

          const SizedBox(height: 16),

          const Row(
            children: [
              Icon(
                Icons.star_rounded,
                color: AppColors.yellow,
                size: 21,
              ),
              SizedBox(width: 9),
              Expanded(
                child: Text(
                  'Você está no caminho certo! 💪',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.secondaryText,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// INFORMAÇÕES

class InfoTreino extends StatelessWidget {
  final IconData icon;
  final String valor;
  final String label;

  const InfoTreino({
    super.key,
    required this.icon,
    required this.valor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: AppColors.lightGreen,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.green,
            size: 17,
          ),
        ),

        const SizedBox(height: 7),

        Text(
          valor,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800),
        ),

        const SizedBox(height: 5),

        Text(
          label,
          style: const TextStyle(
            color: AppColors.secondaryText,
            fontSize: 9,
          ),
        ),
      ],
    );
  }
}

// LISTA

class ExerciciosLista extends StatelessWidget {
  const ExerciciosLista({super.key});

  static const exercicios = [
    ('Alongamento de Pescoço', 'Mobilidade', '3 séries', '20 seg'),
    ('Rotação de Ombros', 'Mobilidade', '3 séries', '15 rep'),
    ('Alongamento Lateral', 'Flexibilidade', '3 séries', '20 seg'),
    ('Agachamento Corporal', 'Força', '3 séries', '12 rep'),
    ('Alongamento da Coluna', 'Mobilidade', '3 séries', '20 seg'),
    ('Elevação de Panturrilha', 'Força', '3 séries', '15 rep'),
    ('Rotação de Punhos', 'Mobilidade', '2 séries', '20 seg'),
    ('Respiração Profunda', 'Relaxamento', '3 séries', '30 seg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        exercicios.length,
        (index) {
          final exercicio = exercicios[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: ExercicioCard(
              numero: index + 1,
              nome: exercicio.$1,
              categoria: exercicio.$2,
              series: exercicio.$3,
              repeticoes: exercicio.$4,
            ),
          );
        },
      ),
    );
  }
}

// CARD EXERCÍCIO

class ExercicioCard extends StatelessWidget {
  final int numero;
  final String nome;
  final String categoria;
  final String series;
  final String repeticoes;

  const ExercicioCard({
    super.key,
    required this.numero,
    required this.nome,
    required this.categoria,
    required this.series,
    required this.repeticoes,
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
              builder: (_) => const ExercicioPage(),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 9,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColors.border,
            ),
          ),
          child: Row(
            children: [
              // Número
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
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

              // Nome do exercício
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nome,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      categoria,
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

              const Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: AppColors.secondaryText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// AVISO

class AvisoCard extends StatelessWidget {
  const AvisoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 11,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFEEB),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.yellow,
        ),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 17,
            backgroundColor: AppColors.yellow,
            child: Icon(
              Icons.info_outline_rounded,
              color: AppColors.text,
              size: 20,
            ),
          ),

          SizedBox(width: 11),

          Expanded(
            child: Text(
              'Respeite seus limites durante o treino.',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                color: AppColors.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// BOTÕES

class BotoesTreino extends StatelessWidget {
  const BotoesTreino({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Em telas muito estreitas, coloca um embaixo do outro.
        if (constraints.maxWidth < 330) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 44,
                child: _botaoIniciar(),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 42,
                child: _botaoCancelar(),
              ),
            ],
          );
        }

        return Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 44,
                child: _botaoIniciar(),
              ),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: SizedBox(
                height: 44,
                child: _botaoCancelar(),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _botaoIniciar() {
    return ElevatedButton.icon(
      onPressed: () {
        debugPrint('Iniciar treino');
      },
      icon: const Icon(
        Icons.play_arrow_rounded,
        size: 19,
      ),
      label: const FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          'INICIAR TREINO',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
    );
  }

  Widget _botaoCancelar() {
    return OutlinedButton(
      onPressed: () {
        debugPrint('Cancelar treino');
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.red,
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        side: const BorderSide(
          color: AppColors.red,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
      child: const FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          'CANCELAR',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

// PLACEHOLDER RESPONSIVOr

class PlaceholderFlex extends StatelessWidget {
  final double height;
  final double fraction;

  const PlaceholderFlex({
    super.key,
    required this.height,
    this.fraction = 1,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: fraction,
      alignment: Alignment.centerLeft,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: AppColors.placeholder,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
