import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ExercicioPage extends StatelessWidget {
  const ExercicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.green,
        foregroundColor: Colors.white,
        title: const Text(
          'Alongamento de Pescoço',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_circle_outline_rounded,
                  size: 55,
                  color: AppColors.green,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Alongamento de Pescoço',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Mobilidade para aliviar tensões na região cervical.',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.secondaryText,
              ),
            ),

            const SizedBox(height: 22),

            Row(
              children: [
                Expanded(
                  child: _dado(
                    'Séries',
                    '3',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _dado(
                    'Repetições',
                    '20 segundos',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: _dado(
                    'Peso',
                    'Corporal',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _dado(
                    'Descanso',
                    '15 seg',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'COMO FAZER',
              style: TextStyle(
                color: AppColors.green,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: AppColors.border,
                ),
              ),
              child: const Text(
                'Incline lentamente a cabeça para um dos lados, aproximando a orelha do ombro. Mantenha a posição por 20 segundos e repita para o outro lado.',
                style: TextStyle(
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.check_rounded,
                  size: 20,
                ),
                label: const Text(
                  'CONCLUIR EXERCÍCIO',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dado(
    String titulo,
    String valor,
  ) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              color: AppColors.secondaryText,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            valor,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: AppColors.green,
            ),
          ),
        ],
      ),
    );
  }
}
