import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class Bluetooth extends GetxController {
  static BluetoothConnection? _connection;

  static Future<BluetoothConnection?> scanAndConnectDevice() async {
    debugPrint("Connecting...");
    if (await Permission.bluetoothScan.request().isGranted) {
      if (await Permission.bluetoothConnect.request().isGranted) {
        if (_connection == null) {
          String sensorAddress = "00:22:09:01:0A:A4";
          _connection = await BluetoothConnection.toAddress(sensorAddress);
          return Future.value(_connection);
        }
        return Future.value(_connection);
      }
    }
    return Future.value(_connection);
  }

  static void writeData(int index) async {
    _connection?.output.add(ascii.encode("$index"));
  }
}
