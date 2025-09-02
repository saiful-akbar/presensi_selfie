import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final List<Map<String, dynamic>> menus = [
    {'icon': Icons.build, 'label': 'Dismantling'},
    {'icon': Icons.download, 'label': 'Change ONT'},
    {'icon': Icons.install_mobile, 'label': 'PSB Installation'},
    {'icon': Icons.assignment, 'label': 'PSB Survey'},
    {'icon': Icons.wifi, 'label': 'WMS'},
    {'icon': Icons.cable, 'label': 'PT2 Simple'},
    {'icon': Icons.security, 'label': 'Metra!'},
    {'icon': Icons.verified, 'label': 'QC Assurance'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text('Menu', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12), // ganti spacing
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 15,
          crossAxisSpacing: 10,
          children: menus.map((menu) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                Material(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () => {},
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        menu['icon'],
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Text(
                  menu['label'],
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
