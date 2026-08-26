import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'exercicio_page.dart';

class TreinoPage extends StatelessWidget {
  const TreinoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const TreinoHeader(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TreinoResumoCard(),

                        SizedBox(height: 22),

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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CABEÇALHO

class TreinoHeader extends StatelessWidget {
  const TreinoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 22),
      decoration: const BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(34),
        ),
      ),
      child: const Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MEU TREINO',
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    letterSpacing: -0.5,
                    wordSpacing: -1.5,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Seu treino laboral de hoje',
                  style: TextStyle(
                    color: Color(0xFFE3F0E8),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          NotificacaoIcon(),
        ],
      ),
    );
  }
}

class NotificacaoIcon extends StatelessWidget {
  const NotificacaoIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(
          Icons.notifications_none_rounded,
          color: Colors.white,
          size: 27,
        ),
        Positioned(
          right: 0,
          top: -1,
          child: Container(
            width: 9,
            height: 9,
            decoration: const BoxDecoration(
              color: AppColors.yellow,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
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
              builder: (_) => const ExercicioPage(nome: 'teste',),
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