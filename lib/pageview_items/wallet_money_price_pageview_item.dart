import 'package:flutter/material.dart';

class WalletMoneyPricePageViewItem extends StatelessWidget {
  final int price;

  const WalletMoneyPricePageViewItem({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "PRICE : ",
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  "\u{20B9} $price",
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TIME : ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  "${price ~/ 10} hr",
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
