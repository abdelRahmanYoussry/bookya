

import 'package:bookya/modules/map/data/hotels_response.dart';
import 'package:bookya/shared/network/dio_helper.dart';

class HotelsApi {
  DioHelper dioHelper = DioHelper();
  dynamic getHotels()async{
    var response = await dioHelper.get(false, "hotels?count=10&page=1");
    if(response is String ){
      return response;
    }
   HotelsResponse hotelsResponse = HotelsResponse.fromJson(response);
    return hotelsResponse;
  }

}