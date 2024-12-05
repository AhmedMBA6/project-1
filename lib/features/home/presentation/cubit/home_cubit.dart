import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/core/utils/app_strings.dart';
import 'package:first_project/features/home/data/models/historical_period_model.dart';
import 'package:first_project/features/home/data/models/wars_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<HistoricalPeriodModel> historicalPeriods = [];
  List<WarsModel> warsList = [];
  Future<void> getHistoricalPeriods() async {
    try {
      emit(GetHistoricalPeriodsLoading());
      await FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalPeriods)
          .get()
          .then((value) => value.docs.forEach((element) async {
                await getWarsList(element);
                emit(GetHistoricalPeriodsSuccess());
              }));
    } on Exception catch (e) {
      emit(GetHistoricalPeriodsFailure(errMessage: e.toString()));
    }
  }

  Future<void> getWarsList(
      QueryDocumentSnapshot<Map<String, dynamic>> element) async {
    await FirebaseFirestore.instance
        .collection(FireBaseStrings.historicalPeriods)
        .doc(element.id)
        .collection(FireBaseStrings.wars)
        .get()
        .then((value) => value.docs.forEach((element) {
              warsList.add(WarsModel.fromJson(element.data()));
            }));
    historicalPeriods
        .add(HistoricalPeriodModel.fromJson(element.data(), warsList));
  }
}
