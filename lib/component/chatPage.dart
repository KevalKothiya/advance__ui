// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:advance_ui/controller/controller.dart';
import 'package:advance_ui/model/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    if ((Provider.of<SwitchValue_Provider>(context)
        .switchValue_Model
        .switchValue)) {
      if ((Provider.of<AddContactVariable_provider>(context, listen: false)
              .chats
              .isNotEmpty) &&
          (Provider.of<AddContactVariable_provider>(context, listen: false)
              .fullName
              .isNotEmpty) &&
          (Provider.of<AddContactVariable_provider>(context, listen: false)
              .mobileNumber
              .isNotEmpty)) {
        return Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.topCenter,
          child: ListView.builder(
            itemCount: Provider.of<AddContactVariable_provider>(context)
                .fullName
                .length,
            itemBuilder: (context, i) {
              return Column(
                children: [
                  CupertinoListTile.notched(
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 48.h,
                              width: double.infinity,
                              color: (Provider.of<Theme_Provider>(context,
                                          listen: false)
                                      .theme_model
                                      .isDarkMode)
                                  ? Colors.black
                                  : Colors.white,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  CircleAvatar(
                                    radius: 10.h,
                                    foregroundImage:
                                        FileImage(File(imageList[i])),
                                  ),
                                  Text(
                                    Provider.of<AddContactVariable_provider>(
                                            context)
                                        .fullName[i],
                                    style: (Provider.of<Theme_Provider>(context,
                                                listen: false)
                                            .theme_model
                                            .isDarkMode)
                                        ? AllTimeAccessTextTheme.textStyleDark
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22)
                                        : AllTimeAccessTextTheme.textStyleLight
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22),
                                  ),
                                  Text(
                                    Provider.of<AddContactVariable_provider>(
                                            context)
                                        .chats[i],
                                    style: (Provider.of<Theme_Provider>(context,
                                                listen: false)
                                            .theme_model
                                            .isDarkMode)
                                        ? AllTimeAccessTextTheme.textStyleDark
                                            .copyWith(color: Colors.grey)
                                        : AllTimeAccessTextTheme.textStyleLight
                                            .copyWith(color: Colors.grey),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Provider.of<AddContactVariable_provider>(
                                                  context,
                                                  listen: false)
                                              .Delete(
                                            Provider.of<AddContactVariable_provider>(
                                                    context,
                                                    listen: false)
                                                .fullName[i],
                                            Provider.of<AddContactVariable_provider>(
                                                    context,
                                                    listen: false)
                                                .chats[i],
                                            Provider.of<AddContactVariable_provider>(
                                                    context,
                                                    listen: false)
                                                .mobileNumber[i],
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                        ),
                                      ),
                                    ],
                                  ),
                                  CupertinoButton.filled(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    leadingSize: 6.h,
                    leading: CircleAvatar(
                      radius: 3.h,
                      foregroundImage: (imageList != null)
                          ? FileImage(File(imageList[i]))
                          : null,
                    ),
                    title: Text(
                      Provider.of<AddContactVariable_provider>(context)
                          .fullName[i],
                      style: TextStyle(
                          color: (Provider.of<Theme_Provider>(context,
                                      listen: false)
                                  .theme_model
                                  .isDarkMode)
                              ? CupertinoColors.white
                              : CupertinoColors.black),
                    ),
                    subtitle: Text(
                      Provider.of<AddContactVariable_provider>(context)
                          .chats[i],
                      style: const TextStyle(fontSize: 16),
                    ),
                    trailing: Text(
                      "${dateList[i].day}/${dateList[i].month}/${dateList[i].year},${timeList[i].hour}:${timeList[i].minute}",
                      style:
                          (Provider.of<Theme_Provider>(context, listen: false)
                                  .theme_model
                                  .isDarkMode)
                              ? AllTimeAccessTextTheme.textStyleDark
                              : AllTimeAccessTextTheme.textStyleLight,
                    ),
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        );
      } else {
        return Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Icon(
            Icons.hourglass_empty,
            size: 10.h,
          ),
        );
      }
    } else {
      return (Provider.of<AddContactVariable_provider>(context, listen: false)
              .chats
              .isNotEmpty)
          ? Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.topCenter,
              child: ListView.builder(
                  itemCount: Provider.of<AddContactVariable_provider>(context)
                      .chats
                      .length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 48.h,
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        CircleAvatar(
                                          radius: 10.h,
                                          foregroundImage:
                                              FileImage(File(imageList[i])),
                                        ),
                                        Text(
                                          Provider.of<AddContactVariable_provider>(
                                                  context)
                                              .fullName[i],
                                          style: (Provider.of<Theme_Provider>(
                                                      context,
                                                      listen: false)
                                                  .theme_model
                                                  .isDarkMode)
                                              ? AllTimeAccessTextTheme
                                                  .textStyleDark
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22)
                                              : AllTimeAccessTextTheme
                                                  .textStyleLight
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22),
                                        ),
                                        Text(
                                          Provider.of<AddContactVariable_provider>(
                                                  context)
                                              .chats[i],
                                          style: (Provider.of<Theme_Provider>(
                                                      context,
                                                      listen: false)
                                                  .theme_model
                                                  .isDarkMode)
                                              ? AllTimeAccessTextTheme
                                                  .textStyleDark
                                                  .copyWith(color: Colors.grey)
                                              : AllTimeAccessTextTheme
                                                  .textStyleLight
                                                  .copyWith(color: Colors.grey),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.edit,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Provider.of<AddContactVariable_provider>(
                                                        context,
                                                        listen: false)
                                                    .Delete(
                                                  Provider.of<AddContactVariable_provider>(
                                                          context,
                                                          listen: false)
                                                      .fullName[i],
                                                  Provider.of<AddContactVariable_provider>(
                                                          context,
                                                          listen: false)
                                                      .chats[i],
                                                  Provider.of<AddContactVariable_provider>(
                                                          context,
                                                          listen: false)
                                                      .mobileNumber[i],
                                                );
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                              ),
                                            ),
                                          ],
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Cancel"),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  "${dateList[i].day}/${dateList[i].month}/${dateList[i].year},${timeList[i].hour}:${timeList[i].minute}")
                            ],
                          ),
                          title: Text(
                              Provider.of<AddContactVariable_provider>(context)
                                  .fullName[i]),
                          subtitle: Text(
                              Provider.of<AddContactVariable_provider>(context)
                                  .chats[i]),
                          leading: CircleAvatar(
                            radius: 4.h,
                            foregroundImage: (imageList != null)
                                ? FileImage(File(imageList[i]))
                                : null,
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  }),
            )
          : Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.hourglass_empty,
                size: 10.h,
              ),
            );
    }
  }
}
