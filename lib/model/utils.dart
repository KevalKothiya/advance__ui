import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurpleAccent,
      brightness: Brightness.light,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
  );
}

class AllTimeAccessTextTheme {
  static TextStyle textStyleLight = const TextStyle(
    color: CupertinoColors.black,
    fontSize: 16,
    decoration: TextDecoration.none,
  );

  static TextStyle textStyleDark = const TextStyle(
    color: CupertinoColors.white,
    fontSize: 16,
    decoration: TextDecoration.none,
  );
}

DateTime? pickDate;
TimeOfDay? pickTime;

List<String> imageList = [];
List<DateTime> dateList = [];
List<TimeOfDay> timeList = [];

TextEditingController fullNameController = TextEditingController();
TextEditingController phoneumberController = TextEditingController();
TextEditingController chatConversationController = TextEditingController();


TextEditingController profileNameController = TextEditingController();
TextEditingController profileBioController = TextEditingController();

GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

File? image;


