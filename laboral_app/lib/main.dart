import 'package:flutter/material.dart';

import 'pages/treino_page.dart';
import 'pages/relatorios_page.dart';
import 'pages/historico_page.dart';
import 'pages/perfil_page.dart';
import 'theme/app_colors.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const LaboralApp());
}

class LaboralApp extends StatelessWidget {
  const LaboralApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laboral',
      theme: AppTheme.lightTheme,
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int paginaAtual = 0;

  final List<Widget> paginas = const [
    TreinoPage(),
    RelatoriosPage(),
    HistoricoPage(),
    PerfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: paginaAtual,
        children: paginas,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,

        type: BottomNavigationBarType.fixed,

        backgroundColor: Colors.white,

        selectedItemColor: AppColors.green,
        unselectedItemColor: const Color(0xFF858A86),

        selectedFontSize: 11,
        unselectedFontSize: 10,

        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w700,
        ),

        onTap: (index) {
          setState(() {
            paginaAtual = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fitness_center_rounded,
              size: 22,
            ),
            label: 'Treino',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart_rounded,
              size: 22,
            ),
            label: 'Relatórios',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month_outlined,
              size: 22,
            ),
            label: 'Histórico',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_rounded,
              size: 22,
            ),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}