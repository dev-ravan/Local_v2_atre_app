import 'package:atre_windows/Constants/myWidgets.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import '../../Constants/myColors.dart';
import 'appointment_widgets.dart';
import 'package:intl/intl.dart';

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({super.key});

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final format = DateFormat("yyyy-MM-dd");
  List<User>? selectedUserList = [];
  TextEditingController diagnosisTextControl = TextEditingController();
  @override
  void initState() {
    super.initState();
    diagnosisTextControl.text = 'Differential Diagnosis';
  }

  Future<void> _openFilterDialog() async {
    await FilterListDialog.display<User>(
      context,
      hideSelectedTextCount: true,
      themeData: FilterListThemeData(
        context,
      ),
      headlineText: 'Select Name',
      height: 400,
      width: 500,
      listData: userList,
      enableOnlySingleSelection: true,
      selectedListData: selectedUserList,
      choiceChipLabel: (item) => item!.name,
      validateSelectedItem: (list, val) => list!.contains(val),
      controlButtons: [ControlButtonType.All, ControlButtonType.Reset],
      onItemSearch: (user, query) {
        return user.name!.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedUserList = List.from(list!);
        });
        Navigator.pop(context);
      },
      choiceChipBuilder: (context, item, isSelected) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(
            color: isSelected! ? myColors.greenColor! : Colors.grey[300]!,
          )),
          child: Text(
            item.name,
            style: TextStyle(
                color: isSelected ? myColors.greenColor : Colors.grey[500]),
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          myWidgets.titleText(title: 'New Appointment'),
          const SizedBox(height: 16.0),
          Expanded(
              child: Align(
            alignment: Alignment.topLeft,
            //********************Appointment Form******************//
            child: Container(
              height: 550,
              width: double.infinity,
              decoration: appointmentWidgets.containerBoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        appointmentWidgets.chipSlots(
                            onTap: _openFilterDialog,
                            width: 300,
                            listView: ListView.builder(
                              itemCount: selectedUserList!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Center(
                                    child: Text(selectedUserList![index].name!,
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  ),
                                );
                              },
                            ),
                            selectedList: selectedUserList!,
                            text: 'Patient Name'),
                        const SizedBox(width: 20),
                        appointmentWidgets.chipSlots(
                            onTap: _openFilterDialog,
                            width: 300,
                            listView: ListView.builder(
                              itemCount: selectedUserList!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Center(
                                    child: Text(selectedUserList![index].name!,
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  ),
                                );
                              },
                            ),
                            selectedList: selectedUserList!,
                            text: 'Time'),
                        const SizedBox(width: 20),
                        appointmentWidgets.chipSlots(
                            onTap: _openFilterDialog,
                            width: 300,
                            listView: ListView.builder(
                              itemCount: selectedUserList!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Center(
                                    child: Text(selectedUserList![index].name!,
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  ),
                                );
                              },
                            ),
                            selectedList: selectedUserList!,
                            text: 'Time'),
                      ],
                    ),
                    const SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        appointmentWidgets.chipSlots(
                            onTap: _openFilterDialog,
                            width: 300,
                            listView: ListView.builder(
                              itemCount: selectedUserList!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Center(
                                    child: Text(selectedUserList![index].name!,
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  ),
                                );
                              },
                            ),
                            selectedList: selectedUserList!,
                            text: 'Time'),
                        const SizedBox(width: 20),
                        appointmentWidgets.chipSlots(
                            onTap: _openFilterDialog,
                            width: 300,
                            listView: ListView.builder(
                              itemCount: selectedUserList!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Center(
                                    child: Text(selectedUserList![index].name!,
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  ),
                                );
                              },
                            ),
                            selectedList: selectedUserList!,
                            text: 'Time'),
                        const SizedBox(width: 20),
                        appointmentWidgets.chipSlots(
                            onTap: _openFilterDialog,
                            width: 300,
                            listView: ListView.builder(
                              itemCount: selectedUserList!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Center(
                                    child: Text(selectedUserList![index].name!,
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  ),
                                );
                              },
                            ),
                            selectedList: selectedUserList!,
                            text: 'Time'),
                      ],
                    ),
                    const SizedBox(height: 50.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          const SizedBox(height: 20),
                          appointmentWidgets.chipSlots(
                              onTap: _openFilterDialog,
                              width: 300,
                              listView: ListView.builder(
                                itemCount: selectedUserList!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Center(
                                      child: Text(
                                          selectedUserList![index].name!,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 0, 0, 0))),
                                    ),
                                  );
                                },
                              ),
                              selectedList: selectedUserList!,
                              text: 'Time'),
                          const SizedBox(width: 20),
                          Container(
                              height: 50,
                              width: 300,
                              child: appointmentWidgets.datePicker(
                                  format: format)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: appointmentWidgets.formField(
                            maxLines: 3,
                            labelText: '',
                            hintText: 'Differential Diagnosis',
                            controller: diagnosisTextControl)),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: appointmentWidgets.button(
                              label: 'Cancel',
                              color: myColors.blackColor,
                              onPressed: () {},
                              icon: Icon(
                                Icons.cancel,
                                color: myColors.blackColor,
                              )),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              color: myColors.greenColor,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: appointmentWidgets.button(
                              label: 'Create',
                              color: myColors.whiteColor,
                              onPressed: () {},
                              icon: Icon(
                                Icons.group_add,
                                color: myColors.whiteColor,
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class User {
  final String? name;
  final String? avatar;
  User({this.name, this.avatar});
}

/// Creating a global list for example purpose.
/// Generally it should be within data class or where ever you want
List<User> userList = [
  User(name: "Abigail", avatar: "user.png"),
  User(name: "Audrey", avatar: "user.png"),
  User(name: "Ava", avatar: "user.png"),
  User(name: "Bella", avatar: "user.png"),
  User(name: "Bernadette", avatar: "user.png"),
  User(name: "Carol", avatar: "user.png"),
  User(name: "Claire", avatar: "user.png"),
  User(name: "Deirdre", avatar: "user.png"),
  User(name: "Donna", avatar: "user.png"),
  User(name: "Dorothy", avatar: "user.png"),
  User(name: "Faith", avatar: "user.png"),
  User(name: "Gabrielle", avatar: "user.png"),
  User(name: "Grace", avatar: "user.png"),
  User(name: "Hannah", avatar: "user.png"),
  User(name: "Heather", avatar: "user.png"),
  User(name: "Irene", avatar: "user.png"),
  User(name: "Jan", avatar: "user.png"),
  User(name: "Jane", avatar: "user.png"),
  User(name: "Julia", avatar: "user.png"),
  User(name: "Kylie", avatar: "user.png"),
  User(name: "Lauren", avatar: "user.png"),
  User(name: "Leah", avatar: "user.png"),
  User(name: "Lisa", avatar: "user.png"),
  User(name: "Melanie", avatar: "user.png"),
  User(name: "Natalie", avatar: "user.png"),
  User(name: "Olivia", avatar: "user.png"),
  User(name: "Penelope", avatar: "user.png"),
  User(name: "Rachel", avatar: "user.png"),
  User(name: "Ruth", avatar: "user.png"),
  User(name: "Sally", avatar: "user.png"),
  User(name: "Samantha", avatar: "user.png"),
  User(name: "Sarah", avatar: "user.png"),
  User(name: "Theresa", avatar: "user.png"),
  User(name: "Una", avatar: "user.png"),
  User(name: "Vanessa", avatar: "user.png"),
  User(name: "Victoria", avatar: "user.png"),
  User(name: "Wanda", avatar: "user.png"),
  User(name: "Wendy", avatar: "user.png"),
  User(name: "Yvonne", avatar: "user.png"),
  User(name: "Zoe", avatar: "user.png"),
];
