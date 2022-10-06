import 'package:flutter/material.dart';
import 'package:test_app/styles.dart';
import '../services/get_joke.dart';

class JokeCard extends StatefulWidget {
  const JokeCard({Key? key}) : super(key: key);

  @override
  State<JokeCard> createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  Future<String> jokeText = getNewJoke();

  void _newJoke() {
    print('new joke');
    setState(() {
      jokeText = getNewJoke();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          FutureBuilder<String>(
            future: jokeText,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              List<Widget> children;
              print(snapshot.data);
              if (snapshot.hasData) {
                children = <Widget>[
                  Container(
                    height: 358,
                    width: 382,
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Styles.CardBackgoround,
                    ),
                    child: Center(
                      child: Text(
                        snapshot.data ?? '',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ];
              } else if (snapshot.hasError) {
                children = <Widget>[
                  Container(
                    height: 358,
                    width: 382,
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Styles.CardBackgoround,
                    ),
                    child: const Center(
                      child: Text('Error'),
                    ),
                  )
                ];
              } else {
                children = <Widget>[
                  Container(
                    height: 358,
                    width: 382,
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Styles.CardBackgoround,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                ];
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                ),
              );
            },
          ),
          const SizedBox(
            height: 42,
          ),
          Row(children: [
            const Spacer(),
            SizedBox(
              width: 120.0,
              height: 56.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0C2BF2)),
                onPressed: () {
                  setState(() {
                    jokeText = getNewJoke();
                  });
                },
                child: const Text('Like'),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              width: 120.0,
              height: 56.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0C2BF2)),
                onPressed: () {
                  setState(() {
                    jokeText = getNewJoke();
                  });
                },
                child: const Text('Pass'),
              ),
            ),
            const Spacer(),
          ]),
        ],
      ),
    );
  }
}
