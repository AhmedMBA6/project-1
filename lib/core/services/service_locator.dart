import 'package:first_project/core/database/cache/cache_helper.dart';
import 'package:first_project/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

///that methode used for put all the objects we need to use it
///in allaround the application any time with one space in memory
void setUpServiceLocator(){
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
  }