import 'package:first_project/core/database/cache/cache_helper.dart';
import 'package:first_project/core/services/service_locator.dart';

void onBoardingVisited(){
  getIt<CacheHelper>().saveData(key: "isOnBoardingVisited", value: true);
}