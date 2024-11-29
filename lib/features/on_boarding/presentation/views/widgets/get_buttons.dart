import 'package:first_project/core/functions/navigation.dart';
import 'package:first_project/core/utils/app_strings.dart';
import 'package:first_project/core/utils/app_text_styles.dart';
import 'package:first_project/core/widgets/custom_btn.dart';
import 'package:first_project/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:first_project/features/on_boarding/presentation/views/functions/on_boarding.dart';
import 'package:flutter/widgets.dart';

class GetButtons extends StatelessWidget {
  const GetButtons(
      {super.key, required this.currentIndex, required this.controller});
  final int currentIndex;
  final PageController controller;
  @override
  Widget build (BuildContext context) {
    if (currentIndex == onBoardingData.length - 1) {
      return Column(
        children: [
          Column(
            children: [
              CustomBtn(
                text: AppStrings.createAccount,
                onPressed: () {
                  onBoardingVisited();
                  customReplacementNavigate(context, "/signUp");
                },
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                  onTap: () {
                    onBoardingVisited();
                    customReplacementNavigate(context, "/signIn");
                  },
                  child: Text(
                    AppStrings.loginNow,
                    style: CustomTextStyles.poppins300style16
                        .copyWith(fontWeight: FontWeight.w400),
                  )),
            ],
          )
        ],
      );
    } else {
      return CustomBtn(
        text: AppStrings.next,
        onPressed: () {
          controller.nextPage(
              duration: const Duration(milliseconds: 20),
              curve: Curves.bounceIn);
        },
      );
    }
  }
}