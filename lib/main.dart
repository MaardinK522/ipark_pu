import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipark/routes/home_page_route.dart';

void main() async {
  await GetStorage.init();
  int? walletMoney = GetStorage().read<int>('wallet_money');
  if (walletMoney == null) {
    GetStorage().write('wallet_money', 100);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final _seedColor = const Color.fromARGB(255, 255, 0, 0);

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
// TODO #1 :  A scene to display the plan of the location and be able to select parking.
