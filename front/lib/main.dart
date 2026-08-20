import 'package:flutter/material.dart';

import 'view/historico_page.dart';
import 'view/menu_page.dart';
import 'view/perfil_page.dart';
import 'view/relatorios_page.dart';
import 'view/treinos_page.dart';
import 'theme/app_colors.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const AcademiaIdeauApp());
}

class AcademiaIdeauApp extends StatelessWidget {
  const AcademiaIdeauApp({super.key});

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

  @override
  Widget build(BuildContext context) {
    final paginas = <Widget>[
      MenuPage(
        onSelecionarPagina: (index) => setState(() => paginaAtual = index),
      ),
      const TreinosPage(),
      const RelatoriosPage(),
      const HistoricoPage(),
      const PerfilPage(),
    ];
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: paginaAtual,
            children: paginas,
          ),

          Positioned(
            left: 16,
            right: 16,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.10),
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BottomNavigationBar(
                    currentIndex: paginaAtual,

                    type: BottomNavigationBarType.fixed,

                    backgroundColor: Colors.white,

                    elevation: 0,

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
                        icon: Icon(Icons.home_outlined, size: 22),
                        activeIcon: Icon(Icons.home_rounded, size: 22),
                        label: 'Início',
                      ),

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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
