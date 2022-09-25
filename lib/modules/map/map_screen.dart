import 'dart:async';
import 'package:maps_launcher/maps_launcher.dart';

import 'package:bookya/modules/map/domain/hotels_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  HotelsBloc bloc = HotelsBloc();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
    @override
  void initState() {
      bloc.getHotels();
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocBuilder<HotelsBloc , HotelsState>(
        bloc: bloc,
        builder: (context, state) {
          if(state is EmptyHotelsState  )
         {
           return Container();
        }else if (state is SuccessHotelsState){
            return GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition:  CameraPosition(
                target: state.response.first.position,
                zoom: 10.4746,
              ) ,
              onMapCreated: (GoogleMapController controller) {
                for(Marker item in state.response) {
                  controller.showMarkerInfoWindow(item.markerId);
                }
                _controller.complete(controller);
              },
              markers: state.response,
            );
          }else {
            ErrorHotelsState errorHotelsState = state as ErrorHotelsState;
            return  Center(child: Text(errorHotelsState.error),);
          }
        }
      ),

    );
  }

}