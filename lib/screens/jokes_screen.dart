import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/styles.dart';
import 'package:test_app/widgets/joke_card.dart';

import '../bloc/jokes_bloc.dart';

class JokesScreen extends StatelessWidget {
  const JokesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  color: Styles.cardBackgoround),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 38,
            ),
            JokeCard(),
          ]),
        ],
      ),
    );
  }
}
