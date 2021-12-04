import 'package:flutter/material.dart';
import 'package:midterm/phoneContactClass.dart';

class ProviderTest extends ChangeNotifier{

List<PhoneContactClass> contanctList = [];
  int index = -1;
  addContact(PhoneContactClass c) {
    contanctList.add(c);
    notifyListeners();
  }

 

  editContact(PhoneContactClass c) {
    contanctList[index].Name1 = c.Name1;
    contanctList[index].Name2 = c.Name2;
    contanctList[index].Phone1 = c.Phone1;
    contanctList[index].Phone2 = c.Phone2;
    notifyListeners();
  } 
  deleteContact(index) {
    contanctList.removeAt(index);
    notifyListeners();
  }



}