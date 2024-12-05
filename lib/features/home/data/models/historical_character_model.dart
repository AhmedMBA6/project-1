import 'package:first_project/core/models/data_model.dart';
import 'package:first_project/core/utils/app_strings.dart';

class HistoricalCharacterModel extends DataModel {
  HistoricalCharacterModel(
      {required super.name, required super.image, required super.description});

  factory HistoricalCharacterModel.fromJson(jsonData) {
    return HistoricalCharacterModel(
        name: jsonData[FireBaseStrings.name],
        image: jsonData[FireBaseStrings.image],
        description: jsonData[FireBaseStrings.description]);
  }
}
