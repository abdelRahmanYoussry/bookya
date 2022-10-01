# bookya



# Full Video In Google Drive


https://drive.google.com/file/d/1SBq-1-tFojjyy2ConME7opiwjlk5Fvg-/view?usp=sharing


https://drive.google.com/file/d/1y0a-WaCdY_IfP1LqRetjB4tH7pvLJJR-/view?usp=sharing


[
](https://user-images.githubusercontent.com/92960112/193365277-f1b2f224-f138-4c5a-98c5-1d7e48466ca0.mp4
)

https://user-images.githubusercontent.com/92960112/193378960-62abab9f-fa88-4820-b71a-e255d881375e.mp4


[
](https://user-images.githubusercontent.com/92960112/193365277-f1b2f224-f138-4c5a-98c5-1d7e48466ca0.mp4
)

https://user-images.githubusercontent.com/92960112/193365265-2579f0ed-1e7f-4f8d-9c2c-8ebfb1c7a1cd.mp4


https://user-images.githubusercontent.com/92960112/193366206-7f728f79-8c39-4533-9518-0e7ea530ab4d.mp4


#SignOut, AboutUs

https://user-images.githubusercontent.com/92960112/193357799-00b00c3c-4241-4dec-ae83-c2fd5ee0a637.mp4


https://youtu.be/rPBHqkNNGs4

# screenshots

<img src="https://user-images.githubusercontent.com/92960112/193364232-5baec943-8e6b-445f-a17b-66528328ca5a.png" width="100">    <img src="https://user-images.githubusercontent.com/92960112/193363026-5df2748b-937f-458f-b197-678b7bebc1e3.png" width="100">

<img src="https://user-images.githubusercontent.com/92960112/193363794-8713f154-b8c3-43ee-b826-6a3bef5c46d0.png" width="100">     <img src="https://user-images.githubusercontent.com/92960112/193364392-6357a4d7-e1ff-4a9e-b146-8fc0a24feb26.png" width="100">

This project is powered by Flutter **3.0.0** and Dart **2.17.0**.

