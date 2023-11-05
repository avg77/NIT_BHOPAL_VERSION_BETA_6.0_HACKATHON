import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class CropInfo {
  final String cropName;
  final String description;
  final double waterRequired;
  final double minMoistureContent;
  final double maxMoistureContent;
  final String soilRequired;
  final String pesticideRequired;
  final double sunlight;
  final double marketRates;
  final double yield;
  final double noDays;

  CropInfo({
    required this.cropName,
    required this.description,
    required this.waterRequired,
    required this.minMoistureContent,
    required this.maxMoistureContent,
    required this.soilRequired,
    required this.pesticideRequired,
    required this.sunlight,
    required this.marketRates,
    required this.yield,
    required this.noDays,
  });
}

void addCropInfo(CropInfo cropInfo) {
  FirebaseFirestore.instance.collection('crop_info').add({
    'cropName': cropInfo.cropName,
    'description': cropInfo.description,
    'waterRequired': cropInfo.waterRequired,
    'minMoistureContent': cropInfo.minMoistureContent,
    'maxMoistureContent': cropInfo.maxMoistureContent,
    'soilPh': cropInfo.soilRequired,
    'pesticideRequired': cropInfo.pesticideRequired,
    'sunlight': cropInfo.sunlight,
    'marketRates': cropInfo.marketRates,
    'yield' : cropInfo.yield,
    'NoDays' : cropInfo.noDays,
  }).then((value) {
    print('Crop info added to Firestore');
  }).catchError((error) {
    print('Error adding crop info: $error');
  });
}

class CropInfoForm extends StatefulWidget {
  @override
  _CropInfoFormState createState() => _CropInfoFormState();
}

class _CropInfoFormState extends State<CropInfoForm> {
  final cropNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final waterRequiredController = TextEditingController();
  final minMoistureContentController = TextEditingController();
  final maxMoistureContentController = TextEditingController();
  final soilRequiredController = TextEditingController();
  final pesticideRequiredController = TextEditingController();
  final sunlightController = TextEditingController();
  final marketRatesController = TextEditingController();
  final yieldController = TextEditingController();
  final noDaysController = TextEditingController();


  void _submitForm() {
    final cropInfo = CropInfo(
      cropName: cropNameController.text,
      description: descriptionController.text,
      waterRequired: double.tryParse(waterRequiredController.text) ?? 0.0,
      minMoistureContent: double.tryParse(minMoistureContentController.text) ?? 0.0,
      maxMoistureContent: double.tryParse(maxMoistureContentController.text) ?? 0.0,
      soilRequired: soilRequiredController.text,
      pesticideRequired: pesticideRequiredController.text,
      sunlight: double.tryParse(sunlightController.text) ?? 0.0,
      marketRates: double.tryParse(marketRatesController.text) ?? 0.0,
      yield: double.tryParse(yieldController.text)??0.0,
      noDays: double.tryParse(noDaysController.text)??0.0,
    );

    // Send data to Firestore
    addCropInfo(cropInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Info Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: cropNameController,
                decoration: InputDecoration(labelText: 'Crop Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: waterRequiredController,
                decoration: InputDecoration(labelText: 'Water Required'),
              ),
              TextField(
                controller: minMoistureContentController,
                decoration: InputDecoration(labelText: 'Min Moisture Content'),
              ),
              TextField(
                controller: maxMoistureContentController,
                decoration: InputDecoration(labelText: 'Max Moisture Content'),
              ),
              TextField(
                controller: soilRequiredController,
                decoration: InputDecoration(labelText: 'Soil ph'),
              ),
              TextField(
                controller: pesticideRequiredController,
                decoration: InputDecoration(labelText: 'Pesticide Required'),
              ),
              TextField(
                controller: sunlightController,
                decoration: InputDecoration(labelText: 'Sunlight'),
              ),
              TextField(
                controller: marketRatesController,
                decoration: InputDecoration(labelText: 'Current Market Rate'),
              ),
              TextField(
                controller: yieldController,
                decoration: InputDecoration(labelText: 'Yield in KG'),
              ),
              TextField(
                controller: noDaysController,
                decoration: InputDecoration(labelText: 'No of days crop grow'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CropInfoForm(),
    );
  }
}
