import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FarmInputForm(),
    );
  }
}

class FarmInputForm extends StatefulWidget {
  @override
  _FarmInputFormState createState() => _FarmInputFormState();
}

class _FarmInputFormState extends State<FarmInputForm> {
  final TextEditingController moneyController = TextEditingController();
  final TextEditingController waterController = TextEditingController();
  final TextEditingController landController = TextEditingController();

  List<Map<String, dynamic>> farmDataList = [
    {
      'cropName': 'Wheat',
      'money': 10000,
      'water': 100,
      'land': 5,
    },
    {
      'cropName': 'Rice',
      'money': 15000,
      'water': 150,
      'land': 8,
    },
    {
      'cropName': 'Maize',
      'money': 25000,
      'water': 250,
      'land': 12,
    },
    {
      'cropName': 'Potato',
      'money': 35000,
      'water': 350,
      'land': 18,
    },
    {
      'cropName': 'Onion',
      'money': 50000,
      'water': 500,
      'land': 25,
    },
  ];

  List<Map<String, dynamic>> filteredFarmData = [];

  void submitForm() {
    filteredFarmData.clear();

    int money = int.tryParse(moneyController.text) ?? 0;
    int water = int.tryParse(waterController.text) ?? 0;
    int land = int.tryParse(landController.text) ?? 0;

    for (var data in farmDataList) {
      if (data['money'] <= money &&
          data['water'] <= water &&
          data['land'] <= land) {
        filteredFarmData.add(data);
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farm Input Form'),
      ),
      body: SingleChildScrollView( // Wrap the form in a SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: moneyController,
                decoration:
                InputDecoration(labelText: 'Money Availability (0-100000)'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: waterController,
                decoration:
                InputDecoration(labelText: 'Water Availability(0-1000)'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: landController,
                decoration: InputDecoration(labelText: 'Land Availability(0-50)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: submitForm,
                child: Text('Submit'),
              ),
              if (filteredFarmData.isNotEmpty)
                Column(
                  children: filteredFarmData.map((data) {
                    return FarmDataWidget(
                      cropName: data['cropName'],
                      money: data['money'],
                      water: data['water'],
                      land: data['land'],
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class FarmDataWidget extends StatelessWidget {
  final String cropName;
  final int money;
  final int water;
  final int land;

  FarmDataWidget({
    required this.cropName,
    required this.money,
    required this.water,
    required this.land,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Crop Name: $cropName'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Money: $money'),
            Text('Water: $water'),
            Text('Land: $land'),
          ],
        ),
      ),
    );
  }
}
