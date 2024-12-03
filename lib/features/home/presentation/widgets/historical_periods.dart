import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/core/utils/app_colors.dart';
import 'package:first_project/core/utils/app_strings.dart';
import 'package:first_project/core/utils/app_text_styles.dart';
import 'package:first_project/features/home/data/models/historical_period_model.dart';
import 'package:flutter/material.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection(FireBaseStrings.historicalPeriods).get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Somthing went wrong");
        }
        if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
          return const Text("Document does not exist");
        }
        if(snapshot.connectionState == ConnectionState.done){
          List<HistoricalPeriodModel> historicalPeriods = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            historicalPeriods.add(HistoricalPeriodModel.fromJson(snapshot.data!.docs[i]));
          }
          return SizedBox(
          height: 96,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10,);
            },
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return HistoricalPeriodItems(model: historicalPeriods[index],);
            },
          ),
        );
        }
        return const Text("Loading...");
      }
    );
  }
}


class HistoricalPeriodItems extends StatelessWidget {
  const HistoricalPeriodItems({super.key, required this.model});
 final  HistoricalPeriodModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 96,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), boxShadow: [
        BoxShadow(
          color: AppColors.grey,
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ]),
      child: Row(
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
          Container(
            height: 64,
            width: 47,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(model.image),
            )),
          )
        ],
      ),
    );
  }
}
