import 'dart:async';

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ExercicioPage extends StatefulWidget {
  final String nome;
  const ExercicioPage({super.key, required this.nome});

  @override
  State<ExercicioPage> createState() => _ExercicioPageState();
}

class _ExercicioPageState extends State<ExercicioPage> {
  static const int _totalSeries = 3;
  static const int _duracaoSerie = 20;
  static const int _duracaoTransicao = 3;

  Timer? _timer;
  int _serieAtual = 1;
  int _segundos = _duracaoSerie;
  bool _emTransicao = false;
  bool _rodando = false;
  bool _concluido = false;

  void _alternarTimer() {
    if (_concluido) {
      Navigator.pop(context);
      return;
    }
    if (_rodando) {
      _timer?.cancel();
      setState(() => _rodando = false);
      return;
    }
    setState(() => _rodando = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _avancar());
  }

  void _avancar() {
    if (!mounted) return;
    setState(() {
      if (_segundos > 1) {
        _segundos--;
      } else if (_emTransicao) {
        _serieAtual++;
        _emTransicao = false;
        _segundos = _duracaoSerie;
      } else if (_serieAtual < _totalSeries) {
        _emTransicao = true;
        _segundos = _duracaoTransicao;
      } else {
        _timer?.cancel();
        _segundos = 0;
        _rodando = false;
        _concluido = true;
      }
    });
  }

  void _reiniciar() {
    _timer?.cancel();
    setState(() {
      _serieAtual = 1;
      _segundos = _duracaoSerie;
      _emTransicao = false;
      _rodando = false;
      _concluido = false;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.green,
        foregroundColor: Colors.white,
        title: Text(
          widget.nome,
          style: const TextStyle(
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

            Text(
              widget.nome,
              style: const TextStyle(
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

            _cronometroCard(),

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
                onPressed: _alternarTimer,
                icon: Icon(
                  _concluido
                      ? Icons.check_rounded
                      : _rodando
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                  size: 20,
                ),
                label: Text(
                  _concluido
                      ? 'CONCLUIR EXERCÍCIO'
                      : _rodando
                          ? 'PAUSAR'
                          : (_serieAtual == 1 && _segundos == _duracaoSerie)
                              ? 'INICIAR EXERCÍCIO'
                              : 'CONTINUAR',
                  style: const TextStyle(
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

  Widget _cronometroCard() {
    final double progresso = _emTransicao
        ? (_duracaoTransicao - _segundos) / _duracaoTransicao
        : (_duracaoSerie - _segundos) / _duracaoSerie;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _concluido
                    ? 'EXERCÍCIO CONCLUÍDO'
                    : _emTransicao
                        ? 'PRÓXIMA SÉRIE EM'
                        : 'SÉRIE $_serieAtual DE $_totalSeries',
                style: const TextStyle(
                  color: AppColors.green,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
              IconButton(
                onPressed: _reiniciar,
                tooltip: 'Reiniciar',
                icon: const Icon(Icons.refresh_rounded),
                color: AppColors.secondaryText,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _concluido ? '✓' : '$_segundos',
            style: TextStyle(
              color: _emTransicao ? AppColors.yellow : AppColors.green,
              fontSize: 64,
              height: 1,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _concluido
                ? 'Muito bem!'
                : _emTransicao
                    ? 'Prepare-se para continuar'
                    : _rodando
                        ? 'Mantenha o alongamento'
                        : 'Toque em iniciar quando estiver pronto',
            style: const TextStyle(
              color: AppColors.secondaryText,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: _concluido ? 1 : progresso.clamp(0.0, 1.0),
              minHeight: 7,
              color: _emTransicao ? AppColors.yellow : AppColors.green,
              backgroundColor: AppColors.lightGreen,
            ),
          ),
        ],
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
