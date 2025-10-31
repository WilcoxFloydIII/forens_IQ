import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_colors.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';
import 'package:forens_iq/core/utils/validators.dart';
import 'package:forens_iq/routes/route_names.dart';
import 'package:forens_iq/service/auth_service.dart';
import 'package:forens_iq/shared/layout/app_layout.dart';
import 'package:forens_iq/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool viewPassword = false;
  final _formKey = GlobalKey<FormState>();

  //Controllers
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSignup() {
    // Validate form
    if (_formKey.currentState?.validate() ?? false) {
      // All good – proceed to sign up logic
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Form is valid! Proceeding...')),
      // );
      AuthService.signIn();
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
      pageTitle: 'Sign Up',
      children: [
        Form(
          key: _formKey,
          child: Column(
            spacing: 24,
            children: [
              TextFormField(
                controller: _usernameController,
                validator: nameValidator,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(hintText: 'Username'),
              ),
              TextFormField(
                controller: _emailController,
                validator: (value) =>
                    requiredValidator(value) ?? emailValidator(value),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Email'),
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
              TextFormField(
                controller: _confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required Field';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: !viewPassword,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
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
              AppButton(
                onPressed: () => _onSignup(),
                height: 48,
                brandButton: true,
                text: 'Sign Up',
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.pushNamed(RouteName.signin);
                },
                child: Text(
                  'Already have an account? Sign In',
                  style: AppTextStyles.footer,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
