import 'dart:io';

import 'package:advance_ui/controller/controller.dart';
import 'package:advance_ui/model/globals.dart';
import 'package:advance_ui/model/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchValue_Provider>(context)
            .switchValue_Model
            .switchValue)
        ? (Provider.of<AddContactVariable_provider>(context, listen: false)
                .fullName
                .isNotEmpty)
            ? Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: Provider.of<AddContactVariable_provider>(
                                context,
                                listen: false)
                            .fullName
                            .length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              CupertinoListTile.notched(
                                leadingSize: 6.h,
                                leading: CircleAvatar(
                                  radius: 3.h,
                                  foregroundImage: (imageList != null)
                                      ? FileImage(File(imageList[i]))
                                      : null,
                                ),
                                title: Text(
                                  "${Provider.of<AddContactVariable_provider>(context).fullName[i]}",
                                  style: TextStyle(
                                      color: (Provider.of<Theme_Provider>(
                                                  context,
                                                  listen: false)
                                              .theme_model
                                              .isDarkMode)
                                          ? CupertinoColors.white
                                          : CupertinoColors.black),
                                ),
                                subtitle: Text(
                                  "${Provider.of<AddContactVariable_provider>(context).chats[i]}",
                                  style: TextStyle(fontSize: 16),
                                ),
                                trailing: IconButton(
                                  onPressed: () async {
                                    // Provider.of<AddContactVariable_provider>(context,listen: false).AddRecentCall(Provider.of<AddContactVariable_provider>(context,listen: false).fullName[i] as List<String>);

                                    Uri uri = Uri.parse(
                                        "tel:+91${Provider.of<AddContactVariable_provider>(context, listen: false).mobileNumber[i]}");
                                    try {
                                      await launchUrl(uri);
                                    } catch (e) {
                                      print("Exception : $e");
                                    }
                                    Provider.of<AddContactVariable_provider>(
                                            context,
                                            listen: false)
                                        .AddRecentCall(
                                            Provider.of<AddContactVariable_provider>(
                                                    context,
                                                    listen: false)
                                                .fullName[i],
                                            Provider.of<AddContactVariable_provider>(
                                                    context,
                                                    listen: false)
                                                .mobileNumber[i],
                                            Provider.of<AddContactVariable_provider>(
                                                    context,
                                                    listen: false)
                                                .chats[i]);
                                  },
                                  icon: Icon(
                                    CupertinoIcons.phone_fill,
                                    color: CupertinoColors.activeGreen,
                                  ),
                                ),
                              ),
                              Divider(),
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
                  CupertinoIcons.cube_box,
                  size: 10.h,
                ),
              )
        : (Provider.of<AddContactVariable_provider>(context, listen: false)
                .fullName
                .isNotEmpty)
            ? Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: Provider.of<AddContactVariable_provider>(
                                context,
                                listen: false)
                            .fullName
                            .length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              ListTile(

                                leading: CircleAvatar(
                                  radius: 4.h,
                                  foregroundImage: (imageList != null)
                                      ? FileImage(File(imageList[i]))
                                      : null,
                                ),
                                title: Text(
                                  "${Provider.of<AddContactVariable_provider>(context).fullName[i]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text(
                                    "${Provider.of<AddContactVariable_provider>(context).chats[i]}"),
                                trailing: IconButton(
                                    onPressed: () async {
                                      Uri uri = Uri.parse(
                                          "tel:+91${Provider.of<AddContactVariable_provider>(context, listen: false).mobileNumber[i]}");
                                      try {
                                        await launchUrl(uri);
                                      } catch (e) {
                                        print("Exception : $e");
                                      }
                                      // Provider.of<AddContactVariable_provider>(context,listen: false).AddRecentCall(Provider.of<AddContactVariable_provider>(context,listen: false).fullName[i]);
                                      Provider.of<AddContactVariable_provider>(
                                              context,
                                              listen: false)
                                          .AddRecentCall(
                                              Provider.of<AddContactVariable_provider>(
                                                      context,
                                                      listen: false)
                                                  .fullName[i],
                                              Provider.of<AddContactVariable_provider>(
                                                      context,
                                                      listen: false)
                                                  .mobileNumber[i],
                                              Provider.of<AddContactVariable_provider>(
                                                      context,
                                                      listen: false)
                                                  .chats[i]);
                                    },
                                    icon: Icon(
                                      Icons.call,
                                      color: Colors.green,
                                    )),
                              ),
                              Divider(),
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
                  Icons.account_box,
                  size: 10.h,
                ),
              );
  }
}
