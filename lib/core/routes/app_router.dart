import 'package:first_project/core/services/service_locator.dart';
import 'package:first_project/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:first_project/features/auth/presentation/views/sign_in_view.dart';
import 'package:first_project/features/auth/presentation/views/sign_up_view.dart';
import 'package:first_project/features/home/presentation/views/home_view.dart';
import 'package:first_project/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:first_project/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const SplashView()),
  GoRoute(
    path: "/onBoarding",
    builder: (context, state) => const OnBoardingView(),
  ),
  GoRoute(
      path: "/signUp",
      builder: (context, state) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const SignUpView(),
          )),
  GoRoute(
      path: "/signIn",
      builder: (context, state) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const SignInView(),
          )),
          GoRoute(
      path: "/home",
      builder: (context, state) =>  const HomeView(),
          ),
]);
