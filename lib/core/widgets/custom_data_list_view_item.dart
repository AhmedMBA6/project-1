import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_project/core/functions/navigation.dart';
import 'package:first_project/core/models/data_model.dart';
import 'package:first_project/core/utils/app_colors.dart';
import 'package:first_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomDataListViewItems extends StatelessWidget {
  const CustomDataListViewItems ({super.key, required this.model, required this.routePath});
  final DataModel model;
  final String routePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
customNavigate(context, routePath, extra: model);
      },
      child: Container(
        width: 164,
        height: 96,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.grey,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                height: 48,
                width: 62,
                child: Text(
                  model.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.poppins500style24
                      .copyWith(fontSize: 16, color: AppColors.deepBrown),
                ),
              ),
              SizedBox(
                height: 64,
                width: 47,
                child: CachedNetworkImage(
                  imageUrl: model.image,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: AppColors.deepGrey,
                    highlightColor: Colors.white,
                    child: Container(
                      width: 47,
                      height: 64,
                      color: AppColors.grey,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
