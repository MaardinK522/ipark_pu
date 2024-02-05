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
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 2,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            size: 25,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          SizedBox(
                            height: 30,
                            child: VerticalDivider(
                              width: 20,
                              thickness: 1,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Parul University Waghodia, Waghodia",
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                        color: Colors.grey,
                        height: 40,
                      ),
                      Text(
                        "Please book parking slot\nto show left parking time.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        textAlign: TextAlign.center,
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
