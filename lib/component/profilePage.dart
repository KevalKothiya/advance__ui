import 'dart:io';

import 'package:advance_ui/controller/controller.dart';
import 'package:advance_ui/model/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchValue_Provider>(context)
            .switchValue_Model
            .switchValue)
        ? Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  (Provider.of<ProfileSwitchValue_Provider>(context)
                          .profileSwitchValue_Model
                          .ProfileSwitchValue)
                      ? (Provider.of<Profile_Provider>(context)
                              .profile_model
                              .name
                              .isNotEmpty)
                          ? Container(
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 10.h,
                                        foregroundImage: (image != null)
                                            ? FileImage(image as File)
                                            : null,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Provider.of<ProfileImage_Provider>(
                                                  context,
                                                  listen: false)
                                              .getImageFromCamera();
                                        },
                                        icon: Icon(
                                          Icons.camera,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    "${Provider.of<Profile_Provider>(context).profile_model.name}",
                                    style: (Provider.of<Theme_Provider>(context,
                                                listen: false)
                                            .theme_model
                                            .isDarkMode)
                                        ? AllTimeAccessTextTheme.textStyleDark
                                            .copyWith(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold)
                                        : AllTimeAccessTextTheme.textStyleLight
                                            .copyWith(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      "${Provider.of<Profile_Provider>(context).profile_model.bio}",
                                      style: (Provider.of<Theme_Provider>(
                                                  context,
                                                  listen: false)
                                              .theme_model
                                              .isDarkMode)
                                          ? AllTimeAccessTextTheme.textStyleDark
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20)
                                          : AllTimeAccessTextTheme
                                              .textStyleLight
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20)),
                                ],
                              ),
                            )
                          : Container()
                      : Container(),
                  (Provider.of<Theme_Provider>(context, listen: false)
                          .theme_model
                          .isDarkMode)
                      ? SizedBox(
                          height: 11.h,
                        )
                      : Container(),
                  CupertinoListTile.notched(
                    leading: Icon(CupertinoIcons.person_crop_circle_fill),
                    title: Text(
                      "Profile",
                      style: TextStyle(
                          color: (Provider.of<Theme_Provider>(context,
                                      listen: false)
                                  .theme_model
                                  .isDarkMode)
                              ? CupertinoColors.white
                              : CupertinoColors.black),
                    ),
                    subtitle: Text("Update Profile Date"),
                    trailing: CupertinoSwitch(
                      value: Provider.of<ProfileSwitchValue_Provider>(context)
                          .profileSwitchValue_Model
                          .ProfileSwitchValue,
                      onChanged: (val) {
                        Provider.of<ProfileSwitchValue_Provider>(context,
                                listen: false)
                            .AlternateValue();
                      },
                    ),
                  ),
                  // (Provider.of<ProfileSwitchValue_Provider>(context,
                  //             listen: false)
                  //         .profileSwitchValue_Model
                  //         .ProfileSwitchValue)
                  //     ? Container()
                  //     : Divider(),
                  (Provider.of<Profile_Provider>(context)
                          .profile_model
                          .name
                          .isNotEmpty)
                      ? Container()
                      : (Provider.of<ProfileSwitchValue_Provider>(context,
                                  listen: false)
                              .profileSwitchValue_Model
                              .ProfileSwitchValue)
                          ? Form(
                              key: formKey2,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 10.h,
                                          foregroundImage: (image != null)
                                              ? FileImage(image as File)
                                              : null,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Provider.of<ProfileImage_Provider>(
                                                    context,
                                                    listen: false)
                                                .getImageFromCamera();
                                          },
                                          icon: Icon(
                                            CupertinoIcons.camera_fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                    CupertinoTextFormFieldRow(
                                      controller: profileNameController,
                                      decoration: BoxDecoration(),
                                      textAlign: TextAlign.center,
                                      placeholder: "Enter Name",
                                      placeholderStyle: TextStyle(
                                        color: (Provider.of<Theme_Provider>(
                                                    context)
                                                .theme_model
                                                .isDarkMode)
                                            ? CupertinoColors.white
                                            : CupertinoColors.black,
                                      ),
                                      style: TextStyle(
                                        color: (Provider.of<Theme_Provider>(
                                                        context)
                                                    .theme_model
                                                    .isDarkMode ==
                                                true)
                                            ? CupertinoColors.white
                                            : CupertinoColors.black,
                                      ),
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Enter Name...";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    CupertinoTextFormFieldRow(
                                      controller: profileBioController,
                                      decoration: BoxDecoration(),
                                      textAlign: TextAlign.center,
                                      placeholder: "Enter Your Bio.",
                                      placeholderStyle: TextStyle(
                                        color: (Provider.of<Theme_Provider>(
                                                    context)
                                                .theme_model
                                                .isDarkMode)
                                            ? CupertinoColors.white
                                            : CupertinoColors.black,
                                      ),
                                      style: TextStyle(
                                        color: (Provider.of<Theme_Provider>(
                                                        context)
                                                    .theme_model
                                                    .isDarkMode ==
                                                true)
                                            ? CupertinoColors.white
                                            : CupertinoColors.black,
                                      ),
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Enter Name...";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          child: Text("SAVE"),
                                          onPressed: () {
                                            if (image != null) {
                                              if (formKey2.currentState!
                                                  .validate()) {
                                                formKey2.currentState!.save();

                                                Provider.of<Profile_Provider>(
                                                        context,
                                                        listen: false)
                                                    .initialization();
                                              }
                                            }
                                          },
                                        ),
                                        ElevatedButton(
                                            child: Text("CLEAR"),
                                            onPressed: () {
                                              Provider.of<Profile_Provider>(
                                                      context,
                                                      listen: false)
                                                  .clear();
                                              Provider.of<ProfileImage_Provider>(
                                                      context,
                                                      listen: false)
                                                  .clear();
                                            }),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                  Divider(),

                  //////////////////////////////////////////////
                  CupertinoListTile.notched(
                    leading: Icon(CupertinoIcons.settings),
                    title: Text(
                      "Settings ",
                      style: TextStyle(
                          color: (Provider.of<Theme_Provider>(context,
                                      listen: false)
                                  .theme_model
                                  .isDarkMode)
                              ? CupertinoColors.white
                              : CupertinoColors.black),
                    ),
                    subtitle: Text("Update Setting"),
                    trailing: CupertinoSwitch(
                      value: Provider.of<SettingSwitchValue_Provider>(context)
                          .settingsSwitchValue_Model
                          .SettingsSwitchValue,
                      onChanged: (val) {
                        Provider.of<SettingSwitchValue_Provider>(context,
                                listen: false)
                            .AlternateValue();
                      },
                    ),
                  ),
                  (Provider.of<SettingSwitchValue_Provider>(context,
                              listen: false)
                          .settingsSwitchValue_Model
                          .SettingsSwitchValue)
                      ? Container(
                          child: Column(
                            children: [
                              Divider(),
                              ListView(
                                shrinkWrap: true,
                                children: [
                                  CupertinoListTile.notched(
                                    leading: Icon(Icons.brightness_6),
                                    title: Text(
                                      "Dark Theme",
                                      style: TextStyle(
                                          color: (Provider.of<Theme_Provider>(
                                                      context,
                                                      listen: false)
                                                  .theme_model
                                                  .isDarkMode)
                                              ? CupertinoColors.white
                                              : CupertinoColors.black),
                                    ),
                                    subtitle: Text("Dark Mode"),
                                    trailing: Transform.scale(
                                      scale: 0.09.h,
                                      child: CupertinoSwitch(
                                        value:
                                            Provider.of<Theme_Provider>(context)
                                                .theme_model
                                                .isDarkMode,
                                        onChanged: (val) {
                                          Provider.of<Theme_Provider>(context,
                                                  listen: false)
                                              .AlternateValue();
                                        },
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  CupertinoListTile.notched(
                                    leading: Icon(Icons.android),
                                    title: Text(
                                      "Android Theme",
                                      style: TextStyle(
                                          color: (Provider.of<Theme_Provider>(
                                                      context,
                                                      listen: false)
                                                  .theme_model
                                                  .isDarkMode)
                                              ? CupertinoColors.white
                                              : CupertinoColors.black),
                                    ),
                                    subtitle: Text("Material Desing"),
                                    trailing: Transform.scale(
                                      scale: 0.09.h,
                                      child: CupertinoSwitch(
                                        value:
                                            Provider.of<SwitchValue_Provider>(
                                                    context)
                                                .switchValue_Model
                                                .switchValue,
                                        onChanged: (val) {
                                          Provider.of<SwitchValue_Provider>(
                                                  context,
                                                  listen: false)
                                              .AlternateValue();
                                        },
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          )
        : Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  (Provider.of<ProfileSwitchValue_Provider>(context,
                              listen: false)
                          .profileSwitchValue_Model
                          .ProfileSwitchValue)
                      ? (Provider.of<Profile_Provider>(context, listen: false)
                                  .profile_model
                                  .name !=
                              "")
                          ? Container(
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 10.h,
                                        foregroundImage: (image != null)
                                            ? FileImage(image as File)
                                            : null,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Provider.of<ProfileImage_Provider>(
                                                  context,
                                                  listen: false)
                                              .getImageFromCamera();
                                        },
                                        icon: Icon(
                                          Icons.camera,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    "${Provider.of<Profile_Provider>(context).profile_model.name}",
                                    style: (Provider.of<Theme_Provider>(context,
                                                listen: false)
                                            .theme_model
                                            .isDarkMode)
                                        ? AllTimeAccessTextTheme.textStyleDark
                                            .copyWith(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold)
                                        : AllTimeAccessTextTheme.textStyleLight
                                            .copyWith(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      "${Provider.of<Profile_Provider>(context).profile_model.bio}",
                                      style: (Provider.of<Theme_Provider>(
                                                  context,
                                                  listen: false)
                                              .theme_model
                                              .isDarkMode)
                                          ? AllTimeAccessTextTheme.textStyleDark
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20)
                                          : AllTimeAccessTextTheme
                                              .textStyleLight
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20)),
                                ],
                              ),
                            )
                          : Container()
                      : Container(),
                  ListTile(
                    leading: Icon(Icons.person_4_sharp),
                    title: Text("Profile"),
                    subtitle: Text("Update Profile Date"),
                    trailing: Switch(
                      value: Provider.of<ProfileSwitchValue_Provider>(context)
                          .profileSwitchValue_Model
                          .ProfileSwitchValue,
                      onChanged: (val) {
                        Provider.of<ProfileSwitchValue_Provider>(context,
                                listen: false)
                            .AlternateValue();
                      },
                    ),
                  ),
                  (Provider.of<ProfileSwitchValue_Provider>(context,
                              listen: false)
                          .profileSwitchValue_Model
                          .ProfileSwitchValue)
                      ? Divider()
                      : Container(),
                  (Provider.of<Profile_Provider>(context, listen: false)
                              .profile_model
                              .name !=
                          "")
                      ? Container()
                      : (Provider.of<ProfileSwitchValue_Provider>(context,
                                  listen: false)
                              .profileSwitchValue_Model
                              .ProfileSwitchValue)
                          ? Container(
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.only(right: 26, left: 26),
                              child: Form(
                                key: formKey2,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 10.h,
                                            foregroundImage: (image != null)
                                                ? FileImage(image as File)
                                                : null,
                                          ),
                                          IconButton(
                                            icon: Icon(
                                                CupertinoIcons.camera_fill),
                                            onPressed: () {
                                              Provider.of<ProfileImage_Provider>(
                                                      context,
                                                      listen: false)
                                                  .getImageFromCamera();
                                            },
                                          ),
                                        ],
                                      ),
                                      TextFormField(
                                        controller: profileNameController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter Name",
                                        ),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: (Provider.of<Theme_Provider>(
                                                          context)
                                                      .theme_model
                                                      .isDarkMode ==
                                                  true)
                                              ? CupertinoColors.white
                                              : CupertinoColors.black,
                                        ),
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "Enter Name...";
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      TextFormField(
                                        controller: profileBioController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter Your Bio.",
                                        ),
                                        textAlign: TextAlign.center,
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "Enter Name...";
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor: MaterialStatePropertyAll(
                                                      (Provider.of<Theme_Provider>(
                                                                      context)
                                                                  .theme_model
                                                                  .isDarkMode ==
                                                              true)
                                                          ? Colors.deepPurple
                                                              .shade600
                                                              .withOpacity(0.5)
                                                          : Colors.deepPurple
                                                              .shade50)),
                                              child: Text("SAVE"),
                                              onPressed: () {
                                                if (image != null) {
                                                  if (formKey2.currentState!
                                                      .validate()) {
                                                    formKey2.currentState!
                                                        .save();

                                                    Provider.of<Profile_Provider>(
                                                            context,
                                                            listen: false)
                                                        .initialization();
                                                    setState(() {});
                                                  }
                                                }
                                              }),
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor: MaterialStatePropertyAll(
                                                      (Provider.of<Theme_Provider>(
                                                                      context)
                                                                  .theme_model
                                                                  .isDarkMode ==
                                                              true)
                                                          ? Colors.deepPurple
                                                              .shade600
                                                              .withOpacity(0.5)
                                                          : Colors.deepPurple
                                                              .shade50)),
                                              child: Text("CLEAR"),
                                              onPressed: () {
                                                Provider.of<Profile_Provider>(
                                                        context,
                                                        listen: false)
                                                    .clear();
                                                setState(() {});
                                              }),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    subtitle: Text("Update Setting"),
                    trailing: Switch(
                      value: Provider.of<SettingSwitchValue_Provider>(context)
                          .settingsSwitchValue_Model
                          .SettingsSwitchValue,
                      onChanged: (val) {
                        Provider.of<SettingSwitchValue_Provider>(context,
                                listen: false)
                            .AlternateValue();
                      },
                    ),
                  ),
                  (Provider.of<SettingSwitchValue_Provider>(context,
                              listen: false)
                          .settingsSwitchValue_Model
                          .SettingsSwitchValue)
                      ? Container(
                          padding: EdgeInsets.only(
                            left: 22,
                            right: 22,
                          ),
                          child: Column(
                            children: [
                              Divider(),
                              ListView(
                                shrinkWrap: true,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.brightness_6),
                                    title: Text("Dark Theme"),
                                    subtitle: Text("Dark Mode"),
                                    trailing: Transform.scale(
                                      scale: 0.09.h,
                                      child: Switch(
                                        value:
                                            Provider.of<Theme_Provider>(context)
                                                .theme_model
                                                .isDarkMode,
                                        onChanged: (val) {
                                          Provider.of<Theme_Provider>(context,
                                                  listen: false)
                                              .AlternateValue();
                                        },
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  ListTile(
                                    leading: Icon(Icons.apple),
                                    title: Text("IOS Theme"),
                                    subtitle: Text("Cupertino Desing"),
                                    trailing: Transform.scale(
                                      scale: 0.09.h,
                                      child: Switch(
                                        value:
                                            Provider.of<SwitchValue_Provider>(
                                                    context)
                                                .switchValue_Model
                                                .switchValue,
                                        onChanged: (val) {
                                          Provider.of<SwitchValue_Provider>(
                                                  context,
                                                  listen: false)
                                              .AlternateValue();
                                        },
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          );
  }
}
