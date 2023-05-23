import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sentimentapp/pages/result_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  double? _deviceHight;
  double? _deviceWidth;
  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _deviceHight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 210, 210, 210),
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: Center(
          child: Container(
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: _homePageTitle()),
                  SizedBox(
                    height: 20,
                  ),
                  _searchBar(),
                  _searchButton()
                ]),
          ),
        ),
      ),
    ));
  }

  Widget _homePageTitle() {
    return Text(
      '#Check the sentiment of your favourite subreddit!#',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white,
          fontSize: _deviceWidth! > 600 ? _deviceWidth! * 0.025 : 25,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _searchBar() {
    return Container(
      width: _deviceWidth! * 0.45,
      child: TextField(
        controller: textEditingController,
        cursorColor: Color.fromRGBO(238, 195, 189, 1),
        inputFormatters: [UpperCaseTextFormatter()],
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 3, color: Color.fromRGBO(238, 195, 189, 1))),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
            filled: true,
            fillColor: Colors.white,
            hintText: "#WALLSTREETBETS",
            hintStyle: TextStyle(fontWeight: FontWeight.normal)),
      ),
    );
  }

  Widget _searchButton() {
    return Stack(
      children: [
        MaterialButton(
          onPressed: () async {
            setState(() {
              _isLoading = true;
            });
            String searchQuery = textEditingController.text;
            Uri apiUrl = Uri.parse('http://127.0.0.1:5000/?query=$searchQuery');
            http.Response response = await http.get(apiUrl);
            if (response.statusCode == 200) {
              // Convert the response body from JSON to a Map
              Map<String, dynamic> data = jsonDecode(response.body);

              // Navigate to the result page and pass the data as arguments
              Navigator.pushNamed(context, 'result',
                  arguments: {'data': data, 'searchQuery': searchQuery});
              print(data);
            } else if (response.statusCode == 500) {
              Navigator.pushNamed(context, 'error');
            } else {
              // Handle the error
              print('Request failed with status: ${response.statusCode}.');
            }
            setState(() {
              _isLoading = false;
            });

            // Navigator.pushNamed(context, 'result');
          },
          minWidth: 200,
          height: 65,
          color: Color.fromRGBO(238, 195, 189, 1),
          child: Text(
            "SEARCH",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        if (_isLoading)
          Positioned.fill(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
