import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page_route.dart';

class ParkingSlotBookedPageRoute extends StatelessWidget {
  final int bookParkingSlot;
  final int parkingTime;

  const ParkingSlotBookedPageRoute({
    super.key,
    required this.bookParkingSlot,
    required this.parkingTime,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("iPARK BOOKING DONE"),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(5.0),
            child: CustomProgressBar(
              function: () => Get.off(
                preventDuplicates: true,
                () => const HomePage(),
              ),
            ),
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
              const Center(
                child: Text(
                  "Redirecting you to the\nhome page.",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
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
                              "Successfully booked the parking slot :$bookParkingSlot ",
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
    );
  }
}

class CustomProgressBar extends StatefulWidget {
  final Function function;

  const CustomProgressBar({
    super.key,
    required this.function,
  });

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  double progressValue = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(milliseconds: 10),
      (timer) {
        setState(() {
          if (progressValue < 1.0) {
            progressValue += 0.001;
          } else {
            widget.function();
          }
        });
      },
    );
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
