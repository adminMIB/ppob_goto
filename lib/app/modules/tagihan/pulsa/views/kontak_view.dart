import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:sizer/sizer.dart';
import 'dart:typed_data';
import 'package:url_launcher/url_launcher.dart';

class KontakView extends StatefulWidget {
  const KontakView({Key? key}) : super(key: key);

  @override
  _KontakViewState createState() => _KontakViewState();
}

class _KontakViewState extends State<KontakView> {
  TextEditingController search = TextEditingController();

  List<Contact>? contacts;
  List<Contact>? filteredContacts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact();
  }

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      print(contacts);
      setState(() {});
    }
  }

  void filterContacts(String query) {
    setState(() {
      filteredContacts = contacts!
          .where((contact) =>
              contact.name.first.toLowerCase().contains(query.toLowerCase()) ||
              contact.name.last.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0.h,
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 10.0.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: whiteColor,
        child: Column(
          children: [
            Container(
              height: 7.0.h,
              width: Get.width,
              decoration: BoxDecoration(
                color: oceanColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  'Daftar Kontak',
                  style: TextStyle(
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 2.0.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: search,
                decoration: InputDecoration(
                  hintText: 'Cari kontak...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 1.0.h),
            (contacts) == null
                ? Container(
                    height: Get.height * 0.50,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: contacts!.length,
                      itemBuilder: (BuildContext context, int index) {
                        Uint8List? image = contacts![index].photo;
                        String num = (contacts![index].phones.isNotEmpty)
                            ? (contacts![index].phones.first.number)
                            : "--";
                        return ListTile(
                            leading: (contacts![index].photo == null)
                                ? const CircleAvatar(child: Icon(Icons.person))
                                : CircleAvatar(
                                    backgroundImage: MemoryImage(image!)),
                            title: Text(
                              "${contacts![index].name.first} ${contacts![index].name.last}",
                            ),
                            onTap: () {
                              if (contacts![index].phones.isNotEmpty) {
                                String num =
                                    contacts![index].phones.first.number;
                                Get.back(result: num);
                              }
                            });
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
