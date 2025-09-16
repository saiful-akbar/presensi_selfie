import 'package:flutter/material.dart';
import 'package:presensi_selfie/core/utilities/location_utility.dart';
import 'package:presensi_selfie/core/utilities/notification_utility.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  String _address = '';

  // Mengambil alamat lokasi
  Future<void> _getAddress() async {
    final location = LocationUtility();
    final notification = NotificationUtility(context);

    setState(() {
      _address = 'Mencari lokasi...';
    });

    try {
      final address = await location.getAddress();

      setState(() {
        _address = address;
      });
    } catch (e) {
      setState(() {
        _address = 'Unknown';
      });

      if (mounted) {
        notification.error(e.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            'Alamat Lokasi',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),

          Text(_address, style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
