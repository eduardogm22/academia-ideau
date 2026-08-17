import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class RelatoriosPage extends StatelessWidget {
  const RelatoriosPage({super.key});

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
                'RELATÓRIOS',
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'Acompanhe sua meta semanal',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.secondaryText,
                ),
              ),

              const SizedBox(height: 22),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'META DA SEMANA',
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 18),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _info(
                          Icons.timer_outlined,
                          '60 min',
                          'Realizados',
                        ),
                        _info(
                          Icons.flag_outlined,
                          '150 min',
                          'Meta',
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const LinearProgressIndicator(
                        value: 0.4,
                        minHeight: 7,
                        color: AppColors.green,
                        backgroundColor: Color(0xFFE9ECEA),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      '40% concluído',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFEEB),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.yellow,
                  ),
                ),
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.yellow,
                      child: Icon(
                        Icons.info_outline,
                        size: 20,
                        color: AppColors.text,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Complete 150 minutos semanais para atingir sua meta.',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.text,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'PERÍODO',
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 12),

              _linha(
                Icons.calendar_today_outlined,
                'Data de início',
                '12/08/2026',
              ),

              _linha(
                Icons.event_outlined,
                'Data de fim',
                '18/08/2026',
              ),

              _linha(
                Icons.verified_outlined,
                'Situação do benefício',
                'Ativo',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _info(
    IconData icon,
    String valor,
    String label,
  ) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            color: AppColors.lightGreen,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.green,
            size: 21,
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
              label,
              style: const TextStyle(
                color: AppColors.secondaryText,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _linha(
    IconData icon,
    String titulo,
    String valor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.green,
            size: 21,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              titulo,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            valor,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
