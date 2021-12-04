import 'package:midterm/pages/TextFieldcompenent.dart';
import 'package:midterm/phoneContactClass.dart';
import 'package:midterm/pages/viewContact.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:midterm/provider/providertest.dart';
import 'package:provider/provider.dart';



class EditContact extends StatefulWidget {
  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  final Name1Controller = TextEditingController();
  final Name2Controller = TextEditingController();
  final Phone1Controller = TextEditingController();
  final Phone2Controller = TextEditingController();
  Widget build(BuildContext context) {
    var contactprov = Provider.of<ProviderTest>(context);

    Name1Controller.text =
        '${contactprov.contanctList[contactprov.index].Name1}';
    Name2Controller.text =
        '${contactprov.contanctList[contactprov.index].Name2}';
    Phone1Controller.text =
        '${contactprov.contanctList[contactprov.index].Phone1}';
    Phone2Controller.text =
        '${contactprov.contanctList[contactprov.index].Phone2}';
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            MyTextField(
                typeOfInput: TextInputType.text,
                label: 'First name',
                cont: Name1Controller),
            MyTextField(
                typeOfInput: TextInputType.text,
                label: 'last name',
                cont: Name2Controller),
            MyTextField(
                typeOfInput: TextInputType.number,
                label: 'first phone',
                cont: Phone1Controller),
            MyTextField(
                typeOfInput: TextInputType.number,
                label: 'second phone',
                cont: Phone2Controller),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue.withOpacity(.1),
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    if ((Name1Controller.text) != '' &&
                        (Name2Controller.text) != '' &&
                        (Phone1Controller.text) != '') {
                      contactprov.editContact(PhoneContactClass(
                        Name1: Name1Controller.text,
                        Name2: Name2Controller.text,
                        Phone1: Phone1Controller.text,
                        Phone2: Phone2Controller.text == null
                            ? ''
                            : Phone2Controller.text,
                      ));

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewContacts()));
                    } else {
                      Fluttertoast.showToast(
                          msg:
                              "please fill first and last name and first phone number",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2,
                         
                          textColor: Colors.blue,
                          fontSize: 16.0);
                    }
                  },
                  child: Text('Edit')),
            ),
            Container(
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('close'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
