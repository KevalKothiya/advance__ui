import 'dart:io';

import 'package:advance_ui/controller/controller.dart';
import 'package:advance_ui/model/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  File? file;

  late DateTime initialDate;

  late DateTime initialCupertinoDate;
  late DateTime initialCupertinoTime;
  late TimeOfDay initialTime;
  late String periodName;

  int currentStep = 0;

  Future<void> getImageFromCamera() async {
    ImagePicker picker = ImagePicker();

    XFile? image = await picker.pickImage(source: ImageSource.camera);

    String? path = image!.path;

    if (image != null) {
      file = File(path);
    }
  }

  Future<void> getImageFromGallery() async {
    ImagePicker picker = ImagePicker();

    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    String? path = image!.path;

    if (image != null) {
      file = File(path);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialDate = DateTime.now();
    initialCupertinoDate = DateTime.now();
    initialCupertinoTime = DateTime.now();
    initialTime = TimeOfDay.now();
    (initialTime.hour <= 12) ? periodName = "am" : periodName = "pm";
  }

  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchValue_Provider>(context)
            .switchValue_Model
            .switchValue)
        ? Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(2.h),
            child: Form(
              key: formKey1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    (Provider.of<Theme_Provider>(context, listen: false)
                            .theme_model
                            .isDarkMode)
                        ? SizedBox(
                            height: 11.h,
                          )
                        : SizedBox(),
                    Stack(
                      alignment: FractionalOffset.center,
                      children: [
                        CircleAvatar(
                          radius: 10.h,
                          foregroundImage:
                          (Provider.of<ImagePickerProvider>(context)
                              .image !=
                              null)
                              ? FileImage(
                              Provider.of<ImagePickerProvider>(context)
                                  .image as File)
                              : null,
                        ),
                        IconButton(
                          onPressed: () {
                            Provider.of<ImagePickerProvider>(context,
                                listen: false)
                                .getImageFromCamera();
                          },
                          icon: Icon(
                            CupertinoIcons.camera_fill,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Icon(CupertinoIcons.person),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Expanded(
                          flex: 150,
                          child: CupertinoTextFormFieldRow(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "FullName...";
                              } else {
                                return null;
                              }
                            },
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
                            controller: fullNameController,
                            placeholder: "Full Name",
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: (Provider.of<Theme_Provider>(
                                        context)
                                        .theme_model
                                        .isDarkMode ==
                                        true)
                                        ? CupertinoColors.white
                                        : CupertinoColors.black
                                )
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                CupertinoIcons.phone,
                              )
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Expanded(
                          flex: 150,
                          child: CupertinoTextFormFieldRow(
                            controller: phoneumberController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            placeholder: "Phone Number",
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
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: (Provider.of<Theme_Provider>(
                                  context)
                                  .theme_model
                                  .isDarkMode ==
                                  true)
                                ? CupertinoColors.white
                                : CupertinoColors.black
                              )
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Mobile Number...";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                CupertinoIcons.chat_bubble_2,
                              )
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Expanded(
                          flex: 150,
                          child: CupertinoTextFormFieldRow(
                            controller: chatConversationController,
                            placeholder: "Chat Conversation",
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
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: (Provider.of<Theme_Provider>(
                                        context)
                                        .theme_model
                                        .isDarkMode ==
                                        true)
                                        ? CupertinoColors.white
                                        : CupertinoColors.black
                                )
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Chat Conversation ...";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 35.h,
                                    color: (Provider.of<Theme_Provider>(context,listen: false).theme_model.isDarkMode)?Colors.black:Colors.white,
                                    child: CupertinoDatePicker(
                                      maximumYear: 2099,
                                      minimumYear: 2000,
                                      mode: CupertinoDatePickerMode.date,
                                      initialDateTime:
                                          Provider.of<DatePicker_Provider>(
                                                  context)
                                              .datePicker_Model
                                              .initialDate,
                                      onDateTimeChanged: (val) {
                                        Provider.of<DatePicker_Provider>(
                                                context,
                                                listen: false)
                                            .datePicker_Model
                                            .initialDate = val;
                                      },
                                    ),
                                  );
                                });
                          },
                          icon: Icon(
                            CupertinoIcons.calendar,
                          ),
                        ),
                        CupertinoButton(
                            child: Text(
                                "${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialDate.day}-${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialDate.month}-${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialDate.year}"),
                            onPressed: null),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            CupertinoIcons.time_solid,
                          ),
                          onPressed: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 35.h,
                                    color: Colors.white,
                                    child: CupertinoDatePicker(
                                      use24hFormat: false,
                                      backgroundColor: (Provider.of<Theme_Provider>(context,listen: false).theme_model.isDarkMode)?CupertinoColors.black:CupertinoColors.white,
                                      initialDateTime:
                                          Provider.of<DatePicker_Provider>(
                                                  context)
                                              .datePicker_Model
                                              .initialCupertinoTime,
                                      mode: CupertinoDatePickerMode.time,
                                      onDateTimeChanged: (val) {
                                        Provider.of<DatePicker_Provider>(
                                                context,
                                                listen: false)
                                            .datePicker_Model
                                            .initialCupertinoTime = val;
                                        Provider.of<DatePicker_Provider>(context).initializationDate();
                                        // Provider.of<DatePicker_Provider>(context,listen: false).Converter();
                                      },
                                    ),
                                  );
                                });
                          },
                        ),
                        (Provider.of<DatePicker_Provider>(context,
                                        listen: false)
                                    .datePicker_Model
                                    .initialCupertinoTime !=
                                null)
                            ? (Provider.of<DatePicker_Provider>(context,
                                            listen: false)
                                        .datePicker_Model
                                        .initialCupertinoTime
                                        .hour >=
                                    12)
                                ? (Provider.of<DatePicker_Provider>(
                                                context,
                                                listen: false)
                                            .datePicker_Model
                                            .initialCupertinoTime
                                            .hour <=
                                        12)
                                    ? CupertinoButton(
                                        child: Text(
                                            "${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialCupertinoTime.hour}-${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialCupertinoTime.minute} pm"),
                                        onPressed: null)
                                    : CupertinoButton(
                                        child: Text(
                                            "${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialCupertinoTime.hour - 12}-${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialCupertinoTime.minute} pm"),
                                        onPressed: null)
                                : CupertinoButton(
                                    child: Text(
                                        "${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialCupertinoTime.hour}-${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialCupertinoTime.minute} am"),
                                    onPressed: null)
                            : CupertinoButton(
                                child: Text("Pick Time"), onPressed: null)
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    CupertinoButton.filled(
                      child: Text("SAVE"),
                      onPressed: () {
                        if (Provider.of<ImagePickerProvider>(context,
                                    listen: false)
                                .image !=
                            null) {
                          if (formKey1.currentState!.validate()) {
                            formKey1.currentState!.save();
                            print(
                                "====================================================");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).addContactVariable_Model.fullName}");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).addContactVariable_Model.mobileNumber}");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).addContactVariable_Model.Chats}");
                            print(
                                "====================================================");

                            Provider.of<AddContactVariable_provider>(context,
                                    listen: false)
                                .initialization();

                            print(
                                "====================================================");
                            print("CHECK");
                            print("CHECK");
                            print("CHECK");
                            print(
                                "====================================================");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).addContactVariable_Model.fullName}");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).addContactVariable_Model.mobileNumber}");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).addContactVariable_Model.Chats}");
                            print(
                                "====================================================");

                            Provider.of<AddContactVariable_provider>(context,
                                    listen: false)
                                .AddAllContactinitialization();

                            Provider.of<ImagePickerProvider>(context,listen: false).Clear();
                            Provider.of<DatePicker_Provider>(context,listen: false).datePicker_Model.initialDate = DateTime.now();
                            Provider.of<DatePicker_Provider>(context,listen: false).datePicker_Model.initialCupertinoTime = DateTime.now();
                            Provider.of<DatePicker_Provider>(context,listen: false).datePicker_Model.initialTime = TimeOfDay.now();
                            print(
                                "=======================List====================");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).fullName}");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).mobileNumber}");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).chats}");
                            print(
                                "=======================List====================");
                            print(
                                "=======================Done====================");
                            setState(() {

                            });
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(2.h),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 10.h,
                          foregroundImage:
                              (Provider.of<ImagePickerProvider>(context)
                                          .image !=
                                      null)
                                  ? FileImage(
                                      Provider.of<ImagePickerProvider>(context)
                                          .image as File)
                                  : null,
                        ),
                        IconButton(
                          onPressed: () {
                            Provider.of<ImagePickerProvider>(context,
                                    listen: false)
                                .getImageFromCamera();
                          },
                          icon: Icon(
                            CupertinoIcons.camera_fill,
                          ),
                        ),
                      ],
                    ),
                    // CircleAvatar(
                    //   radius: 10.h,
                    //   foregroundImage:
                    //       (Provider.of<ImagePickerProvider>(context).image !=
                    //               null)
                    //           ? FileImage(
                    //               Provider.of<ImagePickerProvider>(context)
                    //                   .image as File)
                    //           : null,
                    //   child: IconButton(
                    //     onPressed: () async {
                    //       // print(file.toString());
                    //       // await getImageFromCamera();
                    //       // setState(() {});
                    //       // print(file.toString());
                    //       Provider.of<ImagePickerProvider>(context,
                    //               listen: false)
                    //           .getImageFromCamera();
                    //     },
                    //     icon: Icon(
                    //       Icons.camera,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      controller: fullNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          hintText: "Full Name",
                          labelText: "Full Name"),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Full Name First...";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      controller: phoneumberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.call),
                          hintText: "Phone Number",
                          labelText: "Mobile Number"),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Phone Number First...";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      controller: chatConversationController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.message_outlined),
                          hintText: "Chat Conversation",
                          labelText: "Chats"),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter description First...";
                        } else {
                          return null;
                        }
                      },
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            pickDate = await showDatePicker(
                              context: context,
                              initialDate: Provider.of<DatePicker_Provider>(
                                      context,
                                      listen: false)
                                  .datePicker_Model
                                  .initialDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2099),
                            );

                            if (pickDate != null) {
                              Provider.of<DatePicker_Provider>(context,
                                      listen: false)
                                  .initializationDate();
                            }
                          },
                          icon: Icon(Icons.date_range_outlined),
                        ),
                        (Provider.of<DatePicker_Provider>(context,
                                        listen: false)
                                    .datePicker_Model
                                    .initialDate !=
                                null)
                            ? Text(
                                "${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialDate.day}-${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialDate.month}-${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialDate.year}")
                            : Text("Pick Date"),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            pickTime = await showTimePicker(
                              context: context,
                              initialTime: Provider.of<DatePicker_Provider>(
                                      context,
                                      listen: false)
                                  .datePicker_Model
                                  .initialTime,
                            );
                            if (pickTime != null) {
                              Provider.of<DatePicker_Provider>(context,
                                      listen: false)
                                  .initializationTime();
                            }
                          },
                          icon: Icon(Icons.access_time_outlined),
                        ),
                        // (Provider.of<DatePicker_Provider>(context,listen: false).datePicker_Model.initialTime.hour != null)
                        //     ?
                        (Provider.of<DatePicker_Provider>(context,
                                        listen: false)
                                    .datePicker_Model
                                    .initialTime
                                    .period
                                    .index ==
                                1)
                            ? (Provider.of<DatePicker_Provider>(context,
                                            listen: false)
                                        .datePicker_Model
                                        .initialTime
                                        .hour >
                                    12)
                                ? Text(
                                    "${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.hour - 12}/${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.minute} ${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.period.name}")
                                : Text(
                                    "${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.hour}/${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.minute} ${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.period.name}")
                            : Text(
                                "${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.hour}/${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.minute} ${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.period.name}")
                        // : Text("Pick Date"),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (Provider.of<ImagePickerProvider>(context,
                                    listen: false)
                                .image !=
                            null) {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            print(
                                "====================================================");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).addContactVariable_Model.fullName}");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).addContactVariable_Model.mobileNumber}");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).addContactVariable_Model.Chats}");
                            print(
                                "====================================================");

                            Provider.of<AddContactVariable_provider>(context,
                                    listen: false)
                                .initialization();
                            Provider.of<DatePicker_Provider>(context,listen: false).AddinitializationInList();
                            print(
                                "====================================================");
                            print("CHECK");
                            print("CHECK");
                            print("CHECK");
                            print(
                                "====================================================");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).addContactVariable_Model.fullName}");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).addContactVariable_Model.mobileNumber}");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).addContactVariable_Model.Chats}");
                            print(
                                "====================================================");

                            Provider.of<AddContactVariable_provider>(context,
                                    listen: false)
                                .AddAllContactinitialization();
                            Provider.of<ImagePickerProvider>(context,
                                    listen: false)
                                .Clear();
                            Provider.of<DatePicker_Provider>(context,listen: false).datePicker_Model.initialDate = DateTime.now();
                            Provider.of<DatePicker_Provider>(context,listen: false).datePicker_Model.initialCupertinoTime = DateTime.now();
                            Provider.of<DatePicker_Provider>(context,listen: false).datePicker_Model.initialTime = TimeOfDay.now();

                            print(
                                "=======================List====================");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).fullName}");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).mobileNumber}");
                            print(
                                "${Provider.of<AddContactVariable_provider>(context, listen: false).chats}");
                            print(
                                "=======================List====================");
                            print(
                                "=======================Done====================");
                            setState(() {});
                          }
                        } else {
                          SnackBar snackBar = SnackBar(
                            content: Text("Fill Image"),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text("Save"),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
