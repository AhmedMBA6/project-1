import 'package:first_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerCategory extends StatelessWidget {
  const CustomShimmerCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          height: 96,
          child: Shimmer.fromColors(
            baseColor: AppColors.deepGrey,
            highlightColor: AppColors.lightGrey,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.deepGrey
              ),
            ),
          ),
        ),
        const SizedBox(width: 16,),
        SizedBox(
          width: 150,
          height: 96,
          child: Shimmer.fromColors(
            baseColor: AppColors.deepGrey,
            highlightColor: AppColors.grey,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.deepGrey
              ),
            ),
          ),
        ),
      ],
    );
  }
}
