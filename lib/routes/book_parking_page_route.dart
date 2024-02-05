import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ipark/main.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipark/routes/parking_slot_booked_page_route.dart';
import 'package:ipark/utils/bluetooth.dart';

class BookParkingPageRoute extends StatefulWidget {
  const BookParkingPageRoute({super.key});

  @override
  State<BookParkingPageRoute> createState() => _BookParkingPageRouteState();
}

class _BookParkingPageRouteState extends State<BookParkingPageRoute> {
  final max = 20;
  final min = 1;
  int itemCount = 0;
  String selectedParkingSlot = "";
  Set<int> uniqueNumbers = <int>{};
  int parkingTime = 1;

  @override
  void initState() {
    super.initState();
    Random rand = Random();
    itemCount = rand.nextInt(15);
    // while (uniqueNumbers.length <= itemCount) {
    //   int randomNumber = min + rand.nextInt(max - min + 1);
    //   if (uniqueNumbers.add(randomNumber)) {
    //     // If the number was added to the set (i.e., it's unique), add it to the list.
    //     randomParkingSlots.add(randomNumber);
    //   }
    // }
    // randomParkingSlots.sort();

    selectedParkingSlot = randomParkingSlots[0];
  }

  late AlertDialog bookingSlotDialog = AlertDialog(
    backgroundColor: Colors.white,
    title: Text(
      "Booking the parking\nslot: $selectedParkingSlot",
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
      ),
      textAlign: TextAlign.center,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    content: SizedBox(
      height: 100,
      width: double.maxFinite,
      child: Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Hero(
          tag: "app_name_hero_animation",
          child: Material(
            color: Theme.of(context).colorScheme.primary,
            child: const Text(
              "iPARKING SLOTS",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Material(
              color: Colors.transparent,
              child: Text(
                "Available parking slots : ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Hero(
                tag: "park_card_hero_animation",
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            "Selected parking slot :",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Material(
                          color: Colors.transparent,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    int itemIndex = randomParkingSlots
                                        .indexOf(selectedParkingSlot);
                                    if (itemIndex > 0) {
                                      itemIndex--;
                                    } else {
                                      itemIndex = randomParkingSlots.length - 1;
                                    }
                                    setState(() {
                                      selectedParkingSlot =
                                          randomParkingSlots[itemIndex];
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        width: 2,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                    child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Center(
                                        child: Icon(
                                          Icons.keyboard_arrow_left_rounded,
                                          size: 50,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                splashFactory: InkSparkle
                                    .constantTurbulenceSeedSplashFactory,
                                splashColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  showMaterialScrollPicker<String>(
                                    context: context,
                                    title: "Select a parking slot",
                                    items: randomParkingSlots,
                                    selectedItem: selectedParkingSlot,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedParkingSlot = value;
                                      });
                                      GetSnackBar(
                                        borderRadius: 20,
                                        snackStyle: SnackStyle.FLOATING,
                                        titleText: Text(
                                          "Selected slot : ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                        messageText: Text(
                                          "Parking : $selectedParkingSlot",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                        duration: const Duration(seconds: 2),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                      ).show();
                                    },
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Text(
                                          "$selectedParkingSlot",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 50,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      width: 2,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    splashFactory: InkSparkle.splashFactory,
                                    splashColor: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    onTap: () {
                                      int itemIndex = randomParkingSlots
                                          .indexOf(selectedParkingSlot);
                                      if (itemIndex <
                                          randomParkingSlots.length - 1) {
                                        itemIndex++;
                                      } else {
                                        itemIndex = 0;
                                      }
                                      setState(() {
                                        selectedParkingSlot =
                                            randomParkingSlots[itemIndex];
                                      });
                                    },
                                    child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Center(
                                        child: Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          size: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Expanded(child: Center()),
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            "Note : Tap on parking\nslot number to see available slots",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showMaterialNumberPicker(
                        title: "Parking reservation time",
                        context: context,
                        selectedNumber: parkingTime,
                        minNumber: 1,
                        maxNumber: 10,
                        onChanged: (value) {
                          setState(() {
                            parkingTime = value;
                          });
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Time :",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Text(
                            "$parkingTime Hr",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Hero(
                    tag: "fab_hero_park_animation",
                    child: OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        elevation: const MaterialStatePropertyAll(1),
                      ),
                      onPressed: () async {
                        if (selectedParkingSlot.length == 1) {
                          Get.dialog(
                            bookingSlotDialog,
                            barrierDismissible: false,
                          );
                          await Future.delayed(const Duration(seconds: 5));
                          Get.back();
                          GetStorage().write(
                            'wallet_money',
                            GetStorage().read('wallet_money') -
                                (parkingTime * 10),
                          );
                          int index = 0;
                          for (int a = 0; a < randomParkingSlots.length; a++) {
                            if (randomParkingSlots[a] == selectedParkingSlot) {
                              index = a;
                            }
                          }
                          Bluetooth.writeData(index);
                          randomParkingSlots[index] =
                              "$selectedParkingSlot (Parked)";
                          Get.offAll(
                            () => ParkingSlotBookedPageRoute(
                              bookParkingSlot: int.parse(selectedParkingSlot),
                              parkingTime: parkingTime,
                            ),
                            transition: Transition.circularReveal,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 500),
                          );
                        }
                      },
                      child: const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.directions_car_filled_rounded,
                                size: 25,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Book now",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
