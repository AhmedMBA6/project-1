import 'package:first_project/core/utils/app_strings.dart';
import 'package:first_project/core/widgets/custom_header_text.dart';
import 'package:first_project/features/home/presentation/widgets/historical_periods.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodsSection extends StatelessWidget {
  const HistoricalPeriodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         CustomHeaderText(
           text: AppStrings.historicalPeriods,
         ),
            SizedBox(
              height: 16,
            ),
            HistoricalPeriods(),
            SizedBox(
              height: 32,
            ),
      ],
    );
  }
}

