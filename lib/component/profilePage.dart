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
            padding: const EdgeInsets.all(16),
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
                          ? Column(
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
                                      icon: const Icon(
                                        Icons.camera,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  Provider.of<Profile_Provider>(context)
                                      .profile_model
                                      .name,
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
                                    Provider.of<Profile_Provider>(context)
                                        .profile_model
                                        .bio,
                                    style: (Provider.of<Theme_Provider>(context,
                                                listen: false)
                                            .theme_model
                                            .isDarkMode)
                                        ? AllTimeAccessTextTheme.textStyleDark
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20)
                                        : AllTimeAccessTextTheme.textStyleLight
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20)),
                              ],
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
                    leading: const Icon(CupertinoIcons.person_crop_circle_fill),
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
                    subtitle: const Text("Update Profile Date"),
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
                                          icon: const Icon(
                                            CupertinoIcons.camera_fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                    CupertinoTextFormFieldRow(
                                      controller: profileNameController,
                                      decoration: const BoxDecoration(),
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
                                      decoration: const BoxDecoration(),
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
                                          child: const Text("SAVE"),
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
                                            child: const Text("CLEAR"),
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
                  const Divider(),
                  CupertinoListTile.notched(
                    leading: const Icon(CupertinoIcons.settings),
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
                    subtitle: const Text("Update Setting"),
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
                      ? Column(
                          children: [
                            const Divider(),
                            ListView(
                              shrinkWrap: true,
                              children: [
                                CupertinoListTile.notched(
                                  leading: const Icon(Icons.brightness_6),
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
                                  subtitle: const Text("Dark Mode"),
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
                                const Divider(),
                                CupertinoListTile.notched(
                                  leading: const Icon(Icons.android),
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
                                  subtitle: const Text("Material Desing"),
                                  trailing: Transform.scale(
                                    scale: 0.09.h,
                                    child: CupertinoSwitch(
                                      value: Provider.of<SwitchValue_Provider>(
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
                                const Divider(),
                              ],
                            ),
                          ],
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
                          ? Column(
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
                                      icon: const Icon(
                                        Icons.camera,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  Provider.of<Profile_Provider>(context)
                                      .profile_model
                                      .name,
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
                                    Provider.of<Profile_Provider>(context)
                                        .profile_model
                                        .bio,
                                    style: (Provider.of<Theme_Provider>(context,
                                                listen: false)
                                            .theme_model
                                            .isDarkMode)
                                        ? AllTimeAccessTextTheme.textStyleDark
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20)
                                        : AllTimeAccessTextTheme.textStyleLight
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20)),
                              ],
                            )
                          : Container()
                      : Container(),
                  ListTile(
                    leading: const Icon(Icons.person_4_sharp),
                    title: const Text("Profile"),
                    subtitle: const Text("Update Profile Date"),
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
                      ? const Divider()
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
                              padding:
                                  const EdgeInsets.only(right: 26, left: 26),
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
                                            icon: const Icon(
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
                                        decoration: const InputDecoration(
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
                                        decoration: const InputDecoration(
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
                                              child: const Text("SAVE"),
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
                                              child: const Text("CLEAR"),
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
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    subtitle: const Text("Update Setting"),
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
                          padding: const EdgeInsets.only(
                            left: 22,
                            right: 22,
                          ),
                          child: Column(
                            children: [
                              const Divider(),
                              ListView(
                                shrinkWrap: true,
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.brightness_6),
                                    title: const Text("Dark Theme"),
                                    subtitle: const Text("Dark Mode"),
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
                                  const Divider(),
                                  ListTile(
                                    leading: const Icon(Icons.apple),
                                    title: const Text("IOS Theme"),
                                    subtitle: const Text("Cupertino Desing"),
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
                                  const Divider(),
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
