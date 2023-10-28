import 'package:estu_residencia_app/presentation/screens/screens.dart';
import 'package:estu_residencia_app/presentation/views/views.dart';

import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register/:step',
      name: RegisterScreen.name,
      builder: (context, state) {
        final stepIndex = state.pathParameters['step'] ?? '0';
        return RegisterScreen(stepIndex: int.parse(stepIndex));
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(
          childView: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const HomeView();
          },
        ),
        GoRoute(
          path: '/posts',
          builder: (context, state) {
            return const PostsView();
          },
        ),
        GoRoute(
          path: '/requests',
          builder: (context, state) {
            return const RequestsView();
          },
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) {
            return const ProfileView();
          },
        ),
      ],
    ),
  ],
);
