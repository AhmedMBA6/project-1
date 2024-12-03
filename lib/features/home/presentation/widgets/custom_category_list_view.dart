import 'package:first_project/features/home/presentation/widgets/custom_category_list_view_Item.dart';
import 'package:flutter/material.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 16,
          );
        },
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (_, index) {
          return const CustomCategoryListViewItem();
        },
      ),
    );
  }
}
