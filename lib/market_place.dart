import 'package:flutter/material.dart';

class CropMarketPage extends StatefulWidget {
  @override
  _CropMarketPageState createState() => _CropMarketPageState();
}

class _CropMarketPageState extends State<CropMarketPage> {
  List<Crop> crops = [
    Crop(name: 'Tomatoes', location: 'Local Market', price: 2.5, trend: 0.15),
    Crop(name: 'Apples', location: 'Local Market', price: 1.8, trend: -0.05),
    Crop(name: 'Bananas', location: 'Local Market', price: 1.2, trend: 0.12),
    Crop(name: 'Oranges', location: 'Local Market', price: 1.6, trend: 0.08),
    Crop(name: 'Strawberries', location: 'Local Market', price: 2.3, trend: -0.02),
    Crop(name: 'Grapes', location: 'Local Market', price: 2.1, trend: 0.07),
    Crop(name: 'Watermelons', location: 'Local Market', price: 2.9, trend: -0.12),
    Crop(name: 'Pineapples', location: 'Local Market', price: 2.4, trend: 0.06),
    Crop(name: 'Blueberries', location: 'Local Market', price: 2.7, trend: -0.09),
    Crop(name: 'Cherries', location: 'Local Market', price: 2.2, trend: 0.03),
    Crop(name: 'Apples', location: 'Regional Market', price: 2.0, trend: 0.10),
    Crop(name: 'Bananas', location: 'Regional Market', price: 1.4, trend: -0.03),
    Crop(name: 'Oranges', location: 'Regional Market', price: 1.7, trend: 0.05),
    Crop(name: 'Peaches', location: 'Regional Market', price: 2.3, trend: -0.01),
    Crop(name: 'Grapes', location: 'Regional Market', price: 2.5, trend: 0.08),
    Crop(name: 'Watermelons', location: 'Regional Market', price: 3.0, trend: -0.15),
    Crop(name: 'Pineapples', location: 'Regional Market', price: 2.6, trend: 0.09),
    Crop(name: 'Strawberries', location: 'Regional Market', price: 2.8, trend: -0.07),
    Crop(name: 'Cherries', location: 'Regional Market', price: 2.1, trend: 0.04),
    Crop(name: 'Grapes', location: 'National Market', price: 3.0, trend: 0.12),
    Crop(name: 'Watermelons', location: 'National Market', price: 3.2, trend: -0.13),
    Crop(name: 'Pineapples', location: 'National Market', price: 2.9, trend: 0.10),
    Crop(name: 'Apples', location: 'National Market', price: 2.5, trend: 0.15),
    Crop(name: 'Bananas', location: 'National Market', price: 2.0, trend: -0.06),
    Crop(name: 'Oranges', location: 'National Market', price: 2.4, trend: 0.08),
    Crop(name: 'Peaches', location: 'National Market', price: 2.7, trend: 0.06),
    Crop(name: 'Strawberries', location: 'National Market', price: 2.6, trend: -0.11),
    Crop(name: 'Blueberries', location: 'National Market', price: 2.5, trend: 0.04),
  ];


  String? selectedLocation = 'All Locations';
  String? selectedCropType = 'All Crops';

  ScrollController _scrollController = ScrollController();

  List<String> getCropNames() {
    List<String> cropNames = ['All Crops'];
    crops.forEach((crop) {
      if (!cropNames.contains(crop.name)) {
        cropNames.add(crop.name);
      }
    });
    return cropNames;
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.green, Colors.teal],
                ),
              ),
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Crop Market',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Find the Best Crops in Your Area',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        DropdownButton<String>(
                          value: selectedLocation,
                          items: getCropLocations(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedLocation = newValue;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Crop Type',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        DropdownButton<String>(
                          value: selectedCropType,
                          items: getCropNames().map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedCropType = newValue;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: crops.length,
              itemBuilder: (context, index) {
                Crop crop = crops[index];
                if ((selectedLocation == 'All Locations' || crop.location == selectedLocation) &&
                    (selectedCropType == 'All Crops' || crop.name == selectedCropType)) {
                  return CropCard(crop: crop);
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scrollToTop,
        child: Icon(Icons.arrow_upward),
      ),
    );
  }

  List<DropdownMenuItem<String>> getCropLocations() {
    List<String> uniqueLocations = ['All Locations'];
    crops.forEach((crop) {
      if (!uniqueLocations.contains(crop.location)) {
        uniqueLocations.add(crop.location);
      }
    });

    return uniqueLocations
        .map((location) => DropdownMenuItem<String>(
      value: location,
      child: Text(location),
    ))
        .toList();
  }
}

class Crop {
  final String name;
  final String location;
  final double price;
  final double trend;

  Crop({
    required this.name,
    required this.location,
    required this.price,
    required this.trend,
  });
}

class CropCard extends StatelessWidget {
  final Crop crop;

  CropCard({required this.crop});

  @override
  Widget build(BuildContext context) {
    Color trendColor = crop.trend > 0 ? Colors.green : Colors.red;
    String insight = crop.trend > 0 ? 'Positive Trend' : 'Negative Trend';

    return Card(
      margin: EdgeInsets.all(4.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              crop.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Location: ${crop.location}', style: TextStyle(fontSize: 18)),
            Text('Price: \$${crop.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 18)),
            Row(
              children: [
                Text(
                  'Trend: ${crop.trend > 0 ? '+' : ''}${crop.trend.toStringAsFixed(2)}%',
                  style: TextStyle(
                    fontSize: 18,
                    color: trendColor,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Insight: $insight',
                  style: TextStyle(
                    fontSize: 18,
                    color: trendColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}