import 'package:forens_iq/features/auth/presentation/screens/learn_more_screen.dart';
import 'package:forens_iq/features/auth/presentation/screens/signin_screen.dart';
import 'package:forens_iq/features/auth/presentation/screens/signup_screen.dart';
import 'package:forens_iq/features/main/main_shell.dart';
import 'package:forens_iq/features/main/presentation/screens/add_screen.dart';
import 'package:forens_iq/features/main/presentation/screens/history_screen.dart';
import 'package:forens_iq/features/main/presentation/screens/home_screen.dart';
import 'package:forens_iq/features/main/presentation/screens/profile_screen.dart';
import 'package:forens_iq/features/main/presentation/sub_screens/chat_screen.dart';
import 'package:forens_iq/features/main/presentation/sub_screens/full_scan_details_screen.dart';
import 'package:forens_iq/service/auth_service.dart';
import 'package:forens_iq/features/auth/presentation/screens/welcome_screen.dart';
import 'package:forens_iq/routes/route_names.dart';
import 'package:forens_iq/shared/widgets/page_transition.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) async {
    final isSignedIn = await AuthService.checkAuthStatus();
    final goingToWelcome = state.fullPath?.startsWith('/welcome') ?? false;

    if (!isSignedIn && !goingToWelcome) {
      return '/welcome';
    } else if (isSignedIn && goingToWelcome) {
      return '/home';
    }
    return null;
  },

  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) async {
        final isSignedIn = await AuthService.checkAuthStatus();
        return isSignedIn ? '/home' : '/welcome';
      },
    ),
    GoRoute(
      name: RouteName.welcome,
      path: '/welcome',
      pageBuilder: (context, state) => platformTransition(
        key: state.pageKey,
        child: WelcomeScreen(),
        context: context,
      ),
      routes: [
        GoRoute(
          name: RouteName.learnMore,
          path: 'learn-more',
          pageBuilder: (context, state) => platformTransition(
            key: state.pageKey,
            child: LearnMoreScreen(),
            context: context,
          ),
        ),
        GoRoute(
          name: RouteName.signup,
          path: 'signup',
          pageBuilder: (context, state) => platformTransition(
            key: state.pageKey,
            child: SignupScreen(),
            context: context,
          ),
        ),
        GoRoute(
          name: RouteName.signin,
          path: 'signin',
          pageBuilder: (context, state) => platformTransition(
            key: state.pageKey,
            child: SigninScreen(),
            context: context,
          ),
        ),
      ],
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainShell(navigationShell: navigationShell),
      branches: [
        // Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.home,
              path: '/home',
              pageBuilder: (context, state) => platformTransition(
                key: state.pageKey,
                child: HomeScreen(),
                context: context,
              ),
            ),
          ],
        ),

        // Add
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.add,
              path: '/add',
              pageBuilder: (context, state) => platformTransition(
                key: state.pageKey,
                child: AddScreen(),
                context: context,
              ),
            ),
          ],
        ),

        // Messages
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.history,
              path: '/history',
              pageBuilder: (context, state) => platformTransition(
                key: state.pageKey,
                child: HistoryScreen(),
                context: context,
              ),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) {
                    final scanId = state.pathParameters['id'];
                    return FullScanDetailsScreen(id: scanId!);
                  },
                ),
              ],
            ),
          ],
        ),

        // Profile
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.profile,
              path: '/profile',
              pageBuilder: (context, state) => platformTransition(
                key: state.pageKey,
                child: ProfileScreen(),
                context: context,
              ),
            ),
          ],
        ),
      ],
    ),

    //Chat Screen
    GoRoute(
      name: RouteName.aiChat,
      path: '/ai-chat',
      pageBuilder: (context, state) => platformTransition(
        key: state.pageKey,
        child: ChatScreen(),
        context: context,
      ),
    ),
  ],
);
