import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/news_states.dart';
import 'package:news/moduels/business_screen/business_screen.dart';
import 'package:news/moduels/sicence_screen/science_screen.dart';
import 'package:news/moduels/sports_screen/sport_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../networks/remote/dio_helper.dart';
import 'dart:convert';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InatialAppState());

  NewsCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;

  List<BottomNavigationBarItem> BottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];

  void ChangeBotNav(int index) {
    currentindex = index;
    if(index ==1) {
      getSportsData();
    }
    if(index==2) {
      getScienceData();
    }
    emit(BotNavAppState());
  }

  List<Widget> screens = [
    const Business_Screen(),
    const Sport_Screen(),
    const Science_Screen(),
  ];

  List Business = [];

  void getBusinessData() {
    emit(NewsLoadingBusinessState());
    Dio_Helper.getData('v2/top-headlines', {
      'country': 'us',
      'category': 'business',
      'apikey': '',
    }).then((value) {
      Business = value?.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error));
    });
  }

  List Sports = [];

  void getSportsData() {
    emit(NewsLoadingSportsState());

    if(Sports.length == 0)
    {
      Dio_Helper.getData('v2/top-headlines', {
        'country': 'us',
        'category': 'sports',
        'apikey': '',
      }).then((value) {
        Sports = value?.data['articles'];
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error));
      });
    } else{
      emit(NewsGetSportsSuccessState());
    }


  }

  List Science = [];

  void getScienceData() {
    if(Science.length == 0)
    {
      Dio_Helper.getData('v2/top-headlines', {
        'country': 'us',
        'category': 'science',
        'apikey': '',
      }).then((value) {
        Science = value?.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error));
      });
    } else{
      emit(NewsGetScienceSuccessState());
    }

    emit(NewsLoadingScienceState());
  }


List<dynamic>? search = [];

   void getSearchData(String value)

  {

    emit(NewsLoadingSearchState());

    Dio_Helper.getData('v2/everything', {
      'q': '$value',
      'apikey': '',
    }).then((value) {
      search = value?.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error));
    });
  }


}








