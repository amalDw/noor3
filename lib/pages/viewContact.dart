import 'package:midterm/pages/addContactPage.dart';
import 'package:midterm/phoneContactClass.dart';
import 'package:midterm/pages/editContactPage.dart';
import 'package:flutter/material.dart';
import 'package:midterm/provider/providertest.dart';
import 'package:provider/provider.dart';

class ViewContacts extends StatefulWidget {
  @override
  _ViewContactsState createState() => _ViewContactsState();
}

class _ViewContactsState extends State<ViewContacts> {
  @override
  Widget build(BuildContext context) {
    final contactListDisplay = Provider.of<ProviderTest>(context);
    final List<PhoneContactClass> conList = contactListDisplay.contanctList;

    return Scaffold(
        appBar: AppBar(
          title: Text('Contact List'),
          backgroundColor: Colors.pink,
        ),
        body: Column(
          children: [
            ((conList.length == 0) || (conList == null))
                ? Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.center,
                      child: Center(
                        child: Text('NO contacts available'),
                      ),
                    ),
                  )
                : Expanded(
                    flex: 8,
                    child: Container(
                      margin: EdgeInsets.all(4),
                      child: ListView.builder(
                          itemCount: conList.length,
                          itemBuilder: (context, index) {
                            final contact = conList[index];
                            return GestureDetector(
                              onTap: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext) => AlertDialog(
                                          actionsPadding: EdgeInsets.all(7),
                                          title: Text(
                                              '${contact.Name1} ${contact.Name2}'),
                                          content: Column(
                                            children: [
                                              Text('phone 1 ${contact.Phone1}'),
                                              Text('phone 2 ${contact.Phone2}'),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                  backgroundColor: Colors.pink,
                                                ),
                                                onPressed: () {
                                                  final x = index;
                                                  contactListDisplay.index = x;
                                                  print(x);
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditContact()));
                                                },
                                                child: Text('edit')),
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                  primary: Colors.white,
                                                  backgroundColor: Colors.pink,
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  contactListDisplay
                                                      .deleteContact(index);
                                                  Navigator.pop(
                                                      context, 'Delete');
                                                },
                                                child: Text('Delete')),
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                  primary: Colors.white,
                                                  backgroundColor: Colors.pink,
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context, 'close');
                                                },
                                                child: Text('close')),
                                          ],
                                        ));
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.pink,
                                    child: Text(
                                        '${contact.Name1[0].toUpperCase()}'),
                                  ),
                                  title:
                                      Text('${contact.Name1} ${contact.Name2}'),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                child: FloatingActionButton(
                  backgroundColor: Colors.pink,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddContactPage()));
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ));
  }
}
