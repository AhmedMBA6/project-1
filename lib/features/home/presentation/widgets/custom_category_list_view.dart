import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/core/utils/app_strings.dart';
import 'package:first_project/features/home/data/models/historical_character_model.dart';
import 'package:first_project/features/home/presentation/widgets/custom_category_list_view_item.dart';
import 'package:flutter/material.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection(FireBaseStrings.historicalCharacters).get(),
      builder: (context, snapshot){
        if (snapshot.hasError) {
          return const Text(FireBaseStrings.snapShotHasError);
        }
        if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
          return const Text(FireBaseStrings.snapShotHasDataButDoesNotExist);
        }
        if (snapshot.connectionState == ConnectionState.done) {
          List<HistoricalCharacterModel> historicalCharacters = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            historicalCharacters.add(HistoricalCharacterModel.fromJson(snapshot.data!.docs[i]));
          }
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
          return CustomCategoryListViewItem(model: historicalCharacters[index]);
        },
      ),
    );

        }
        return const Text(FireBaseStrings.loading);
      },
    );
  }
}




