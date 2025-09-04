import 'package:flutter/material.dart';
import 'package:presensi_selfie/core/widgets/app_scaffold.dart';
import 'package:presensi_selfie/features/check_absence/presentation/pages/check_absence_page.dart';
import 'package:presensi_selfie/features/home/presentation/pages/home_tab.dart';
import 'package:presensi_selfie/features/profile/presentation/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _tabs = [HomeTab(), CheckAbsencePage(), ProfilePage()];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        body: _tabs[_currentIndex],
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Theme(
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: BottomNavigationBar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  elevation: 0,
                  currentIndex: _currentIndex,
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
                  selectedItemColor: Theme.of(context).colorScheme.onPrimary,
                  unselectedFontSize: 12,
                  selectedFontSize: 14,
                  selectedLabelStyle: TextStyle(fontWeight: FontWeight.w900),
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
                  onTap: (value) {
                    setState(() {
                      _currentIndex = value;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      label: 'Home',
                      icon: Icon(Icons.home_outlined),
                      activeIcon: Icon(Icons.home),
                    ),
                    BottomNavigationBarItem(
                      label: 'Presensi',
                      icon: Icon(Icons.book_outlined),
                      activeIcon: Icon(Icons.book),
                    ),
                    BottomNavigationBarItem(
                      label: 'Profil',
                      icon: Icon(Icons.person_outline),
                      activeIcon: Icon(Icons.person),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
