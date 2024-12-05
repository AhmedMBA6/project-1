import 'package:first_project/core/models/data_model.dart';
import 'package:first_project/core/utils/app_strings.dart';
import 'package:first_project/features/home/data/models/wars_model.dart';

class HistoricalPeriodModel extends DataModel{
  final List<WarsModel> wars;

  HistoricalPeriodModel(
      {required super.name,
      required super.image,
      required super.description,
      required this.wars});

  factory HistoricalPeriodModel.fromJson(jsonData, warsList) {
    return HistoricalPeriodModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      description: jsonData[FireBaseStrings.description],
      wars: warsList,
    );
  }
}
