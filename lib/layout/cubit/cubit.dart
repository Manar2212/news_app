import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_projects/layout/cubit/states.dart';
import '../../../shared/networks/remote/dio_helper.dart';
import '../../modules/business_screen/business_screen.dart';
import '../../modules/science_screen/science_screen.dart';
import '../../modules/sports_screen/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Science'),
    //BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> screes = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    //SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentindex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(GetBusinessLoadingStatae());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['urlToImage']);
      emit(GetBusinessSuccessState());
    }).catchError((error) {
      emit(GetBusinessErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(GetSportsLoadingStatae());

    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
      }).then((value) {
        sports = value.data['articles'];
        print(sports[0]['urlToImage']);
        emit(GetSportsSuccessState());
      }).catchError((error) {
        emit(GetSportsErrorState(error.toString()));
        print(error.toString());
      });
    } else {
      emit(GetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(GetScienceLoadingStatae());
    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
      }).then((value) {
        science = value.data['articles'];
        print(science[0]['urlToImage']);
        emit(GetScienceSuccessState());
      }).catchError((error) {
        emit(GetScienceErrorState(error.toString()));
        print(error.toString());
      });
    } else {
      emit(GetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(GetSearchLoadingStatae());
    if (search.length == 0) {
      DioHelper.getData(url: 'v2/everything', query: {
        'q': '$value',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
      }).then((value) {
        search = value.data['articles'];
        print(search[0]['urlToImage']);
        emit(GetSearchSuccessState());
      }).catchError((error) {
        emit(GetSearchErrorState(error.toString()));
        print(error.toString());
      });
    } else {
      emit(GetSearchSuccessState());
    }
  }
}
