import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:test_app/bloc/jokes_bloc.dart';
import 'package:test_app/services/fav_joke.dart';
import 'package:test_app/styles.dart';
import '../services/get_joke.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          BlocBuilder<JokeBloc, JokesStates>(
            builder: (BuildContext context, state) {
              List<Widget> children;
              if (state is JokesDataState) {
                children = <Widget>[
                  Container(
                    height: 358,
                    width: 382,
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Styles.cardBackgoround,
                    ),
                    child: Center(
                      child: Text(
                        state.data,
                        style: const TextStyle(color: Colors.white),
                      ),
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
                      color: Styles.cardBackgoround,
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
                  context.read<JokeBloc>().add(JokeLikeEvent());
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
                  context.read<JokeBloc>().add(JokePassEvent());
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