To select and install a specific version of flutter, we recommend using FVM: [fvm.app](https://fvm.app)

Bloc ([flutter_bloc](https://pub.dev/packages/flutter_bloc)) is used as an approach to state management, more precisely Cubit over Bloc from the same package. Bloc/Cubit handles `Events` and changes `States`. Screens and Widgtes subscribe to Bloc changes and send events (for Cubit, this is a direct method call).


The main packages used in the project:


```yaml
  flutter_lints: ^2.0.0
   conditional_builder_null_safety: ^0.0.6
   flutter_bloc:
   dio: ^4.0.6
   flutter_rating_bar: ^4.0.1
   readmore: ^2.2.0
   dots_indicator: ^2.1.0
   search_page: ^2.0.0+1
   cupertino_icons: ^1.0.2
   loading_animation_widget: ^1.2.0+3
   rxdart: ^0.27.3
   bloc: ^7.1.0
   shared_preferences: ^2.0.5
   fluttertoast: 8.0.8
   smooth_page_indicator: ^1.0.0+2
   carousel_slider: ^4.0.0
   hexcolor: ^2.0.7
   image_picker: ^0.8.5+3
   google_maps_flutter: ^2.2.0
   maps_launcher: ^2.0.1
   syncfusion_flutter_sliders: ^20.2.50
   flutter_switch: ^0.3.2
```

### Application description

The app authenticate the user data redirecting him to the login in screen after registering to browse the hotels, The user can change the theme color chosing between light and dark theme not only the theme mode but also toggling between set of colors to choose the preferable color. The hotels is displayed in the map if the user needs to check the hotel location. Also a list of facilities is diplayed for the user to filter for the best hotel chooice. 

### Features

1. OnBoarding 
2. Login
3. Regiester
4. Update account
5. Home
6. Create booking - Update booking
7. Settings
8. Dark mode
9. Change color
10. Map
11. Filter 
12. Search



### Table of Contents
1. [How to build & run](#build&run)
2. [Configuration](#configuration)
	* [Dart](#configuration-dart)
	* [iOS](#configuration-ios)
	* [Android](#configuration-android)
3. [Project structure](#structure)


## How to build & run <a name="build&run"></a>

The minimum required set of commands

```bash
- flutter pub get # to get dependencies# to generate l10n.dart file from .arb localization files
```

To build and run the project, you can use `Android Studio` or `Visual Studio Code` with Flutter/Dart plugins (`Flutter Intl`, `Dart`, `Flutter`), then the commands above will be executed automatically when building and running.


To build from console:

```bash
 flutter build ios --release --no-codesign --flavor dev
 # or
 flutter build android --release --flavor dev
```

You can assemble the flutter part separately and run the application from native projects

To run from console:

```bash
flutter run ios -t lib/main.dart --no-codesign --flavor dev
# or
flutter run android -t lib/main.dart --flavor dev
```

``lib/main.dart`` - this is the main launch point of the project

``--flavor dev `` - this is the environment specification for dart + `flavor` in Android and `scheme` in iOS native projects


More about configuration: [Configuration change](#configuration)


## Configuration <a name="configuration"></a>

The `flavor` flag is used to switch environments. Available in the project: dev, stage, live.

Due to the specifics of assembling flutter applications, the project configuration is split into 3 parts: [Dart](#configuration-dart) / [iOS](#configuration-ios) / [Android](#configuration-android).

### Dart <a name="configuration-dart"></a>

`lib/app_config.dart` - the main class responsible for the Flutter/Dart configuration of the application part. It lists the main variables used in the project and loads the variables depending on the selected `flavor` from the `.env `files.

* `--flavor dev` -> `.env`
* `--flavor stage` -> `.env.stage`
* `--flavor live` -> `.env.live`


**Important**: Variables needed in the native part, set in native ways

### iOS <a name="configuration-ios"></a>

iOS uses `*.xcconfig` files, they are located in the folder: `ios/Flutter`

`*.xcconfig` files are used depending on the `scheme` selected inside the iOS project.



When building a project from flutter, the `flavor` flag matches the `schema` within the iOS project.

* `--flavor dev` -> `Config-Dev.xcconfig`
* `--flavor stage` -> `Config-Stage.xcconfig `
* `--flavor live` -> `Config-Live.xcconfig `


For iOS, the minimum set of parameters in `*.xcconfig` is:

```
PRODUCT_BUNDLE_IDENTIFIER   = ""
APPLE_PAY_MERCHANT_ID       = ""
```


We should also mention the signature of iOS applications. Assembly signature parameters are specified on the native side, and it is possible for each individual `scheme` to specify its own signature option.


### Android <a name="configuration-android"></a>

Android uses `productFlavors`, they are in the folder: `android/app/build.gradle`



For Android, the minimum set of parameters:

```
resValue "string", "gms_api_key", ""
```


## Project structure <a name="structure"></a>

Clean Code Structure (features) -> Every module has its own feature. 

![bookya folders](https://user-images.githubusercontent.com/73221261/193343179-0f28e9ce-de61-4345-bc6a-e2b929d2bf81.png)


|   |   |
|---|---|
|*main.dart*|The entry point to the application. Here is the initialization of Dio,Shared preferences that are used throughout the application.|
|*app_config.dart*|Application variables.|
|---|---|
|*cubit/*|All `Bloc` used in the application.|
|*shared/*|Application-wide components and base class extensions.|
|*models/*|Model classes used in the application.|
|*modules/*|All UI elements used in the application.|
|---|---|
|*module/screens/*|Application screens and widgets necessary for them, divided into folders. Files with `*_screen.dart` - describe application screens. The rest describe the widgets they need.|
|*modules/values/*|Constants for UI such as colors, fonts, images, etc.|
|*modules/widgets/*|Common UI elements.|
|---|---|



