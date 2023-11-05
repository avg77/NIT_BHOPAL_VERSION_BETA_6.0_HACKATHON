import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Crop_Landing_Page.dart';

class CropInfoDisplay extends StatelessWidget {
  Future<List<Map<String, dynamic>>?> getCropData() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot snapshot = await firestore.collection('crop_info').get();

    final List<Map<String, dynamic>> cropDataList = [];
    for (final QueryDocumentSnapshot doc in snapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      cropDataList.add(data);
    }

    return cropDataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button action
            // You can use Navigator to navigate back to the previous screen
          },
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>?>(
        future: getCropData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(child: Text('No crop data available.'));
          }

          final cropDataList = snapshot.data!;

          return Column(
            children: [
              Text(
                'Crops Info',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: cropDataList.length,
                  itemBuilder: (context, index) {
                    final cropData = cropDataList[index];
                    return CropInfoItem(cropData: cropData);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CropInfoItem extends StatelessWidget {
  final Map<String, dynamic> cropData;

  CropInfoItem({required this.cropData});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.black, // Specify the border color
          width: 1.0, // Specify the border width
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                'assets/${cropData['cropName'].toLowerCase()}.png', // Replace with your image asset path
                width: 40, // Set the width
                height: 40,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${cropData['cropName']}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 8),
                Text(
                  '${cropData['description']}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(width: 20.0),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CropLandingPage(cropInfo: cropData),
                ),
              );
            },
            child: Icon(
              Icons.arrow_circle_right_outlined, // Right arrow circular button
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
