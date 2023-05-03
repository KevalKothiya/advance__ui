// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

class SwitchValue_Model {
  bool switchValue;

  SwitchValue_Model({required this.switchValue});
}

class Theme_Model {
  bool isDarkMode;

  Theme_Model({required this.isDarkMode});
}

class ProfileSwitchValue_Model {
  bool ProfileSwitchValue;

  ProfileSwitchValue_Model({
    required this.ProfileSwitchValue,
  });
}

class SettingsSwitchValue_Model {
  bool SettingsSwitchValue;

  SettingsSwitchValue_Model({
    required this.SettingsSwitchValue,
  });
}

class DatePicker_Model {
  DateTime initialDate;
  TimeOfDay initialTime;
  DateTime initialCupertinoTime;

  DatePicker_Model({
    required this.initialDate,
    required this.initialTime,
    required this.initialCupertinoTime,
  });
}

class AddContactVariable_Model {
  String fullName;
  String mobileNumber;
  String Chats;

  AddContactVariable_Model({
    required this.fullName,
    required this.Chats,
    required this.mobileNumber,
  });
}

class Profile_Model {
  String name;
  String bio;

  Profile_Model({required this.name, required this.bio});
}

class ProfileVariable_Model {
  String name;
  String bio;

  ProfileVariable_Model({
    required this.name,
    required this.bio,
  });
}
