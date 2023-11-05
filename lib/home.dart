import 'package:flutter/material.dart';

import 'appointment.dart';
import 'crop_list_page.dart';
import 'feature.dart';
import 'governmentSchemes.dart';
import 'market_place.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
        'LOGO',
        style: TextStyle(
        fontWeight: FontWeight.bold,
    ),
    ), // This will remove the title text
    ),
    endDrawer: Drawer(
    child: ListView(
    children: <Widget>[
    ListTile(
    title: Text('Logout'),
    leading: Icon(Icons.logout),
    onTap: () {
    // Handle the logout action here
    },
    ),
    ],
    ),
    ),
    body: SingleChildScrollView(
    child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/avatar.png', // Change to your logo asset path
                  width: 80, // Set the width
                  height: 80, // Set the height
                ), // Add spacing
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Kishan Kumar',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text('Welcome', style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          Divider(
            height: 2, // Specify the height of the divider
            color: Colors.black, // Specify the color of the divider
          ),
          Container(
            padding: EdgeInsets.all(20), // A
            child: Column(
              children: [
                Text(
                  'Current Crops',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CropInfoDisplay()));
                  },
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(20), // Apply rounded borders
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/wheat.png',
                              height: 50,
                            ),
                            SizedBox(width: 20,),
                            Text('Wheat', style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons
                                        .opacity,size: 15,),
                                    SizedBox(width: 5,),
                                    Text('72%'),
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  children: [
                                    Icon(Icons
                                        .wb_sunny,size: 15,),
                                    SizedBox(width: 5,),
                                    Text('80%'),
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  children: [
                                    Icon(Icons
                                        .landscape_outlined,size: 15,),
                                    SizedBox(width: 5,),
                                    Text('90%'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(20), // Apply rounded borders
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/corn.png',
                              height: 50,
                            ),
                            SizedBox(width: 20,),
                            Text('Corn', style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons
                                        .opacity,size: 15,),
                                    SizedBox(width: 5,),
                                    Text('72%'),
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  children: [
                                    Icon(Icons
                                        .wb_sunny,size: 15,),
                                    SizedBox(width: 5,),
                                    Text('80%'),
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  children: [
                                    Icon(Icons
                                        .landscape_outlined,size: 15,),
                                    SizedBox(width: 5,),
                                    Text('90%'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(20), // Apply rounded borders
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/potato.png',
                              height: 50,
                            ),
                            SizedBox(width: 20,),
                            Text('Potato', style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons
                                        .opacity,size: 15,),
                                    SizedBox(width: 5,),
                                    Text('72%'),
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  children: [
                                    Icon(Icons
                                        .wb_sunny,size: 15,),
                                    SizedBox(width: 5,),
                                    Text('80%'),
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  children: [
                                    Icon(Icons
                                        .landscape_outlined,size: 15,),
                                    SizedBox(width: 5,),
                                    Text('90%'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>FarmerHomePage()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20), // Add padding as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Apply rounded borders
                border: Border.all(
                    color: Colors.black, width: 2), // Add outline border
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/gov1.png', // Replace with your image asset path
                        width: 70, // Set the width
                        height: 70, // Set the height
                      ),
                      Text('Jharkhand'),
                      Text('Government'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/gov2.png', // Replace with your image asset path
                        width: 70, // Set the width
                        height: 70, // Set the height
                      ),
                      Text('MP '),
                      Text('Government'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/gov3.png', // Replace with your image asset path
                        width: 70, // Set the width
                        height: 70, // Set the height
                      ),
                      Text('Krishi '),
                      Text('Vibhag'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>AppointmentFormApp()));
            },
            child: Container(decoration: BoxDecoration(
              color: Colors.blue, // Background color
              border: Border.all(
                color: Colors.black, // Border color
              ),
              borderRadius: BorderRadius.circular(15),
            ),
              child: Padding(
                padding:  EdgeInsets.all(16.0),
                  child: Text('Book Appointment',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
    ),
      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Set the type to fixed for 5 items
      currentIndex: _currentIndex,
      onTap: (index) {
        // Handle navigation item clicks here
        setState(() {
          _currentIndex = index;
        });

        if (index == 0) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHome()));
        }
        else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>CropMarketPage()));
        }
        else if (index==2){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>FarmInputForm()));
        }
        else if(index == 3){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>FarmerHomePage()));
        }
        else if(index ==4){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CropInfoDisplay()));
        }

      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store_mall_directory),
          label: 'Market',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.diamond),
          label: 'Feature',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.document_scanner_rounded),
          label: 'Schemes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_nature),
          label: 'Crops',
        ),
      ],
    ),
    );
  }
}
