import 'package:flutter/material.dart';

class NoSubPage extends StatefulWidget {
  const NoSubPage({super.key});

  @override
  State<NoSubPage> createState() => _NoSubPageState();
}

class _NoSubPageState extends State<NoSubPage> {
  double? _deviceHight;
  double? _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            color: Colors.black,
            width: _deviceWidth,
            height: _deviceHight,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [_closeButton()],
                ),
                Center(
                    child: Text(
                  "WE COULD NOT FIND YOUR SUBREDDIT :(((",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _closeButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.popAndPushNamed(context, 'home');
      },
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
  }
}
