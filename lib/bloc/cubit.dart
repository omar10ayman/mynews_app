import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today/bloc/states.dart';
import 'package:today/chache/chacheHelper.dart';
import 'package:today/dio/diohelper.dart';

// ignore: camel_case_types
class newsCubit extends Cubit<NewsStates> {
  newsCubit() : super(intialState());
  static newsCubit get(context) => BlocProvider.of(context);

  List<dynamic> bussenss = [];

  getDatabussenss() {
    emit(loadingBussiessData());
    dioHelper.getApi(path: 'v2/top-headlines', q: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '01c2888b62d746938a68e10ccaa4ca74'
    }).then((value) {
      bussenss = value?.data['articles'];
      emit(scussesgBussiessData());
    }).catchError((error) {
      emit(errorBussiessData(error));
    });
  }

  List<dynamic> sports = [];

  getDatasports() {
    emit(loadingSportsData());
    dioHelper.getApi(path: 'v2/top-headlines', q: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '01c2888b62d746938a68e10ccaa4ca74'
    }).then((value) {
      sports = value?.data['articles'];
      emit(scussesgSportsData());
    }).catchError((error) {
      emit(errorSportsData(error));
    });
  }

  List<dynamic> entertainment = [];

  getDataentertainment() {
    emit(loadingentertainmentData());
    dioHelper.getApi(path: 'v2/top-headlines', q: {
      'country': 'eg',
      'category': 'entertainment',
      'apiKey': '01c2888b62d746938a68e10ccaa4ca74'
    }).then((value) {
      entertainment = value?.data['articles'];
      emit(scussesgentertainmentData());
    }).catchError((error) {
      emit(errorentertainmentData(error));
    });
  }

  List<dynamic> technology = [];

  getDatatechnology() {
    emit(loadingenttechnologyData());
    dioHelper.getApi(path: 'v2/top-headlines', q: {
      'country': 'eg',
      'category': 'technology',
      'apiKey': '01c2888b62d746938a68e10ccaa4ca74'
    }).then((value) {
      technology = value?.data['articles'];
      emit(scussesgenttechnologyData());
    }).catchError((error) {
      emit(errorenttechnologyData(error));
    });
  }

  List<dynamic> health = [];

  getDatahealth() {
    emit(loadinghealthData());
    dioHelper.getApi(path: 'v2/top-headlines', q: {
      'country': 'eg',
      'category': 'health',
      'apiKey': '01c2888b62d746938a68e10ccaa4ca74'
    }).then((value) {
      health = value?.data['articles'];
      emit(scussesghealthData());
    }).catchError((error) {
      emit(errorhealthData(error));
    });
  }

  List<dynamic> science = [];

  getDatascience() {
    emit(loadingscienceData());
    dioHelper.getApi(path: 'v2/top-headlines', q: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '01c2888b62d746938a68e10ccaa4ca74'
    }).then((value) {
      science = value?.data['articles'];
      emit(scussesgscienceData());
    }).catchError((error) {
      emit(errorscienceData(error));
    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(loadingsearchData());
    dioHelper.getApi(path: 'v2/everything', q: {
      'q': value,
      'apiKey': '01c2888b62d746938a68e10ccaa4ca74'
    }).then((value) {
      search = value?.data['articles'];
      emit(scussesgsearchData());
    }).catchError((error) {
      emit(errorsearchData(error));
    });
  }

  bool isDark = false;
  darkMode({bool? fromShare}) {
    if (fromShare != null) {
      isDark = fromShare;
    } else {
      isDark = !isDark;
      chacheHelper.setData(key: 'isDark', value: isDark).then((value) {
        emit(darkModeState());
      });
    }
  }
}
