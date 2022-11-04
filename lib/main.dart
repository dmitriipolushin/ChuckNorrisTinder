import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/app.dart';
import 'package:test_app/services/fav_joke.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final applicatonDocumentDir =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(applicatonDocumentDir.path);
  Hive.registerAdapter(FavJokeAdapter());
  await Hive.openBox<FavJoke>('fav_jokes');
  runApp(const ChuckNorrisTinder());
}
