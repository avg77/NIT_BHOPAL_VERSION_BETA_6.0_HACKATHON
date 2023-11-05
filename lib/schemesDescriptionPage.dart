import 'package:flutter/material.dart';

class SchemeDescriptionPage extends StatelessWidget {
  final String schemeName;
  final String schemeDescription;
  final String eligibility;
  final String applicationProcedure;
  final String rulesAndRegulations;

  SchemeDescriptionPage({
    required this.schemeName,
    required this.schemeDescription,
    required this.eligibility,
    required this.applicationProcedure,
    required this.rulesAndRegulations,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.green, Colors.blue],
                ),
              ),
              padding: EdgeInsets.only(left: 16, right: 16, top: 40),
              width: double.infinity,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Custom back button
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 44,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16), // Add spacing below the back button
                  Center(
                    child: Text(
                      'Application Process',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Application & Eligibility Criteria',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Scheme Name: \n', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                          TextSpan(text: schemeName, style: TextStyle(color: Colors.green)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Scheme Description: \n', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                          TextSpan(text: schemeDescription, style: TextStyle(color: Colors.green)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.normal,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Eligibility: \n', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                          TextSpan(text: eligibility),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Application Procedure: \n', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                          TextSpan(text: applicationProcedure, style: TextStyle(color: Colors.green)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Rules and Regulations: \n', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                          TextSpan(text: rulesAndRegulations, style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}