import 'package:flutter/material.dart';

void main() => runApp(AppointmentFormApp());

class AppointmentFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppointmentForm(),
    );
  }
}

class AppointmentForm extends StatefulWidget {
  @override
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  DateTime _selectedDate = DateTime.now(); // Initialize to the current date

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Form'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name.';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16.0), // Add some spacing
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  controller: _contactController,
                  decoration: InputDecoration(
                    labelText: 'Contact Details',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your contact details.';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16.0), // Add some spacing
              ElevatedButton(
                onPressed: () {
                  _selectDate(context); // Show the date picker
                },
                child: Text('Select Appointment Date'),
              ),
              SizedBox(height: 16.0),
              Text(
                _selectedDate == null
                    ? 'Appointment Date: Not selected'
                    : 'Appointment Date: ${_selectedDate.toLocal()}',
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, handle submission here
                    String name = _nameController.text;
                    String contact = _contactController.text;
                    String date = _selectedDate != null
                        ? _selectedDate.toLocal().toString()
                        : 'Not selected';
                    print('Name: $name, Contact: $contact, Date: $date');
                    // Additional logic for submission (e.g., send data to server)
                  }
                },
                child: Text('Submit Appointment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}