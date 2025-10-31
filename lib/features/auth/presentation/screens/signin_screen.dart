import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_colors.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';
import 'package:forens_iq/core/utils/validators.dart';
import 'package:forens_iq/service/auth_service.dart';
import 'package:forens_iq/shared/layout/app_layout.dart';
import 'package:forens_iq/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool viewPassword = false;
  final _formKey = GlobalKey<FormState>();

  //Controllers
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogIn() async {
    // Validate form
    if (_formKey.currentState?.validate() ?? false) {
      // All good – proceed to sign up logic
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Form is valid! Proceeding...')),
      // );

      await AuthService.signIn(); // ✅ Mark user as signed in
      if (context.mounted) {
        context.go('/home'); // Navigate to main shell branch
      }
    } else {
      // ScaffoldMessenger.of(
      //   context,
      // ).showSnackBar(const SnackBar(content: Text('Please fix the errors')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      pageTitle: 'ForensIQ',
      children: [
        Text('Welcome back', style: AppTextStyles.heading2),
        SizedBox(height: 24),
        Form(
          key: _formKey,
          child: Column(
            spacing: 24,
            children: [
              TextFormField(
                controller: _nameController,
                validator: nameValidator,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(hintText: 'Username or Email'),
              ),
              TextFormField(
                controller: _passwordController,
                validator: combinedPasswordValidator,
                keyboardType: TextInputType.visiblePassword,
                obscureText: !viewPassword,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffix: GestureDetector(
                    onTap: () {
                      setState(() {
                        viewPassword = !viewPassword;
                      });
                    },
                    child: Icon(
                      !viewPassword ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
              // Row(
              //   children: [
              //     GestureDetector(
              //       onTap: () {},
              //       child: Text(
              //         'Forgot password?',
              //         style: AppTextStyles.footer,
              //       ),
              //     ),
              //   ],
              // ),
              //For the forgot password logic which will be added later
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppButton(
                onPressed: _onLogIn,
                height: 48,
                brandButton: true,
                text: 'Log In',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
