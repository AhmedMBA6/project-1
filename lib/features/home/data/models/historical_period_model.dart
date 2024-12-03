import 'package:first_project/core/utils/app_strings.dart';

class HistoricalPeriodModel {
  final String name;
  final String image;
  final String discription;
  final Map<String, dynamic> wars;

  HistoricalPeriodModel(
      {required this.name,
      required this.image,
      required this.discription,
      required this.wars});

  factory HistoricalPeriodModel.fromJson(jsonData) {
    return HistoricalPeriodModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      discription: jsonData[FireBaseStrings.decoration],
      wars: jsonData[FireBaseStrings.wars],
    );
  }
}
