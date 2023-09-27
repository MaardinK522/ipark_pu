import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page_route.dart';

class ParkingSlotBookedPageRoute extends StatefulWidget {
  final int bookParkingSlot;

  const ParkingSlotBookedPageRoute({
    super.key,
    required this.bookParkingSlot,
  });

  @override
  State<ParkingSlotBookedPageRoute> createState() =>
      _ParkingSlotBookedPageRouteState();
}

class _ParkingSlotBookedPageRouteState
    extends State<ParkingSlotBookedPageRoute> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: GestureDetector(
        onLongPress: () {
          Get.offAll(
            () => const HomePage(),
          );
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text("iPARK BOOKING DONE"),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(5.0),
              child: _CustomProgressBar(),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.1,
            ),
            child: Column(
              children: [
                const Expanded(
                  child: Center(
                    child: Text(
                      "Redirecting you to the\nhome page.",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    elevation: 10,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Successfully booked the parking slot :${widget.bookParkingSlot} ",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "We are committed to the care of your vehicle as you and your family enjoy your leisure.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomProgressBar extends StatefulWidget {
  const _CustomProgressBar();

  @override
  State<_CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<_CustomProgressBar> {
  double progressValue = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        if (progressValue < 1.0) {
          progressValue += 0.1;
        } else {
          Get.offAll(
            () => const HomePage(),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progressValue,
      backgroundColor: Theme.of(context).colorScheme.primary,
      color: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}
