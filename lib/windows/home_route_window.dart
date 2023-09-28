import 'package:flutter/material.dart';

class HomeRouteWindow extends StatelessWidget {
  const HomeRouteWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Hero(
        tag: "park_card_hero_animation",
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 2,
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
