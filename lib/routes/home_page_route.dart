import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipark/windows/home_route_window.dart';
import 'package:ipark/windows/wallet_route_window.dart';

import 'add_money_page_route.dart';
import 'book_parking_page_route.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomIndex = 0;
  final _windows = [
    const HomeRouteWindow(),
    const WalletRouteWindow(),
  ];
  final PageController _pageController = PageController();
  bool isWalletSelected = false;
  static const _fabIconSize = 20.0;
  static const _fabTextSize = 15.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        elevation: 10,
        centerTitle: true,
        title: const Hero(
          tag: "app_name_hero_animation",
          child: Material(
            color: Colors.transparent,
            child: Text(
              "iPARK",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _bottomIndex = index;
          });
        },
        children: _windows,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        selectedLabelStyle: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
        ),
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
        unselectedIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        currentIndex: _bottomIndex,
        onTap: (index) {
          if (index == 1) {
            setState(() {
              isWalletSelected = true;
            });
          } else {
            setState(() {
              isWalletSelected = false;
            });
          }
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 25,
            ),
            label: "Home",
            activeIcon: Icon(
              Icons.home_rounded,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
              size: 25,
            ),
            label: "Wallet",
            activeIcon: Icon(
              Icons.account_balance_wallet_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 60,
        child: Visibility(
          visible: !isWalletSelected,
          replacement: FloatingActionButton.extended(
            isExtended: true,
            heroTag: "fab_hero_money_animation",
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: () {
              Get.to(
                () => const AddMoneyPageRoute(),
                transition: Transition.downToUp,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 500),
              );
            },
            label: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add_rounded,
                  size: _fabIconSize,
                ),
                SizedBox(width: 10),
                Text(
                  "MONEY",
                  style: TextStyle(fontSize: _fabTextSize),
                ),
              ],
            ),
          ),
          child: Hero(
            tag: "fab_hero_park_animation",
            child: FloatingActionButton.extended(
              isExtended: true,
              heroTag: null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                Get.to(
                  () => const BookParkingPageRoute(),
                  transition: Transition.downToUp,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 500),
                );
              },
              label: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.directions_car_filled_rounded,
                    size: _fabIconSize,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "PARK",
                    style: TextStyle(fontSize: _fabTextSize),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
