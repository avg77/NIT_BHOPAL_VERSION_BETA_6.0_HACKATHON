import 'package:farmer_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AddLoanScreen extends StatefulWidget {
  const AddLoanScreen({Key? key}) : super(key: key);

  @override
  State<AddLoanScreen> createState() => _AddLoanScreenState();
}

class _AddLoanScreenState extends State<AddLoanScreen> {
  final postController1 = TextEditingController();
  final postController2 = TextEditingController();
  final postController3 = TextEditingController();
  final postController4 = TextEditingController();
  final postController5 = TextEditingController();
  final postController6 = TextEditingController();
  final postController7 = TextEditingController();
  final postController8 = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref().child('Loans');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Loans'),
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
                  hintText: 'Loan name English',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 3,
                controller: postController3,
                decoration: InputDecoration(
                  hintText: 'Loan Description English',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 2,
                controller: postController5,
                decoration: InputDecoration(
                  hintText: 'Loan Eligibility English',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 2,
                controller: postController7,
                decoration: InputDecoration(
                  hintText: 'Loan Amount English',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
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
