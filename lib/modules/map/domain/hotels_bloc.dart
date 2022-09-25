import 'package:bookya/modules/map/data/hotels_api.dart';
import 'package:bookya/modules/map/data/hotels_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
class HotelsBloc extends Cubit<HotelsState>{
  HotelsBloc() : super(EmptyHotelsState());
  HotelsApi hotelsApi = HotelsApi();
  getHotels()async {
    var result = await hotelsApi.getHotels();
    if(result is String){
      emit(ErrorHotelsState(result));
    }else if(result is HotelsResponse){
      emit(SuccessHotelsState(getMarkersFromHotels(result)));
    }
  }
  Set<Marker> getMarkersFromHotels(HotelsResponse response) {
    List data = response.myData!.data!;
    Set<Marker> markers = {};
    for (int i = 0 ; i < data.length ; i++)
    {
      if(data[i].longitude != null){
        double? longitude = double.parse(data[i].longitude!);
        if(longitude <= 180 && longitude >= -180){
          if(data[i].latitude != null){
            double? latitude = double.parse(data[i].latitude!);
            if(latitude <= 90 && latitude >= -90){
              markers.add(
                  Marker(markerId: MarkerId(
                      LatLng(latitude,longitude).hashCode.toString()),
                  position: LatLng(latitude,longitude),
                  icon: BitmapDescriptor.defaultMarker,
                  onTap: ()async{
                   await MapsLauncher.launchCoordinates(latitude,longitude);
                  },
                  infoWindow: InfoWindow(title: "'\$' ${data[i].price} ",),
              ));
            }
          }
        }
      }
    }
    return markers;
  }

}
class HotelsState{}
class EmptyHotelsState extends HotelsState{}
class SuccessHotelsState extends HotelsState{
  Set<Marker> response ;

  SuccessHotelsState(this.response);
}
class ErrorHotelsState extends HotelsState{
  String error ;

  ErrorHotelsState(this.error);
}
