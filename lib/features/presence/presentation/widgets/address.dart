import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  final String? address;

  const Address({super.key, this.address});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: CircleAvatar(child: Icon(Icons.location_on)),
        title: Text('Alamat lokasi'),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
        subtitle: Text(widget.address is String ? widget.address! : '...'),
        subtitleTextStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
