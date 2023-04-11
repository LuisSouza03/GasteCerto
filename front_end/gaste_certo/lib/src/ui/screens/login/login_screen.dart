import 'package:flutter/material.dart';
import 'package:gaste_certo/src/ui/screens/login/widgets/login_form_widget.dart';
import 'package:gaste_certo/src/ui/screens/login/widgets/login_header_widget.dart';

class LoginAccountScreen extends StatelessWidget {
  const LoginAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              // Header
              LoginAccountHeader(),

              //Form
              LoginAccountForm()
            ],
          ),
        ),
      ),
    );
  }
}
