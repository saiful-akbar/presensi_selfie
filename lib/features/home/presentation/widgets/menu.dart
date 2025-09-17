import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final List<Map<String, dynamic>> menus = [
    {'icon': Icons.apartment, 'label': 'Masuk', 'route': '/check-in'},
    {'icon': Icons.home, 'label': 'Pulang', 'route': '/check-out'},
    {'icon': Icons.nights_stay, 'label': 'Lembur', 'route': null},
    {'icon': Icons.checklist, 'label': 'Cek Absen', 'route': null},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            'Menu',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: menus.map((menu) {
              return ButtonMenu(icon: menu['icon'], label: menu['label'], route: menu['route']);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// Button menu
class ButtonMenu extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? route;

  const ButtonMenu({super.key, required this.icon, required this.label, this.route});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        Material(
          elevation: 2,
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () {
              if (route is String) {
                Navigator.pushNamed(context, route!);
              }
            },
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
        SizedBox(
          width: 75,
          child: Text(
            label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
