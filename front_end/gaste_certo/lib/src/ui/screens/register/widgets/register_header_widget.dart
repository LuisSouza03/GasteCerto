import 'package:flutter/material.dart';

class RegisterAccountHeader extends StatelessWidget {
  const RegisterAccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  Image.asset(
                    'lib/assets/images/gastecerto_logo.png',
                    width: 170,
                    height: 60,
                  ),
                  const Text(
                    "GasteCerto",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Text(
            "Get Started",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Text(
            "Crie sua conta",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
