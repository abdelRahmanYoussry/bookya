
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ExploreScreen extends HomeState{}
class TripsScreen extends HomeState{}
class ProfScreen extends HomeState{}
class ChangeIndicator extends HomeState{}
class AppChangeColorState extends HomeState{}
class LoadingGetHotel extends HomeState{}
class SuccessGetHotel extends HomeState{}
class ToggleIsEndState extends HomeState{}
class ErrorGetHotel extends HomeState{
 final String error;

  ErrorGetHotel({required this.error});
}