

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_projects/shared/cubit/states.dart';
import '../networks/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitailState());

  static AppCubit get(context) =>
      BlocProvider.of(context); // function return object from AppCubit



  bool isDark = false;
  void changeMode({@required bool? fromsahred}) {
    if (fromsahred != null) {
      isDark = fromsahred;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }
}
