import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class HistoricoPage extends StatelessWidget {
  const HistoricoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'HISTÓRICO',
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'Seus treinos realizados',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.secondaryText,
                ),
              ),

              const SizedBox(height: 22),

              Row(
                children: [
                  Expanded(
                    child: _resumo(
                      Icons.fitness_center,
                      '12',
                      'Treinos',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _resumo(
                      Icons.timer_outlined,
                      '285',
                      'Minutos',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                'TREINOS REALIZADOS',
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 12),

              const TreinoHistoricoCard(
                titulo: 'Treino Laboral',
                detalhe: 'Hoje, 09:30 • 25 min',
              ),
              const TreinoHistoricoCard(
                titulo: 'Mobilidade e Alongamento',
                detalhe: '15/08/2026 • 22 min',
              ),
              const TreinoHistoricoCard(
                titulo: 'Pausa Ativa',
                detalhe: '14/08/2026 • 18 min',
              ),
              const TreinoHistoricoCard(
                titulo: 'Fortalecimento',
                detalhe: '12/08/2026 • 30 min',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _resumo(
    IconData icon,
    String valor,
    String titulo,
  ) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: AppColors.lightGreen,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.green,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                valor,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TreinoHistoricoCard extends StatelessWidget {
  final String titulo;
  final String detalhe;

  const TreinoHistoricoCard({
    super.key,
    required this.titulo,
    required this.detalhe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: AppColors.lightGreen,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              color: AppColors.green,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  detalhe,
                  style: const TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.chevron_right,
            color: AppColors.secondaryText,
          ),
        ],
      ),
    );
  }
}

class Placeholder extends StatelessWidget {
  final double width;

  const Placeholder({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 9,
      decoration: BoxDecoration(
        color: AppColors.placeholder,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
