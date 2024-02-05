import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipark/routes/home_page_route.dart';
import 'package:ipark/utils/bluetooth.dart';
List<String> randomParkingSlots = List.empty(growable: true);

void main() async {
  await GetStorage.init();
  int? walletMoney = GetStorage().read<int>('wallet_money');
  if (walletMoney == null) {
    GetStorage().write('wallet_money', 0);
  }
  randomParkingSlots.add("1 (Parked)");
  randomParkingSlots.add("2 (Parked)");
  randomParkingSlots.add("3");
  randomParkingSlots.add("4 (Booked)");
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
