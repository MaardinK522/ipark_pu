import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipark/pageview_items/wallet_money_price_pageview_item.dart';
import 'package:ipark/routes/coupon_added_to_walled_page_route.dart';

class AddMoneyPageRoute extends StatefulWidget {
  const AddMoneyPageRoute({super.key});

  @override
  State<AddMoneyPageRoute> createState() => _AddMoneyPageRouteState();
}

class _AddMoneyPageRouteState extends State<AddMoneyPageRoute> {
  int walletMoney = 0;
  var parkingPrices = [10, 30, 50, 100];
  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    walletMoney = GetStorage().read<int>('wallet_money')!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Hero(
          tag: "app_name_hero_animation",
          child: Material(
            color: Colors.transparent,
            child: Text(
              "iPARK WALLET",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: "money_card_hero_animation",
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "WALLET MONEY : ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  Text(
                                    "\u{20B9} $walletMoney",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(height: 30, thickness: 1),
                              Text(
                                "CURRENT PARKING FAIR : ",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\u{20B9} 10",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  IconButton(
                                    splashColor:
                                        Theme.of(context).colorScheme.primary,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    onPressed: () async {
                                      Get.dialog(
                                        AlertDialog(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          title: Text(
                                            "Please wait for\nupdating the new rates..",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const SizedBox(height: 20),
                                              CircularProgressIndicator(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                              const SizedBox(height: 20),
                                              Text(
                                                "Fetching...",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        barrierDismissible: false,
                                      );
                                      await Future.delayed(
                                        const Duration(seconds: 2),
                                      );
                                      Get.back();
                                      Get.snackbar(
                                        "Update parking rates :",
                                        "\u{20B9} 10 per hour",
                                        maxWidth: double.maxFinite,
                                        snackPosition: SnackPosition.BOTTOM,
                                        duration: const Duration(seconds: 4),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                        colorText: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      );
                                    },
                                    icon: const Icon(Icons.refresh_rounded),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "SELECTED COUPON : ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  transitionBuilder: (child, animation) =>
                                      ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  ),
                                  child: Text(
                                    "\u{20B9} ${parkingPrices[selectedIndex]}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 200,
                              width: double.maxFinite,
                              child: PageView.builder(
                                controller: PageController(
                                  viewportFraction: 0.875,
                                  initialPage: selectedIndex,
                                ),
                                itemCount: parkingPrices.length,
                                onPageChanged: (index) => setState(() {
                                  selectedIndex = index;
                                }),
                                itemBuilder: (context, index) {
                                  return WalletMoneyPricePageViewItem(
                                    price: parkingPrices[index],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Hero(
                tag: "fab_hero_money_animation",
                child: Material(
                  color: Colors.transparent,
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
                      Get.dialog(
                        AlertDialog(
                          actionsPadding: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: const Text(
                            "Are you sure ?",
                            textAlign: TextAlign.center,
                          ),
                          titleTextStyle: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          content: Text(
                            "This is to confirm\nregarding purchasing\nthe coupon of \u{20B9}${parkingPrices[selectedIndex]}\nin your iPark wallet.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          actionsAlignment: MainAxisAlignment.spaceAround,
                          actionsOverflowAlignment: OverflowBarAlignment.center,
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "NO",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                Get.back();
                                GetStorage().write(
                                  'wallet_money',
                                  GetStorage().read('wallet_money') +
                                      parkingPrices[selectedIndex],
                                );
                                Get.dialog(
                                  AlertDialog(
                                    actionsPadding: const EdgeInsets.all(20),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    title: Text(
                                      "Adding parking coupon in your account of \u{20B9} ${parkingPrices[selectedIndex]}",
                                      textAlign: TextAlign.center,
                                    ),
                                    titleTextStyle: TextStyle(
                                      fontSize: 20,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: CircularProgressIndicator(),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "Loading...",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  barrierDismissible: false,
                                );
                                await Future.delayed(
                                  const Duration(seconds: 3),
                                  () {
                                    Get.off(
                                      () => CouponAddedToWalletPageRoute(
                                        couponPrice:
                                            parkingPrices[selectedIndex],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "YES",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        barrierDismissible: false,
                      );
                    },
                    child: const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_rounded,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "ADD MONEY",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
