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
      path: '/register/complete',
      name: RegisterCompleteScreen.name,
      builder: (context, state) => const RegisterCompleteScreen(),
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
          path: '/myrequests',
          builder: (context, state) {
            return const MyRequestsView();
          },
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) {
            return const ProfileView();
          },
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) {
            return const SearchPlaceView();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/property/:postId',
      name: PropertyDetailScreen.name,
      builder: (context, state) {
        final postId = state.pathParameters['postId'] ?? '0';
        return PropertyDetailScreen(postId: int.parse(postId));
      },
    ),
    GoRoute(
      path: '/validate/:role',
      name: ValidationScreen.name,
      builder: (context, state) {
        final stepIndex = state.pathParameters['role'] ?? '0';
        return ValidationScreen(role: int.parse(stepIndex));
      },
    ),
    GoRoute(
      path: '/publish/:step',
      name: PublishPropertyScreen.name,
      builder: (context, state) {
        final stepIndex = state.pathParameters['step'] ?? '0';
        return PublishPropertyScreen(stepIndex: int.parse(stepIndex));
      },
    ),
  ],
);
