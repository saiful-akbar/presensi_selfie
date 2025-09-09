import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({super.key});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        FilledButton.icon(
          onPressed: () {},
          style: FilledButton.styleFrom(
            elevation: 1,
            minimumSize: Size(double.infinity, 50),
          ),
          label: Text('Kirim'),
          icon: Icon(Icons.send),
        ),
        FilledButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          style: FilledButton.styleFrom(
            elevation: 1,
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
          label: Text('Batal'),
          icon: Icon(Icons.close),
        ),
      ],
    );
  }
}
