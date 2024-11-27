import 'package:first_project/core/functions/navigation.dart';
import 'package:first_project/features/on_boarding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:first_project/features/on_boarding/presentation/views/widgets/get_buttons.dart';
import 'package:first_project/features/on_boarding/presentation/views/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 40,
              ),
              CustomNavBar(
                onTap: () {
                  customReplacementNavigate(context, "/signUp");
                },
              ),
              OnBoardingWidgetBody(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              const SizedBox(
                height: 88,
              ),
              GetButtons(currentIndex: currentIndex, controller: _controller),
              const SizedBox(
                height: 17,
              )
            ],
          ),
        ),
      ),
    );
  }
}

