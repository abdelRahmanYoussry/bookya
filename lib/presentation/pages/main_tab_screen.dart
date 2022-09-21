import 'package:flutter/material.dart';

import '../pages/list_of_bookings.dart';

/*List aa = [
  {
    'hotel': 'Nasr Hotel',
    'description': 'This is a simple of the final product',
    'city': 'Cairo',
    'image': 'assets/hotel1.jpg',
    'cost': 777
  },
  {
    'hotel': 'Alexandria Hotel',
    'description': 'This is a simple of the final product',
    'city': 'Cairo',
    'image': 'assets/hotel2.jpg',
    'cost': 1500
  },
  {
    'hotel': 'Ramses Hotel',
    'description': 'This is a simple of the final product',
    'city': 'Cairo',
    'image': 'assets/hotel3.jpg',
    'cost': 500
  }
];*/
List testing = [
  {
    "id": 6,
    "user_id": "11",
    "hotel_id": "13",
    "type": "cancelled",
    "created_at": "2022-09-13T09:46:54.000000Z",
    "updated_at": "2022-09-13T09:47:21.000000Z",
    "user": {
      "id": 11,
      "name": "Abdullah Mansour111",
      "email": "abdullah.mansour111@gmail.com",
      "email_verified_at": "null",
      "api_token":
          "DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u",
      "image": "39561663606971.jpg",
      "created_at": "2022-09-13T05:48:17.000000Z",
      "updated_at": "2022-09-20T10:39:11.000000Z",
      "google_id": "2",
      "provider": "null"
    },
    "hotel": {
      "id": 13,
      "name": "Ramses Hotel",
      "description": "This is a simple description of Ramses Hotel ",
      "price": "200",
      "address": "rome",
      "longitude": "100",
      "latitude": "200",
      "rate": "4.0",
      "created_at": "2022-09-11T13:58:30.000000Z",
      "updated_at": "2022-09-11T13:58:30.000000Z",
      "hotel_images": [
        {
          "id": 9,
          "hotel_id": "13",
          "image": "assets/hotel3.jpg",
          "created_at": "null",
          "updated_at": "null"
        },
        {"id": 10, "hotel_id": "13", "created_at": "null", "updated_at": "null"}
      ],
      "facilities": [
        {
          "id": 3,
          "name": "Wifi",
          "image": "50631662902867.png",
          "created_at": "2022-09-11T13:27:47.000000Z",
          "updated_at": "2022-09-11T13:27:47.000000Z"
        },
        {
          "id": 4,
          "name": "A/C",
          "image": "83631662902917.png",
          "created_at": "2022-09-11T13:28:37.000000Z",
          "updated_at": "2022-09-11T13:28:37.000000Z"
        }
      ]
    }
  },
  {
    "id": 6,
    "user_id": "11",
    "hotel_id": "13",
    "type": "cancelled",
    "created_at": "2022-09-13T09:46:54.000000Z",
    "updated_at": "2022-09-13T09:47:21.000000Z",
    "user": {
      "id": 11,
      "name": "Abdullah Mansour111",
      "email": "abdullah.mansour111@gmail.com",
      "email_verified_at": "null",
      "api_token":
          "DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u",
      "image": "39561663606971.jpg",
      "created_at": "2022-09-13T05:48:17.000000Z",
      "updated_at": "2022-09-20T10:39:11.000000Z",
      "google_id": "2",
      "provider": "null"
    },
    "hotel": {
      "id": 13,
      "name": "Nasr Hotel",
      "description": "This is a simple description of the Nasr Hotel",
      "price": "500",
      "address": "rome",
      "longitude": "100",
      "latitude": "200",
      "rate": "3.5",
      "created_at": "2022-09-11T13:58:30.000000Z",
      "updated_at": "2022-09-11T13:58:30.000000Z",
      "hotel_images": [
        {
          "id": 9,
          "hotel_id": "13",
          "image": "assets/hotel2.jpg",
          "created_at": "null",
          "updated_at": "null"
        },
        {"id": 10, "hotel_id": "13", "created_at": "null", "updated_at": "null"}
      ],
      "facilities": [
        {
          "id": 3,
          "name": "Wifi",
          "image": "50631662902867.png",
          "created_at": "2022-09-11T13:27:47.000000Z",
          "updated_at": "2022-09-11T13:27:47.000000Z"
        },
        {
          "id": 4,
          "name": "A/C",
          "image": "83631662902917.png",
          "created_at": "2022-09-11T13:28:37.000000Z",
          "updated_at": "2022-09-11T13:28:37.000000Z"
        }
      ]
    }
  }
];

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            backgroundColor: Colors.teal,
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              labelPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Color.fromRGBO(200, 200, 200, 1.0),
              tabs: [
                Tab(
                  text: 'OnGoing',
                ),
                Tab(
                  text: 'Completed',
                ),
                Tab(
                  text: 'Cancelled',
                ),
              ],
            ),
            title: const Padding(
                padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Text('My Booking')),
          ),
          body: Container(
            color: Colors.white,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                TabBarView(
                  children: [
                    ListOfBookings(data: testing),
                    ListOfBookings(
                      data: const [],
                    ),
                    ListOfBookings(
                      data: const [],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
