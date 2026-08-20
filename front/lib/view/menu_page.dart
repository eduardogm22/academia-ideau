import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class MenuPage extends StatelessWidget {
  final ValueChanged<int> onSelecionarPagina;

  const MenuPage({super.key, required this.onSelecionarPagina});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 112),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Cabecalho(onPerfil: () => onSelecionarPagina(4)),
                  const SizedBox(height: 24),
                  _TreinoDestaque(onTap: () => onSelecionarPagina(1)),
                  const SizedBox(height: 18),
                  _ResumoSemanal(onTap: () => onSelecionarPagina(2)),
                  const SizedBox(height: 26),
                  const Text(
                    'ACESSO RÁPIDO',
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.7,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _Atalho(
                    icone: Icons.calendar_month_rounded,
                    titulo: 'Histórico de treinos',
                    descricao: 'Consulte suas atividades realizadas',
                    onTap: () => onSelecionarPagina(3),
                  ),
                  const SizedBox(height: 10),
                  _Atalho(
                    icone: Icons.bar_chart_rounded,
                    titulo: 'Relatórios',
                    descricao: 'Veja sua evolução e suas metas',
                    onTap: () => onSelecionarPagina(2),
                  ),
                  const SizedBox(height: 10),
                  _Atalho(
                    icone: Icons.person_outline_rounded,
                    titulo: 'Meu perfil',
                    descricao: 'Dados pessoais e da empresa',
                    onTap: () => onSelecionarPagina(4),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Cabecalho extends StatelessWidget {
  final VoidCallback onPerfil;
  const _Cabecalho({required this.onPerfil});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Olá, Mariana',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Quinta-feira, 20 de agosto',
                style: TextStyle(
                  color: AppColors.secondaryText,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Material(
          color: Colors.white,
          shape: const CircleBorder(side: BorderSide(color: AppColors.border)),
          child: InkWell(
            onTap: onPerfil,
            customBorder: const CircleBorder(),
            child: const SizedBox(
              width: 48,
              height: 48,
              child: Icon(
                Icons.person_outline_rounded,
                color: AppColors.green,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TreinoDestaque extends StatelessWidget {
  final VoidCallback onTap;
  const _TreinoDestaque({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.darkGreen,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGreen.withValues(alpha: 0.18),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -42,
            top: -52,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.green.withValues(alpha: 0.8),
              ),
            ),
          ),
          Positioned(
            right: 18,
            bottom: 18,
            child: Icon(
              Icons.fitness_center_rounded,
              size: 76,
              color: Colors.white.withValues(alpha: 0.12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'TREINO DE HOJE',
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Movimente-se.\nSeu corpo agradece.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    height: 1.15,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.4,
                  ),
                ),
                const Spacer(),
                FilledButton.icon(
                  onPressed: onTap,
                  icon: const Icon(Icons.play_arrow_rounded, size: 20),
                  label: const Text(
                    'COMEÇAR AGORA',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.darkGreen,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ResumoSemanal extends StatelessWidget {
  final VoidCallback onTap;
  const _ResumoSemanal({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              const Row(
                children: [
                  Icon(Icons.bolt_rounded, color: AppColors.green, size: 22),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Meta semanal',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Text(
                    '60 de 150 min',
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const LinearProgressIndicator(
                  value: 0.4,
                  minHeight: 8,
                  color: AppColors.green,
                  backgroundColor: AppColors.lightGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Atalho extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;
  final VoidCallback onTap;

  const _Atalho({
    required this.icone,
    required this.titulo,
    required this.descricao,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(17),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(17),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(icone, color: AppColors.green, size: 22),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      descricao,
                      style: const TextStyle(
                        color: AppColors.secondaryText,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.secondaryText,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
