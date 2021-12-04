import 'package:midterm/phoneContactClass.dart';
import 'package:midterm/pages/viewContact.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:midterm/provider/providertest.dart';

import 'package:provider/provider.dart';

import 'TextFieldcompenent.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  @override
  final Name1Controller = TextEditingController();
  final Name2Controller = TextEditingController();
  final Phone1Controller = TextEditingController();
  final Phone2Controller = TextEditingController();
  Widget build(BuildContext context) {
    var contactprov = Provider.of<ProviderTest>(context);
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.pink.withOpacity(0.2),
                    textStyle: TextStyle(
                      color: Colors.black,                      
                      fontSize: 30,
                    ),
                  ),
                  onPressed: () {
                    if ((Name1Controller.text) != '' &&
                        (Name2Controller.text) != '' &&
                        (Phone1Controller.text) != '') {
                      contactprov.addContact(PhoneContactClass(
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
                              "please check that you write at least the first lasst and a first phone number",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.cyan,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: Text('add')),
            ),
            Container(
              child: SizedBox(
                height: 40,
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
