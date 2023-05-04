// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:advance_ui/controller/controller.dart';
import 'package:advance_ui/model/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class RecentsPage extends StatefulWidget {
  const RecentsPage({Key? key}) : super(key: key);

  @override
  State<RecentsPage> createState() => _RecentsPageState();
}

class _RecentsPageState extends State<RecentsPage> {
  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchValue_Provider>(context)
            .switchValue_Model
            .switchValue)
        ? (Provider.of<AddContactVariable_provider>(context, listen: false)
                .recentCallFullName
                .isNotEmpty)
            ? Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: Provider.of<AddContactVariable_provider>(
                                context,
                                listen: false)
                            .recentCallFullName
                            .length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                    child: Icon(CupertinoIcons
                                        .phone_fill_arrow_up_right),
                                  ),
                                  Expanded(
                                    flex: 40,
                                    child: CupertinoListTile(
                                      leadingSize: 6.h,
                                      leading: CircleAvatar(
                                        radius: 3.h,
                                        foregroundImage: (imageList != null)
                                            ? FileImage(File(imageList[i]))
                                            : null,
                                      ),
                                      title: Text(
                                        Provider.of<AddContactVariable_provider>(
                                                context)
                                            .recentCallFullName[i],
                                        style: TextStyle(
                                            color: (Provider.of<Theme_Provider>(
                                                        context,
                                                        listen: false)
                                                    .theme_model
                                                    .isDarkMode)
                                                ? CupertinoColors.white
                                                : CupertinoColors.black),
                                      ),
                                      subtitle: Text(Provider.of<
                                                  AddContactVariable_provider>(
                                              context)
                                          .recentCallMobileNumber[i]),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(CupertinoIcons.info_circle),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.hourglass_empty_outlined,
                  size: 10.h,
                ),
              )
        : (Provider.of<AddContactVariable_provider>(context, listen: false)
                .recentCallFullName
                .isNotEmpty)
            ? Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount:
                            Provider.of<AddContactVariable_provider>(context)
                                .recentCallFullName
                                .length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(CupertinoIcons
                                        .phone_fill_arrow_up_right),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    CircleAvatar(
                                      radius: 4.h,
                                      foregroundImage: (imageList != null)
                                          ? FileImage(File(imageList[i]))
                                          : null,
                                    ),
                                  ],
                                ),
                                title: Text(
                                    Provider.of<AddContactVariable_provider>(
                                            context)
                                        .recentCallFullName[i]),
                                subtitle: Text(
                                    Provider.of<AddContactVariable_provider>(
                                            context)
                                        .recentCallMobileNumber[i]),
                                trailing:
                                    const Icon(Icons.info_outline_rounded),
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.receipt_long,
                  size: 10.h,
                ),
              );
  }
}
