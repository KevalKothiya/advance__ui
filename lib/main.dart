import 'package:advance_ui/controller/controller.dart';
import 'package:advance_ui/model/globals.dart';
import 'package:advance_ui/model/utils.dart';
import 'package:advance_ui/motherPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();

  bool switchValue = await preferences.getBool('SwitchValue') ?? false;
  bool profileSwitchValue = await preferences.getBool('ProfileSwitch') ?? false;
  bool settingsSwitchValue =
      await preferences.getBool('SettingSwitch') ?? false;
  bool isDarkMode = await preferences.getBool('isDarkMode') ?? false;

  String fullName = await preferences.getString('FullName') ?? "";
  String mobileNumber = await preferences.getString('MobileNumber') ?? "";
  String Chats = await preferences.getString('Chats') ?? "";

  String name = await preferences.getString('ProfileName') ?? "";
  String bio = await preferences.getString('ProfileBio') ?? "";

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SwitchValue_Provider(
            switchValue_Model: SwitchValue_Model(switchValue: switchValue),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileSwitchValue_Provider(
            profileSwitchValue_Model: ProfileSwitchValue_Model(
                ProfileSwitchValue: profileSwitchValue),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingSwitchValue_Provider(
            settingsSwitchValue_Model: SettingsSwitchValue_Model(
                SettingsSwitchValue: settingsSwitchValue),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => Theme_Provider(
            theme_model: Theme_Model(isDarkMode: isDarkMode),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => DatePicker_Provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddContactVariable_provider(
            addContactVariable_Model: AddContactVariable_Model(
                fullName: fullName, Chats: Chats, mobileNumber: mobileNumber),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => Profile_Provider(
            profile_model: Profile_Model(name: name, bio: bio),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ImagePickerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileImage_Provider(),
        ),
      ],
      builder: (context, _) => Sizer(
        builder: (context, _, __) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              (Provider.of<Theme_Provider>(context).theme_model.isDarkMode)
                  ? ThemeMode.dark
                  : ThemeMode.light,
          initialRoute: '/',
          routes: {
            '/': (context) => const MotherPage(),
          },
        ),
      ),
    ),
  );
}
