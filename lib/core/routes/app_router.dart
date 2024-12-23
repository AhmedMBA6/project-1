import 'package:first_project/core/services/service_locator.dart';
import 'package:first_project/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:first_project/features/auth/presentation/views/forgot_password_view.dart';
import 'package:first_project/features/auth/presentation/views/sign_in_view.dart';
import 'package:first_project/features/auth/presentation/views/sign_up_view.dart';
import 'package:first_project/features/home/data/models/historical_period_model.dart';
import 'package:first_project/features/home/presentation/views/historical_periods_details_view.dart';
import 'package:first_project/features/home/presentation/widgets/home_nav_bar_widget.dart';
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
      path: "/forgotPassword",
      builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(), child: const ForgotPasswordView())),
          GoRoute(
    path: "/homeNavBar",
    builder: (context, state) => const HomeNavBarWidget(),
  ),
GoRoute(
    path: "/historicalPeriodsDetailsView",
    builder: (context, state) =>  HistoricalPeriodsDetailsView(model: state.extra as HistoricalPeriodModel),
  ),
]);

