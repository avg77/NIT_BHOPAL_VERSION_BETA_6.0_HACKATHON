import 'package:farmer_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final postController1 = TextEditingController();
  final postController2 = TextEditingController();
  final postController3 = TextEditingController();
  final postController4 = TextEditingController();
  final postController5 = TextEditingController();
  final postController6 = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref().child('Schemes');

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
                controller: postController1,
                decoration: InputDecoration(
                  hintText: 'Policy name English',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 1,
                controller: postController2,
                decoration: InputDecoration(
                  hintText: 'Policy name Hindi',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 3,
                controller: postController3,
                decoration: InputDecoration(
                  hintText: 'Policy Description English',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 3,
                controller: postController4,
                decoration: InputDecoration(
                  hintText: 'Policy Description Hindi',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 2,
                controller: postController5,
                decoration: InputDecoration(
                  hintText: 'Policy Eligibility English',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 2,
                controller: postController6,
                decoration: InputDecoration(
                  hintText: 'Policy Eligibility Hindi',
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
                    'title-en': postController1.text.toString(),
                    'title-hi': postController2.text.toString(),
                    'description-en': postController3.text.toString(),
                    'description-hi': postController4.text.toString(),
                    'eligibility-en':postController5.text.toString(),
                    'eligibility-hi':postController6.text.toString(),
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
