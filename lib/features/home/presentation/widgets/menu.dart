import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final List<Map<String, dynamic>> menus = [
    {'icon': Icons.apartment_outlined, 'label': 'Masuk'},
    {'icon': Icons.home_outlined, 'label': 'Pulang'},
    {'icon': Icons.nights_stay_outlined, 'label': 'Lembur'},
    {'icon': Icons.checklist_outlined, 'label': 'Cek Absen'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Text(
          'Menu',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: menus.map((menu) {
            return ButtonMenu(icon: menu['icon'], label: menu['label']);
          }).toList(),
        ),
      ],
    );
  }
}

// Button menu
class ButtonMenu extends StatelessWidget {
  final IconData icon;
  final String label;

  const ButtonMenu({super.key, required this.icon, required this.label});

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
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () => {},
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 35,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 75,
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
