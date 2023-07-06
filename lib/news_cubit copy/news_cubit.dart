import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/NewsApp%20copy/business/business_screen.dart';
import 'package:messanger/NewsApp%20copy/science/science_screen.dart';
import 'package:messanger/NewsApp%20copy/sports/sports_screen.dart';
import 'package:messanger/network/remote/dio_helper.dart';
import 'package:messanger/news_cubit%20copy/news_state.dart';
import 'package:messanger/news_cubit/news_state.dart';

class newscubic extends Cubit<newsstates> {
  newscubic() : super(newsinitalstate());
  static newscubic get(context) => BlocProvider.of(context);
  int index = 0;
  void changebottombar(value) {
    index = value;

    emit(changebottombarstate());
  }

  List<Widget> body = [business(), sports(), science()];
  List<String> titles = ["Business", "Sports", "Science"];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.work), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];
  List<dynamic> busin = [];
  List<dynamic> sport = [];
  List<dynamic> scie = [];
  List<dynamic> search = [];
  void getbusiness() {
    emit(bussinessloadingstate());
    DioHelper.getDate(
      path: 'v2/top-headlines',
      query: {
        'category': 'business',
        'country': 'us',
        'apikey': 'c617c5f86f944aa3a7ff6c5f401e6a83'
      },
    ).then((value) {
      busin = value.data['articles'];
      emit(businesssucessstate());
    }).catchError((error) {
      print(error);
      emit(businesserrorstate());
    });
  }
  void getsport() {
    emit(sportloadingstate());
    DioHelper.getDate(
      path: 'v2/top-headlines',
      query: {
        'category': 'sport',
        'country': 'us',
        'apikey': 'c617c5f86f944aa3a7ff6c5f401e6a83'
      },
    ).then((value) {
      sport = value.data['articles'];
      emit(sportsucessstate());
    }).catchError((error) {
      print(error);
      emit(sporterrorstate());
    });
  }
  void getsciences() {
    emit(scienceloadingstate());
    DioHelper.getDate(
      path: 'v2/top-headlines',
      query: {
        'category': 'science',
        'country': 'us',
        'apikey': 'c617c5f86f944aa3a7ff6c5f401e6a83'
      },
    ).then((value) {
      scie = value.data['articles'];
      emit(sciencesucessstate());
    }).catchError((error) {
      print(error);
      emit(scienceerrorstate());
    });
  }
void getseach(String value) {
    emit(searchloadingstate());
    DioHelper.getDate(
      path: 'v2/top-headlines',
      query: {
        'q': '$value',
        'apikey': 'c617c5f86f944aa3a7ff6c5f401e6a83'
      },
    ).then((value) {
      search = value.data['articles'];
      emit(searchsucessstate());
    }).catchError((error) {
      print(error.toString());
      emit(searcherrorstate());
    });
  }
}
