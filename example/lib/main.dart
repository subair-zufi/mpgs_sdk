import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_mpgs_sdk/flutter_mpgs.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _initStatus = 'Unknown';
  String _updateStatus = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initSDK() async {
    String initState = "";
    try {
      final region = Region.MTF;
      final gatewayId = "TEST10000025086";
      final apiVersion = "46";

      await FlutterMpgsSdk.init(
          region: region, gatewayId: gatewayId, apiVersion: apiVersion);
      initState = "initialized with region: $region, gatewayId: $gatewayId";
    } on PlatformException catch (e, stack) {
      print(stack);
      print(e);
      initState = e.message;
    }
    if (!mounted) return;
    setState(() {
      _initStatus = initState;
    });
  }
  Future<void> _updateSession() async {
    String updateStatus = "";

    try {
      final String sessionId = "SESSION0002130457496K8245619M90";
      final String cardholderName = "test";
      final String cardNumber = "5123456709720008";
      final String year = "31";
      final String month = "01";
      final String cvv = "123";

      await FlutterMpgsSdk.updateSession(
          sessionId: sessionId,
          cardHolder: cardholderName,
          cardNumber: cardNumber,
          year: year,
          month: month,
          cvv: cvv);
      updateStatus =
      "Session updated.\nsessionId: $sessionId\ncardholderName:$cardholderName\ncardNumber:$cardNumber\nyear:$year\nmonth:$month\ncvv:$cvv";
    } on PlatformException catch (e) {
      print(e);
      updateStatus = e.message;
    }

    if (!mounted) return;
    setState(() {
      _updateStatus = updateStatus;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("MPGS Test",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Init SDK"),
              onPressed: () {
                this._initSDK();
              },
            ),
            Text(
              "$_initStatus",
              textAlign: TextAlign.center,
            ),
            TextFormField(onChanged: (t) {}),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Update Session"),
              onPressed: () {
                this._updateSession();
              },
            ),
            Text(
              "$_updateStatus",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
