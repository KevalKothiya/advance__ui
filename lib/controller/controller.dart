import 'dart:io';
import 'package:advance_ui/model/globals.dart';
import 'package:advance_ui/model/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchValue_Provider extends ChangeNotifier {
  SwitchValue_Model switchValue_Model;

  SwitchValue_Provider({required this.switchValue_Model});

  AlternateValue() async {
    switchValue_Model.switchValue = !switchValue_Model.switchValue;

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool('SwitchValue', switchValue_Model.switchValue);
    notifyListeners();
  }
}

class ProfileSwitchValue_Provider extends ChangeNotifier {
  ProfileSwitchValue_Model profileSwitchValue_Model;

  ProfileSwitchValue_Provider({
    required this.profileSwitchValue_Model,
  });

  AlternateValue() async {
    profileSwitchValue_Model.ProfileSwitchValue =
        !profileSwitchValue_Model.ProfileSwitchValue;
    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(
        'ProfileSwitch', profileSwitchValue_Model.ProfileSwitchValue);
  }
}

class SettingSwitchValue_Provider extends ChangeNotifier {
  SettingsSwitchValue_Model settingsSwitchValue_Model;

  SettingSwitchValue_Provider({
    required this.settingsSwitchValue_Model,
  });

  AlternateValue() async {
    settingsSwitchValue_Model.SettingsSwitchValue =
        !settingsSwitchValue_Model.SettingsSwitchValue;
    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(
        'SettingSwitch', settingsSwitchValue_Model.SettingsSwitchValue);
  }
}

class Theme_Provider extends ChangeNotifier {
  Theme_Model theme_model;

  Theme_Provider({required this.theme_model});

  AlternateValue() async {
    theme_model.isDarkMode = !theme_model.isDarkMode;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool('isDarkMode', theme_model.isDarkMode);
    notifyListeners();
  }
}

class DatePicker_Provider extends ChangeNotifier {
  DatePicker_Model datePicker_Model = DatePicker_Model(
    initialDate: DateTime.now(),
    initialTime: TimeOfDay.now(),
    initialCupertinoTime: DateTime.now(),
  );

  initializationDate() async {
    datePicker_Model.initialDate = pickDate!;
    notifyListeners();
  }

  initializationTime() async {
    datePicker_Model.initialTime = pickTime ?? TimeOfDay.now();
    notifyListeners();
  }

  AddinitializationInList() async {
    dateList.add(datePicker_Model.initialDate);
    timeList.add(datePicker_Model.initialTime);
    notifyListeners();
  }
}

class AddContactVariable_provider extends ChangeNotifier{
  List<String> fullName = [];
  List<String> mobileNumber = [];
  List<String> chats = [];
  List<String> recentCallFullName = [];
  List<String> recentCallMobileNumber = [];
  List<String> recentCallChats = [];
  AddContactVariable_Model addContactVariable_Model;

  AddContactVariable_provider({required this.addContactVariable_Model});

  initialization () async {
    addContactVariable_Model.fullName = fullNameController.text;
    addContactVariable_Model.mobileNumber = phoneumberController.text;
    addContactVariable_Model.Chats = chatConversationController.text;

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString('FullName', addContactVariable_Model.fullName);
    await preferences.setString('MobileNumber', addContactVariable_Model.mobileNumber);
    await preferences.setString('Chats', addContactVariable_Model.Chats);
    notifyListeners();
  }

  AddAllContactinitialization() async {
    fullName.add(addContactVariable_Model.fullName);
    mobileNumber.add(addContactVariable_Model.mobileNumber);
    chats.add(addContactVariable_Model.Chats);

    fullNameController.clear();
    phoneumberController.clear();
    chatConversationController.clear();


    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setStringList('FullNameList', fullName);
    await preferences.setStringList('MobileNumberList', mobileNumber);
    await preferences.setStringList('ChatsList', chats);
    notifyListeners();
  }

  AddRecentCall(fullName,mobileNumber,chats) async {
    recentCallFullName.add(fullName);
    recentCallMobileNumber.add(mobileNumber);
    recentCallChats.add(chats);
    notifyListeners();
  }

  Delete(fullName,mobileNumber,chats) async {
    this.fullName.remove(fullName);
    this.mobileNumber.remove(mobileNumber);
    this.chats.remove(chats);
    notifyListeners();
  }
}

class Profile_Provider extends ChangeNotifier{
  Profile_Model profile_model;

  Profile_Provider({required this.profile_model});

  initialization() async {
    profile_model.name = profileNameController.text;
    profile_model.bio = profileBioController.text;

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString('ProfileName', profile_model.name);
    await preferences.setString('ProfileBio', profile_model.bio);

    notifyListeners();
  }

  clear() async {
    profile_model.name = "";
    profile_model.bio = "";
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString('ProfileName', profile_model.name);
    await preferences.setString('ProfileBio', profile_model.bio);

    profileNameController.clear();
    profileBioController.clear();
    notifyListeners();
  }
}


class ImagePickerProvider extends ChangeNotifier{
  File? image;

  Future<void> getImageFromCamera() async {
    ImagePicker picker = ImagePicker();
    notifyListeners();

    XFile? _image = await picker.pickImage(source: ImageSource.camera);

    String? path = _image!.path;

    if(_image != null){
      image = File(path);
      imageList.add(path);

    }
    notifyListeners();
  }

  Future<void> getImageFromGallery() async {

    ImagePicker picker = ImagePicker();
    notifyListeners();

    XFile? _image = await picker.pickImage(source: ImageSource.gallery);

    String? path = _image!.path;

    if(_image!= null ){
      image = File(path);
      imageList.add(path);
    }
    notifyListeners();
  }

  Clear() {
    image = null;
    notifyListeners();
  }
}

class ProfileImage_Provider extends ChangeNotifier{

  Future<void> getImageFromCamera() async {
    ImagePicker picker = ImagePicker();
    notifyListeners();

    XFile? _image = await picker.pickImage(source: ImageSource.camera);

    String? path = _image!.path;

    if(_image != null){
      image = File(path);
    notifyListeners();
    }
  }
  clear(){
    image = null;
    notifyListeners();
  }
}




