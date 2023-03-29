import 'package:flutter/material.dart';
import 'package:gaste_certo/src/ui/screens/register/widgets/register_form_widget.dart';
import 'package:gaste_certo/src/ui/screens/register/widgets/register_header_widget.dart';

class RegisterAccountScreen extends StatelessWidget {
  const RegisterAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1F24),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              // Header
              RegisterAccountHeader(),

              //Form
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
