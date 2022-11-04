import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/services/fav_joke.dart';
import 'package:test_app/styles.dart';


class FavoritesScreen extends StatelessWidget{
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late Box<FavJoke> jokeBox;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ValueListenableBuilder(
            valueListenable: Hive.box<FavJoke>('fav_jokes').listenable(),
            builder: (context, Box<FavJoke> _notesBox, _) {
              jokeBox = _notesBox;
              return ListView.builder(
                  itemCount: _notesBox.values.length,
                  itemBuilder: (BuildContext context, int index) {
                    final joke = jokeBox.getAt(index);
                    print(jokeBox.getAt(index));
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Styles.cardBackgoround,
                      ),
                      child: ListTile(
                        title: Text(joke?.joke ?? 'test', style: const TextStyle(color: Colors.white),),
                        onLongPress: () => jokeBox.deleteAt(index),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
