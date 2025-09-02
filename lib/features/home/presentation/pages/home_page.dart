import 'package:flutter/material.dart';
import 'package:presensi_selfie/core/widgets/app_scaffold.dart';
import 'package:presensi_selfie/features/check_absence/presentation/pages/check_absence_page.dart';
import 'package:presensi_selfie/features/home/presentation/pages/home_tab.dart';
import 'package:presensi_selfie/features/home/presentation/widgets/check_location.dart';
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
        appBar: AppBar(
          leadingWidth: 60,
          leading: Padding(
            padding: const EdgeInsets.only(left: 18),
            child: CircleAvatar(
              radius: 10,
              child: Text('S', style: TextStyle(fontSize: 20)),
            ),
          ),
          title: Text(
            'Saiful Akbar',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          actions: [CheckLocation()],
          actionsPadding: EdgeInsets.only(right: 18),
        ),
        body: SingleChildScrollView(child: _tabs[_currentIndex]),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(splashColor: Colors.transparent),
            child: BottomNavigationBar(
              elevation: 10,
              currentIndex: _currentIndex,
              unselectedItemColor: Colors.grey.shade700,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              selectedItemColor: Theme.of(context).colorScheme.primary,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home_rounded),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book_outlined),
                  activeIcon: Icon(Icons.menu_book),
                  label: 'Cek Absen',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'Profil',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
