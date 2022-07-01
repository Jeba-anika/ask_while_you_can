import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'list_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isVisible = false;
  String q = 'Loading';
  Random rnd = new Random();

  void showToast() {
    Fluttertoast.showToast(msg: 'Copied');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 60.w,
                    height: 60.h,
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          primary: Colors.blueGrey.shade700,
                          fixedSize: Size(150, 32),
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12),
                          side: BorderSide(
                              width: 2, color: Colors.blueGrey.shade700),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {},
                      child: Text('Record Their Answer'))
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              Container(
                height: 40.h,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    'Grow Closer to your loved ones \nby asking them question ',
                    style: TextStyle(color: Colors.blueGrey.shade600),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Visibility(
                visible: isVisible,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey.shade700,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      ClipboardData data = ClipboardData(text: q);
                      Clipboard.setData(data).then((value) => {
                            Fluttertoast.showToast(
                                msg: 'Copied Successfully',
                                backgroundColor: Colors.blueGrey.shade700,
                                textColor: Colors.white)
                          });
                    },
                    icon: Icon(Icons.ads_click),
                    label: Text(
                      'Click To Copy',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      fixedSize: Size.fromWidth(500),
                      primary: Colors.white,
                      onPrimary: Colors.blueGrey.shade600,
                      alignment: Alignment.topCenter,
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Text(
                    q,
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey.shade700,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {
                  ClipboardData data = ClipboardData(text: q);
                  Clipboard.setData(data).then((value) => {
                        Fluttertoast.showToast(
                            msg: 'Copied Successfully',
                            backgroundColor: Colors.blueGrey.shade700,
                            textColor: Colors.white)
                      });
                  //.then((value) => {
                  //ScaffoldMessenger.of(context).showSnackBar(
                  // SnackBar(content: Text('Hello, I am here')))
                  //});
                },
                icon: Icon(Icons.copy),
                label: Text(
                  'Copy This Question',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20.h,
                width: 10.w,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey.shade50,
                    onPrimary: Colors.blueGrey.shade700,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.white),
                    side: BorderSide(width: 2, color: Colors.blueGrey.shade700),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {
                  setState(() {
                    var element = quesions[rnd.nextInt(quesions.length)];
                    q = element;
                  });
                },
                icon: Icon(Icons.swap_horiz),
                label: Text(
                  'Try Another One',
                  style: TextStyle(color: Colors.blueGrey.shade700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
