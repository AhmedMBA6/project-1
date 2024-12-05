import 'package:first_project/core/utils/app_colors.dart';
import 'package:first_project/core/utils/app_text_styles.dart';
import 'package:first_project/features/home/data/models/historical_character_model.dart';
import 'package:flutter/material.dart';

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem({super.key, required this.model});
  final HistoricalCharacterModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 74,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.grey,
                      blurRadius: 10,
                      offset: const Offset(0, 5)),
                ],
              ),
              child: Container(
                width: 74,
                height: 96,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image:  DecorationImage(
                      image: NetworkImage(model.image), fit: BoxFit.fill),
                ),
              )),
          Text(
            model.name,
            style: CustomTextStyles.poppins500style14,
          )
        ],
      ),
    );
  }
}
