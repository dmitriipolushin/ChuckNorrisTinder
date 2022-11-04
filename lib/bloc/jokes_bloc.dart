import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:test_app/services/get_joke.dart';

import '../services/fav_joke.dart';

class JokeBloc extends Bloc<JokesEvents, JokesStates> {

  Future<void> _addFavJoke(FavJoke inputJoke) async {
    var jokeBox = await Hive.openBox<FavJoke>('fav_jokes');
    jokeBox.add(FavJoke(joke: inputJoke.joke));
  }

  JokeBloc() : super(JokesLoadingState()) {
    on<JokeLikeEvent>(_onLikeEvent);
    on<JokePassEvent>(_onPassEvent);
    add(JokePassEvent());
  }

  _onLikeEvent(JokeLikeEvent event, Emitter<JokesStates> emit) async {
    if (state is JokesDataState) {
      await _addFavJoke(FavJoke(joke: (state as JokesDataState).data));
    }
    emit(JokesLoadingState());
    final String data = await getNewJoke();
    emit(JokesDataState(data));
  }

  _onPassEvent(JokePassEvent event, Emitter<JokesStates> emit) async {
    emit(JokesLoadingState());
    final String data = await getNewJoke();
    emit(JokesDataState(data));
  }

}

abstract class JokesStates {}

class JokesLoadingState extends JokesStates {
}
class JokesDataState extends JokesStates {
  String data;
  JokesDataState(this.data);
}

abstract class JokesEvents {}

class JokeLikeEvent extends JokesEvents {}
class JokePassEvent extends JokesEvents {}
