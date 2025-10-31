import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_colors.dart';
import 'package:go_router/go_router.dart';

class MainShell extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const MainShell({super.key, required this.navigationShell});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  DateTime? _lastPressedAt;

  void _onTap(int index) {
    widget.navigationShell.goBranch(index);
  }

  Future<bool> _handlePop() async {
    // If user is not on the first tab, go to first tab instead of exiting
    if (widget.navigationShell.currentIndex != 0) {
      widget.navigationShell.goBranch(0);
      return false;
    }

    final now = DateTime.now();
    if (_lastPressedAt == null ||
        now.difference(_lastPressedAt!) > const Duration(seconds: 2)) {
      _lastPressedAt = now;

      return false;
    }

    return true; // exit app
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Prevents automatic popping by the system
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final shouldExit = await _handlePop();
          if (shouldExit) {
            // Exit the app
            Future.delayed(
              Duration.zero,
              () => Navigator.of(context).maybePop(),
            );
          }
        }
      },
      child: Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            canvasColor: AppColors.bottomNavBar,
            splashFactory:
                NoSplash.splashFactory, // <- removes ripple completely
          ),

          child: BottomNavigationBar(
            currentIndex: widget.navigationShell.currentIndex,
            onTap: _onTap,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: AppColors.textSecondary,
            selectedItemColor: AppColors.textPrimary,
            backgroundColor: AppColors.bottomNavBar,
            enableFeedback: false,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            elevation: 0,

            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled, color: AppColors.textSecondary),
                activeIcon: Icon(
                  Icons.home_filled,
                  color: AppColors.textPrimary,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_rounded,
                  color: AppColors.textSecondary,
                  size: 28,
                ),
                activeIcon: Icon(
                  Icons.add_rounded,
                  color: AppColors.textPrimary,
                  weight: 1000,
                  size: 28,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard, color: AppColors.textSecondary),
                activeIcon: Icon(Icons.dashboard, color: AppColors.textPrimary),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                activeIcon: Icon(Icons.person_rounded),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
