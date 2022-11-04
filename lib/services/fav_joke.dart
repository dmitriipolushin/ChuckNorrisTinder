import 'package:hive/hive.dart';

part 'fav_joke.g.dart';

@HiveType(typeId: 1)
class FavJoke {
  FavJoke({required this.joke});

  @HiveField(0)
  String joke;
}
