import 'package:advance_ui/component/addContactPage.dart';
import 'package:advance_ui/component/chatPage.dart';
import 'package:advance_ui/component/contactsPage.dart';
import 'package:advance_ui/component/profilePage.dart';
import 'package:advance_ui/component/recentsPage.dart';
import 'package:advance_ui/controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MotherPage extends StatefulWidget {
  const MotherPage({Key? key}) : super(key: key);

  @override
  State<MotherPage> createState() => _MotherPageState();
}

class _MotherPageState extends State<MotherPage> {
  PageController pageController = PageController();

  List children = [
    const AddContactPage(),
    const RecentsPage(),
    const ContactsPage(),
    const ChatsPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchValue_Provider>(context)
            .switchValue_Model
            .switchValue)
        ? CupertinoTabScaffold(
            tabBar: CupertinoTabBar(

              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.person_crop_circle_badge_plus,
                    ),
                    label: "Add"),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.time,
                    ),
                    label: "Recents"),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.person_crop_circle,
                    ),
                    label: "Contact"),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.phone,
                    ),
                    label: "Chats"),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.settings,
                    ),
                    label: "Settings"),
              ],
            ),
            tabBuilder: (context, i) => CupertinoTabView(

              builder: (context) {
                return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    backgroundColor: (Provider.of<Theme_Provider>(context,listen: false).theme_model.isDarkMode)?Colors.black38:CupertinoColors.white,

                    trailing: CupertinoSwitch(
                      value: Provider.of<SwitchValue_Provider>(context)
                          .switchValue_Model
                          .switchValue,
                      onChanged: (_) => Provider.of<SwitchValue_Provider>(
                              context,
                              listen: false)
                          .AlternateValue(),
                    ),
                    middle: Text(
                      "Cupertino App",
                      style: TextStyle(
                        color: (Provider.of<Theme_Provider>(context,listen: false).theme_model.isDarkMode)?CupertinoColors.white:CupertinoColors.black
                      ),
                    ),

                  ),
                  child: children[i],
                );
              },
            ),
          )
        : DefaultTabController(
            length: 5,
            animationDuration: const Duration(milliseconds: 400),
            child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(
                  isScrollable: true,
                  tabs: [
                    Text("Data"),
                    Text("Recent"),
                    Text("Contact"),
                    Text("Chats"),
                    Text("Setting"),
                  ],
                ),
                title: const Text("Platform Converter"),
                actions: [
                  Transform.scale(
                    scale: 0.09.h,
                    child: Switch(
                      value: Provider.of<SwitchValue_Provider>(context)
                          .switchValue_Model
                          .switchValue,
                      onChanged: (_) => Provider.of<SwitchValue_Provider>(
                              context,
                              listen: false)
                          .AlternateValue(),
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
              body: const TabBarView(children: [
                AddContactPage(),
                RecentsPage(),
                ContactsPage(),
                ChatsPage(),
                ProfilePage(),
              ]),
            ),
          );
  }
}
