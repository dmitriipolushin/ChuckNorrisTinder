import 'package:flutter/material.dart';
import 'package:test_app/styles.dart';
import 'package:test_app/widgets/joke_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Column(children: [
              Image.asset(
                'assets/images/chuck.png',
                width: 183,
                height: 112,
              ),
              const Text(
                'Tinder',
                style: TextStyle(
                    fontFamily: 'Karma',
                    fontSize: 36,
                    color: Styles.CardBackgoround),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 38,
              ),
              JokeCard(),
            ]),
          ],
        ),
      ),
    );
  }
}
