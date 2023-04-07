import 'package:flutter/material.dart';
import 'package:quotes_app/screens/splash_screen.dart';

import 'helpers/db_helper.dart';
import 'helpers/image_api.dart';

Future<void> main()  async {

  WidgetsFlutterBinding.ensureInitialized();

  ImageDatabaseHelper.imageDatabaseHelper.deleteAllData();

  ImageDatabaseHelper.imageDatabaseHelper
      .insertData(allImages: await ImageAPIHelper.imageAPIHelper.fetchImages());
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => const splash_screen(),
      },
    ),
  );
}
