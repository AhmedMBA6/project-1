import 'package:first_project/core/utils/app_strings.dart';
import 'package:first_project/core/widgets/custom_header_text.dart';
import 'package:first_project/features/home/data/models/historical_period_model.dart';
import 'package:first_project/features/home/presentation/widgets/custom_category_list_view.dart';
import 'package:first_project/features/home/presentation/widgets/home_sections/home_app_bar_section.dart';
import 'package:first_project/features/home/presentation/widgets/period_details_section.dart';
import 'package:first_project/features/home/presentation/widgets/period_wars_section.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodsDetailsView extends StatelessWidget {
  const HistoricalPeriodsDetailsView({super.key, required this.model});
  final HistoricalPeriodModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: HomeAppBarSection(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 7,
              ),
            ),
            SliverToBoxAdapter(
              child: PeriodDetailsSection(
                periodName: model.name,
                description: model.description,
                imageUrl: model.image,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 22,),),
            SliverToBoxAdapter(child: PeriodWarsSection(warsList: model.wars,),),
           const SliverToBoxAdapter(child: RecommendationsSection()),
          ],
        ),
      ),
    );
  }
}


class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historicalPeriods),
        SizedBox(height: 16,),
        CustomCategoryListView(),
        SizedBox(height: 32,),
      ],
    );
  }
}