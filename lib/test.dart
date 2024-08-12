import 'dart:io';

void main() {
  DbManager dbManager = DbManager();
  ContactManager contactManager = ContactManager();
  contactManager.contacts = dbManager.initDb();

  while (true) {
    print(
        ' 1)Show all contacts \n 2)Add a new contact \n 3)Search \n 4)Update a contact \n 5)Delete a contact \n 6)Delete all contacts \n 7)Exit');
    String selected = stdin.readLineSync()!;

    switch (selected) {
      case '1':
        {
          var contacts = contactManager.getAllContacts();
          for (var v in contacts) {
            print(v.id);
            print(v.name);
            print(v.phone);
            print(v.family);
            print('------------------------------\n');
          }
        }
      case '2':
        {
          print('Enter name:');
          String name = stdin.readLineSync()!;
          print('Enter family:');
          String family = stdin.readLineSync()!;
          print('Enter phone number:');
          String phone = stdin.readLineSync()!;
          contactManager.addContact(
            Contact(
              id: 1,
              name: name,
              phone: phone,
              family: family,
            ),
          );
        }
    }
  }
}

class Contact {
  int id;
  String name;
  String family;
  String phone;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
    required this.family,
  });
}

class ContactManager {
  // CRUD
  DbManager dbManager = DbManager();
  List<Contact> contacts = [];

  List<Contact> getAllContacts() {
    return contacts;
  }

  addContact(Contact contact) {
    dbManager.add(
      contact.id,
      contact.name,
      contact.family,
      contact.phone,
    );
    contacts.add(contact);
  }
}

class DbManager {
  File file = File('E://contactsDb');

  List<Contact> initDb() {
    final List<Contact> contacts = [];
    if (file.existsSync()) {
      final List<String> lines = file.readAsLinesSync();
      for (int i = 0; i < lines.length; i++) {
        var line = lines[i];
        List splitted = line.split('*');
        var contact = Contact(
          id: int.parse(splitted[0]),
          name: splitted[1],
          family: splitted[2],
          phone: splitted[3],
        );
        contacts.add(contact);
      }
    }

    return contacts;
  }

  void add(int id, String name, String family, String phone) {
    file.writeAsStringSync(
      '$id*$name*$family*$phone\n',
      mode: FileMode.append,
    );
  }
}
