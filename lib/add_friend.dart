import 'package:flutter/material.dart';
import 'package:myfriend/contact.dart';
// import 'package:myfriend/models/friend.dart';
// import 'package:myfriend/providers/firestore_service.dart';

class AddFriends extends StatefulWidget {
  const AddFriends({super.key});

  @override
  State<AddFriends> createState() => _AddFriendsState();
}

class _AddFriendsState extends State<AddFriends> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Friends List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              //start
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black),
                child: Icon(Icons.add_a_photo, color: Colors.amber, size: 120),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: 'Your Friend Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ))),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: contactController,
                keyboardType: TextInputType.number,
                maxLength: 13,
                decoration: const InputDecoration(
                    hintText: 'Contact Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ))),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: 3,
                controller: addressController,
                decoration: const InputDecoration(
                    hintText: 'Address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ))),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        String name = nameController.text.trim();
                        String contact = contactController.text.trim();
                        String address = addressController.text.trim();
                        if (name.isNotEmpty &&
                            (contact.isNotEmpty && address.isNotEmpty)) {
                          setState(() {
                            nameController.text = '';
                            contactController.text = '';
                            addressController.text = '';
                            // Contact.addFriends(Friends(
                            //     name: name,
                            //     contact: contact,
                            //     address: address));
                          });
                        }
                        //
                      },
                      child: const Text('Save')),
                  ElevatedButton(
                      onPressed: () {
                        //
                        String name = nameController.text.trim();
                        String contact = contactController.text.trim();
                        if (name.isNotEmpty && contact.isNotEmpty) {
                          setState(() {
                            nameController.text = '';
                            contactController.text = '';
                            contacts[selectedIndex].name = name;
                            contacts[selectedIndex].contact = contact;
                            selectedIndex = -1;
                          });
                        }
                        //
                      },
                      child: const Text('Update')),
                ],
              ),
              //end
            ],
          ),
        ),
      ),
    );
  }
}
