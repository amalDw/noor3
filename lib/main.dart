import 'dart:js';

import 'package:midterm/pages/addContactPage.dart';
import 'package:flutter/material.dart';
import 'package:midterm/pages/viewContact.dart';
import 'package:midterm/provider/providertest.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ProviderTest>(create: (context)=> ProviderTest(),
  child: MaterialApp(home:ViewContacts() ,),
  ));
}
