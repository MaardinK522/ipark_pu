import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipark/routes/home_page_route.dart';
import 'package:ipark/utils/bluetooth.dart';

void main() async {
  await GetStorage.init();
  int? walletMoney = GetStorage().read<int>('wallet_money');
  if (walletMoney == null) {
    GetStorage().write('wallet_money', 0);
  }
  Bluetooth.scanAndConnectDevice();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final _seedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'iPark',
      themeMode: ThemeMode.system,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor,
        ),
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor,
        ),
      ),
      home: const HomePage(),
    );
  }
}
