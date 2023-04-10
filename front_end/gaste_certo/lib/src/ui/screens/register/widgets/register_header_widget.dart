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
        Center(
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Text(
                  "Crie sua conta",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Text(
                  "Crie sua conta com suas informações, para ter acesso ao app.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 90, 83, 83),
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
