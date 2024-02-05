import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class WalletRouteWindow extends StatefulWidget {
  const WalletRouteWindow({super.key});

  @override
  State<WalletRouteWindow> createState() => _WalletRouteWindowState();
}

class _WalletRouteWindowState extends State<WalletRouteWindow> {
  int walletMoney = 0;
  int perHourRate = 10;

  @override
  void initState() {
    super.initState();
    walletMoney = GetStorage().read<int>('wallet_money')!;
  }

  @override
  Widget build(BuildContext context) {
    double? deviceWidth = MediaQuery.of(context).size.width - 200;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Hero(
        tag: "money_card_hero_animation",
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Theme.of(context).colorScheme.primaryContainer,
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      "Wallet amount",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      "\u{20B9} $walletMoney",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      "Parking time: ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      "${walletMoney ~/ perHourRate} hr : 00 min",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Material(
                color: Colors.transparent,
                child: Text(
                  'Per hour rate is \u{20B9} $perHourRate',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        height: deviceWidth,
                        width: deviceWidth,
                        child: CircularProgressIndicator(
                          strokeCap: StrokeCap.round,
                          value: (walletMoney / perHourRate) / 10,
                          strokeWidth: 10,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          '${walletMoney ~/ perHourRate} : 00',
                          style: TextStyle(
                            fontSize: deviceWidth / 5,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
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
