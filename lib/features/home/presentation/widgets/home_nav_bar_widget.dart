import 'package:first_project/core/utils/app_assets.dart';
import 'package:first_project/core/utils/app_colors.dart';
import 'package:first_project/features/cart/presentation/views/cart_view.dart';
import 'package:first_project/features/home/presentation/cubit/home_cubit.dart';
import 'package:first_project/features/home/presentation/views/home_view.dart';
import 'package:first_project/features/profile/presentation/views/profile_view.dart';
import 'package:first_project/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentTabController _controller = PersistentTabController();

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreen(),
      controller: _controller,
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.primaryColor,
      decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      )),
    );
  }
}

List<Widget> _buildScreen() {
  return [
    BlocProvider(
      create: (context) => HomeCubit()..getHistoricalPeriods(),
      child: const HomeView(),
    ),
    const CartView(),
    const SearchView(),
    const ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesHomeIconActive),
        inactiveIcon: SvgPicture.asset(Assets.imagesHomeIcon)),
    PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesShoppingCartActive),
        inactiveIcon: SvgPicture.asset(Assets.imagesShoppingCart)),
    PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesShoppingCartActive),
        inactiveIcon: SvgPicture.asset(Assets.imagesShoppingCart)),
    PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesPersonActive),
        inactiveIcon: SvgPicture.asset(Assets.imagesPerson)),
  ];
}
