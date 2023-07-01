import 'package:atre_windows/Constants/myWidgets.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import '../../Constants/myColors.dart';
import 'appointment_widgets.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({super.key});

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final format = DateFormat("dd / MM / yyyy");
  List<User>? selectedUserList = [];
  TextEditingController diagnosisTextControl = TextEditingController();
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    diagnosisTextControl.text = 'Differential Diagnosis';
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: myWidgets.titleText(title: 'New Appointment'),
                ),
                Expanded(
                    child: appointmentWidgets.mobileSearch(
                        controller: _searchController, onTap: () {}))

                // myWidgets.searchField()
              ],
            ),
            const SizedBox(height: 16.0),
            Container(
              height: 550,
              width: double.infinity,
              decoration: appointmentWidgets.containerBoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              // ********************************************* Patient Name ***************************************************
                              appointmentWidgets.chipSlots(
                                  onTap: _openFilterDialog,
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
                                  text: 'Patient Name'),

                              // ********************************************* Scan Type **************************************************

                              appointmentWidgets.chipSlots(
                                  onTap: _openFilterDialog,
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
                                  text: 'Scan Type'),
                              // ********************************************* Appointment Date ***************************************************

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 14),
                                child: DateTimeField(
                                  resetIcon: null,
                                  decoration: InputDecoration(
                                      border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.green),
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  format: format,
                                  onShowPicker: (context, currentValue) {
                                    return showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        initialDate:
                                            currentValue ?? DateTime.now(),
                                        lastDate: DateTime(2100));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              // ********************************************* Appointment Location ***************************************************

                              appointmentWidgets.chipSlots(
                                  onTap: _openFilterDialog,
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
                                  text: 'Appointment Location'),

                              // ********************************************* Doctor Name ***************************************************

                              appointmentWidgets.chipSlots(
                                  onTap: _openFilterDialog,
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
                                  text: 'Doctor Name'),
                              // ********************************************* Appointment Time ***************************************************

                              appointmentWidgets.chipSlots(
                                  onTap: _openFilterDialog,
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
                                  text: 'Appointment Time'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              // ********************************************* Referred Doctor ***************************************************

                              appointmentWidgets.chipSlots(
                                  onTap: _openFilterDialog,
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
                                  text: 'Referred Doctor'),
                              // ********************************************* Radiologist Name ***************************************************

                              appointmentWidgets.chipSlots(
                                  onTap: _openFilterDialog,
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
                                  text: 'Radiologist Name'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // ********************************************* Differential Diagnosis ***************************************************

                    appointmentWidgets.formField(
                        maxLines: 3,
                        labelText: '',
                        hintText: 'Differential Diagnosis',
                        controller: diagnosisTextControl),
                    const SizedBox(
                      height: 35,
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {},
                        child: myWidgets.greenText(title: "Add New Patient")),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _openFilterDialog({required}) async {
    await FilterListDialog.display<User>(
      context,
      hideSelectedTextCount: true,
      themeData: FilterListThemeData(
        context,
      ),
      height: 400,
      width: 500,
      listData: userList,
      hideCloseIcon: true,
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
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected! ? myColors.greenColor : Colors.grey[400]!,
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
