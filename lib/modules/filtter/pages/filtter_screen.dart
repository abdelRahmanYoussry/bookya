import 'package:bookya/modules/settings/modules/explore_screen/page/explore_screen_home.dart';
import 'package:bookya/modules/settings/modules/explore_screen/widget/explore_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_switch/flutter_switch.dart';

SfRangeValues _values = const SfRangeValues(40.0, 80.0);
SfRangeValues _values1 = const SfRangeValues(50.0, 100.0);

bool isChecked1 = false;
bool isChecked2 = false;
bool isChecked3 = false;
bool isChecked4 = false;
bool isChecked5 = false;

bool status1 = false;
bool status2 = false;
bool status3 = false;
bool status4 = false;
bool status5 = false;
bool status6 = false;


class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const SizedBox(height: 30,),
              const Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Text("Filter",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),),
              ),
              const SizedBox(height: 5,),
              const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text("price (for 1 night)",style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey
                ),),
              ),
              const SizedBox(height: 10,),
              SfRangeSlider(
                min: 0.0,
                max: 200.0,
                values: _values,
                interval: 20,
                showTicks: false,
                showLabels: false,
                enableTooltip: true,


                minorTicksPerInterval: 1,
                onChanged: (SfRangeValues  values){
                  setState((){
                    _values = values;
                  });

                },
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 9.0),
                child: Container(color: Colors.grey,height: 1,),
              ),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text("Popular Filter",style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey
                ),),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Checkbox(value: isChecked1,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked1 = value!;
                      });
                    },),
                  const Text("Free Breakfast"),
                  const SizedBox(width: 30,),
                  Checkbox(value: isChecked2,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked2 = value!;
                      });
                    },),
                  const Text("Free Parking"),


                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Checkbox(value: isChecked3,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked3 = value!;
                      });
                    },),
                  const Text("Pool"),
                  const SizedBox(width: 90,),
                  Checkbox(value: isChecked4,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked4 = value!;
                      });
                    },),
                  const Text("Pet Friendly"),


                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Checkbox(value: isChecked5,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked5 = value!;
                      });
                    },),
                  const Text("Free Wifi"),
                ],
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 9.0),
                child: Container(color: Colors.grey,height: 1,),
              ),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text("Distance from city center",style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey
                ),),
              ),
              const SizedBox(height: 10,),
              SfRangeSlider(
                min: 0.0,
                max: 200.0,
                values: _values1,
                interval: 20,
                showTicks: false,
                showLabels: false,
                enableTooltip: true,


                minorTicksPerInterval: 1,
                onChanged: (SfRangeValues  values){
                  setState((){
                    _values1 = values;
                  });

                },
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 9.0),
                child: Container(color: Colors.grey,height: 1,),
              ),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text("Type of Accommodation",style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey
                ),),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text("All",style: TextStyle(fontSize: 20),),
                    FlutterSwitch(
                      width: 70.0,
                      height: 40.0,
                      value: status1,
                      borderRadius: 30.0,
                      showOnOff: false,
                      onToggle: (val) {
                        setState(() {
                          status1 = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text("Apartment",style: TextStyle(fontSize: 20),),
                    FlutterSwitch(
                      width: 70.0,
                      height: 40.0,
                      value: status2,
                      borderRadius: 30.0,
                      showOnOff: false,
                      onToggle: (val) {
                        setState(() {
                          status2 = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text("Home",style: TextStyle(fontSize: 20),),
                    FlutterSwitch(
                      width: 70.0,
                      height: 40.0,
                      value: status3,
                      borderRadius: 30.0,
                      showOnOff: false,
                      onToggle: (val) {
                        setState(() {
                          status3 = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text("Villa",style: TextStyle(fontSize: 20),),
                    FlutterSwitch(
                      width: 70.0,
                      height: 40.0,
                      value: status4,
                      borderRadius: 30.0,
                      showOnOff: false,
                      onToggle: (val) {
                        setState(() {
                          status4 = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text("Hotel",style: TextStyle(fontSize: 20),),
                    FlutterSwitch(
                      width: 70.0,
                      height: 40.0,
                      value: status5,
                      borderRadius: 30.0,
                      showOnOff: false,
                      onToggle: (val) {
                        setState(() {
                          status5 = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text("Resort",style: TextStyle(fontSize: 20),),
                    FlutterSwitch(
                      width: 70.0,
                      height: 40.0,
                      value: status6,
                      borderRadius: 30.0,
                      showOnOff: false,
                      onToggle: (val) {
                        setState(() {
                          status6 = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80,),








            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: FloatingActionButton.extended(
            onPressed: (){
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => const ExploreHomeScreen()),);
            },
            backgroundColor: Colors.teal,
            label: const Text(
                'Apply'
            ),
          ),
        ),
      ),

    );
  }
}
