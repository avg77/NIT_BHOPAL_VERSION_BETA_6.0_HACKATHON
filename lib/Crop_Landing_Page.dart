import 'package:flutter/material.dart';

import 'home.dart';


class CropLandingPage extends StatefulWidget {
  Map<String, dynamic> cropInfo;
  CropLandingPage({Key? key, required this.cropInfo}) : super(key: key);


  @override
  State<CropLandingPage> createState() => _CropLandingPageState();
}

class _CropLandingPageState extends State<CropLandingPage> {
  int _currentIndex = 0; // Store the currently selected navigation index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => MyHome()),
            (route) => false,);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 10,),
                  Container(
                    width: 120,
                    height: 120,
                    child: Image.asset('assets/${widget.cropInfo['cropName'].toString().toLowerCase()}.png'),
                  ),

                  SizedBox(width: 16.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${widget.cropInfo['cropName']}', // Replace '0' with the index you want to display
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'Grain',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            '${widget.cropInfo['NoDays'] } Rs/kg',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 18,
                            ),
                          ),
                          Icon(Icons.arrow_upward,color: Colors.green,)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 20,)
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Container(
                child: Column(
                  children: [
                    Divider(
                      height: 1, // Specify the height of the divider
                      color: Colors.black, // Specify the color of the divider
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text(
                          'Description Text',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),

                    Row(
                      children: [
                        Expanded(
                          child: Text('${widget.cropInfo['description']}',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                            softWrap: true, // Enable text wrapping
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text(
                          'Requirements',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey), // Add a border
                        borderRadius: BorderRadius.circular(10.0), // Apply rounded borders
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10), //

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.opacity, color: Colors.blue),
                              SizedBox(height: 3),
                              Text('${widget.cropInfo['waterRequired']} L'),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.attach_money, color: Colors.green),
                              SizedBox(height: 3),
                              Text('${widget.cropInfo['yield']} kg'),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.wb_sunny, color: Colors.yellow),
                              SizedBox(height: 3),
                              Text('${widget.cropInfo['sunlight']} Watt'),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.landscape_outlined, color: Colors.brown),
                              SizedBox(height: 3),
                              Text('${widget.cropInfo['soilPH']} pH'),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.access_time, color: Colors.purple),
                              SizedBox(height: 3),
                              Text('${widget.cropInfo['NoDays']} Days'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      child: Container(
                        // ... (Your existing code)
                        child: Column(
                          children: [
                            // ... (Your existing code)
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text(
                                  'Rates vs. Time',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
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
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
