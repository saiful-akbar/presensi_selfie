import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final int index;
  final ValueChanged<int> onTap;

  const BottomNavigation({super.key, required this.index, required this.onTap});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(color: Colors.grey.shade300, blurRadius: 3, offset: const Offset(0, -1)),
          ],
        ),
        child: Theme(
          data: Theme.of(context).copyWith(splashColor: Colors.transparent),
          child: ClipRRect(
            child: BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              elevation: 0,
              currentIndex: widget.index,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              selectedFontSize: 12,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w900),
              unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
              unselectedFontSize: 12,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
              onTap: (value) => widget.onTap(value),
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
    );
  }
}
