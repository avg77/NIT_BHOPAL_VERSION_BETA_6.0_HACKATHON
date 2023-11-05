import 'package:farmer_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AddMarketScreen extends StatefulWidget {
  const AddMarketScreen({Key? key}) : super(key: key);

  @override
  State<AddMarketScreen> createState() => _AddMarketScreenState();
}

class _AddMarketScreenState extends State<AddMarketScreen> {
  final marketplaceController = TextEditingController();
  final farmerNameController = TextEditingController();
  final shopNameController = TextEditingController();
  final locationNameController = TextEditingController();
  final cropNameController = TextEditingController();
  final marketTypeController = TextEditingController();
  final categoryController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref().child('markets');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Schemes'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30),
              TextFormField(
                maxLines: 1,
                controller: marketplaceController,
                decoration: InputDecoration(
                  hintText: 'Marketplace',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 1,
                controller: farmerNameController,
                decoration: InputDecoration(
                  hintText: 'Farmer Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 1,
                controller: shopNameController,
                decoration: InputDecoration(
                  hintText: 'Shop Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 1,
                controller: locationNameController,
                decoration: InputDecoration(
                  hintText: 'Location Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 1,
                controller: cropNameController,
                decoration: InputDecoration(
                  hintText: 'Crop Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 1,
                controller: marketTypeController,
                decoration: InputDecoration(
                  hintText: 'Market Type',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 1,
                controller: categoryController,
                decoration: InputDecoration(
                  hintText: 'Category',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                child: Text('ADD'),
                onPressed: () {
                  setState(() {
                    loading = true;
                  });

                  databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                    'id': DateTime.now().millisecondsSinceEpoch.toString(),
                    'marketplace': marketplaceController.text.toString(),
                    'farmer_name': farmerNameController.text.toString(),
                    'shop_name': shopNameController.text.toString(),
                    'location_name': locationNameController.text.toString(),
                    'crop_name': cropNameController.text.toString(),
                    'market-type': marketTypeController.text.toString(),
                    'category': categoryController.text.toString(),
                  }).then((_) {
                    Utils().toastMessage('Info Added');
                    setState(() {
                      loading = false;
                    });
                  }).catchError((error) {
                    Utils().toastMessage(error.toString());
                    setState(() {
                      loading = false;
                    });
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
