import 'package:atre_windows/Constants/myColors.dart';
import 'package:flutter/material.dart';

class AllDoctorsTab extends StatefulWidget {
  const AllDoctorsTab({super.key});

  @override
  State<AllDoctorsTab> createState() => _AllDoctorsTabState();
}

class _AllDoctorsTabState extends State<AllDoctorsTab> {
  List<String> data = [
    'AM-1033                  Kamini R           22334455',
    'AM-1033                  Arsha I              22334455',
    'AM-1033                  Namish A          22334455',
    'AM-1033                  Isha S               22334455',
    'AM-1033                  Rudran M          22334455',
    'AM-1033                  Mala AC             22334455',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          TextField(
            //==========1
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: myColors.greyBgColor))),
          ),
          const SizedBox(height: 10),
          Container(
            //==========2
            height: 60,
            width: 700,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                  'Doctor Id                    Name                  Contact'),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
              child: Container(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (Context, index) {
                  return Card(
                    elevation: 0,
                    color: (index % 2 == 0)
                        ? myColors.tileColor
                        : myColors.whiteColor,
                    child: ListTile(
                      title: Text(data[index]),
                      trailing: SizedBox(
                        width: 200,
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                  label: const Text('Edit')),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 30,
                              child: TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.delete,
                                    color: myColors.redColor,
                                    size: 20,
                                  ),
                                  label: Text(
                                    'Delete',
                                    style: TextStyle(color: myColors.redColor),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }
}
