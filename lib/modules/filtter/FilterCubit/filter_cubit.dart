import 'package:bloc/bloc.dart';
import 'package:bookya/modules/bookingStatus/data/network/helper/dio_helper.dart';
import 'package:bookya/modules/filtter/data/Models/FacilitiesModel.dart';
import 'package:bookya/modules/filtter/data/Models/SearchModel.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/filterEndPoints.dart';
import 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());

  static FilterCubit get(context)=>BlocProvider.of(context);

   FacilitiesData ?facilitiesData;
   SearchData ?searchData;

 Future<void>  getFacilities()async{
  await  FinalDioHelper.getData(
        url: filterUrl,
        query: {}).then((value) {
         emit(LoadingStateGetFacilities());
          facilitiesData=FacilitiesData.fromJson(value.data);
          debugPrint(facilitiesData!.data.toString());

          emit(SuccessStateGetFacilities());


    }).catchError((error){

      emit(ErrorStateGetFacilities(error));
    });
  }

 Future <void> getSearch({
     List<int> ?facilityId,
     String? maxPrice,
     String? minPrice,
  })async {
    FinalDioHelper.getData(
        url: searchUrl,
        query: {
        'max_price':maxPrice,
        'min_price':minPrice,
        'facilities[0]':facilityId??[7],
        }).then((value) {
        // debugPrint(value.data.toString());
      emit(LoadingStateGetSearch());
      searchData=SearchData.fromJson(value.data);
      searchData!.faciltydata!.hotelData!.forEach((element) {
        debugPrint(element.name);

      });
      // debugPrint(searchData!.faciltydata!.hotelData![0].name);
      debugPrint(searchData!.faciltydata!.hotelData!.length.toString()+'Data List lenght');
      emit(SuccessStateGetSearch());
    }).catchError((error){
      print(error.toString());
      emit(ErrorStateGetSearch(error));
    });
  }

}
