import 'package:bookya/widgets/TextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
  TextEditingController searchTextController=TextEditingController();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Theme.of(context).backgroundColor,
      body:Container(
        width: double.infinity,
        height: mediaQuery.height/2,
        decoration:  const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
                image: AssetImage('assets/images/hotel1.jpg')
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyTextFormField(
                  onTap: (){},
                  onSubmit: (){},
                  prefix: IconButton(icon: Icon(Icons.search, color:Theme.of(context).primaryColor,size: 28) ,
                      onPressed: (){}),
                  hintStyle: TextStyle(color:Theme.of(context).backgroundColor),
                  readOnly: true,
                  onChanged: (){},
                  control: searchTextController,
                  type: TextInputType.text,
                  isPassword: false,
                  hint: 'Where are you going',
                  borderColor: Theme.of(context).textTheme.subtitle1!.color,
                  labelColor: Theme.of(context).textTheme.caption!.color!,
                  textColor: Theme.of(context).backgroundColor,
                  backgroundColor:  Theme.of(context).textTheme.subtitle1!
                      .color!),
              const SizedBox(height: 20,),
              Text('data')
              // Row(
              //   children: [
              //     Container(
              //       width: mediaQuery.height/6,
              //       height: mediaQuery.width/4,
              //       decoration:   BoxDecoration(
              //           borderRadius: BorderRadius.all(Radius.circular(10)),
              //           gradient: LinearGradient(
              //             begin: Alignment.bottomCenter,
              //             end: Alignment.bottomRight,
              //             colors: [
              //               Colors.black.withOpacity(0.6),
              //               Colors.black.withOpacity(0.2)
              //             ],),
              //           boxShadow:  [
              //             BoxShadow(
              //                 color: Colors.black.withOpacity(0.7),
              //                 spreadRadius: 1,
              //                 blurRadius: 9,
              //                 offset: Offset(-12,12)
              //
              //             ),
              //             // BoxShadow(
              //             //   color: Colors.black.withOpacity(0.3),
              //             //   spreadRadius:1,
              //             //   blurRadius: 8,
              //             //   offset: Offset(-10,10)
              //             //
              //             // ),
              //           ],
              //           image:DecorationImage(
              //               fit: BoxFit.fitHeight,
              //               image: AssetImage('assets/images/hotel1.jpg')
              //           )
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 5.0),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children:  [
              //           Text('Grand Royal Hotel',
              //               style: Theme.of(context).textTheme.labelLarge),
              //           Text('wembley,london',
              //             style: Theme.of(context).textTheme.caption,),
              //           Padding(
              //             padding: const EdgeInsets.symmetric(vertical: 2.0),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Icon(Icons.location_on,size: 18,
              //                   color: Theme.of(context).primaryColor,),
              //                 Text('2.0 Km to city',
              //                   style: Theme.of(context).textTheme.caption,),
              //               ],
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.symmetric(vertical: 2.0),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Text('\$180',
              //                   style: Theme.of(context).textTheme.headline6,),
              //                 Text('/per night',
              //                   style: Theme.of(context).textTheme.caption,),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     )
              //   ],
              // )



            ],
          ),
        ),
      ) ,

    );
  }
}
