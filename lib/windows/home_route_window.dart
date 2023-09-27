import 'package:flutter/material.dart';

class HomeRouteWindow extends StatelessWidget {
  const HomeRouteWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
      child: Hero(
        tag: "park_card_hero_animation",
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              width: 5,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.minPositive,
          ),
        ),
      ),
    );
  }
}
