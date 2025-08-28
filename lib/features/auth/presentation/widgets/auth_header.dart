import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.paddingTop,
    required this.screenHeight,
    required this.screenWidt,
  });

  final double paddingTop;
  final double screenHeight;
  final double screenWidt;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidt,
      child: Row(
        children: [
          Image.asset('assets/images/phone_hand.png', width: 130, height: 130),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Silakan login untuk masuk aplikasi',
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
