import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_colors.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';
import 'package:forens_iq/features/main/presentation/widgets/profile_tile_widget.dart';
import 'package:forens_iq/routes/route_names.dart';
import 'package:forens_iq/service/auth_service.dart';
import 'package:forens_iq/shared/layout/app_layout.dart';
import 'package:forens_iq/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String username = 'Ethan Carter';
  final String email = 'ethancarter@gmail.com';
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      pageTitle: 'Profile',
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 128,
                      width: 128,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.brandSecondary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(username, style: AppTextStyles.heading2),
                SizedBox(height: 24),
                Row(children: [Text('Account', style: AppTextStyles.heading4)]),
                SizedBox(height: 8),
                ProfileTileWidget(
                  icon: Icons.mail_outline,
                  title: 'Email',
                  content: email,
                ),
                SizedBox(height: 8),
                ProfileTileWidget(
                  icon: Icons.lock_outline,
                  title: 'Password',
                  content: '********',
                ),

                SizedBox(height: 16),

                Row(
                  children: [Text('Settings', style: AppTextStyles.heading4)],
                ),
                SizedBox(height: 8),
                ProfileTileWidget(
                  icon: Icons.notifications_none_rounded,
                  title: 'Notifications',
                ),
                SizedBox(height: 8),
                ProfileTileWidget(icon: Icons.language, title: 'Language'),

                SizedBox(height: 16),

                Row(children: [Text('Support', style: AppTextStyles.heading4)]),
                SizedBox(height: 8),
                ProfileTileWidget(
                  icon: Icons.help_outline,
                  title: 'Help Center',
                ),
                SizedBox(height: 8),
                ProfileTileWidget(
                  icon: Icons.message_outlined,
                  title: 'Contact US',
                ),

                SizedBox(height: 40),

                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        onPressed: () async {
                          await AuthService.signOut();
                          context.goNamed(RouteName.welcome);
                        },
                        height: 40,
                        brandButton: false,
                        text: 'Log Out',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
