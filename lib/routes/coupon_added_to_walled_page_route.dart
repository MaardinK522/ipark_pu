import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipark/routes/parking_slot_booked_page_route.dart';

import 'home_page_route.dart';

class CouponAddedToWalletPageRoute extends StatelessWidget {
  final int couponPrice;

  const CouponAddedToWalletPageRoute({super.key, required this.couponPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("iPARK PURCHASE DONE"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5.0),
          child: CustomProgressBar(
            function: () {
              Get.off(
                preventDuplicates: true,
                () => const HomePage(),
              );
            },
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
                            "Successfully added \nthe coupon of : \u{20B9} $couponPrice",
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
    );
  }
}
