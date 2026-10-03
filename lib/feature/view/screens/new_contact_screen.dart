import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_app/core/helper/app_dialog.dart';
import 'package:contact_app/feature/data/firebase/firebase_sevice.dart';
import 'package:contact_app/feature/data/model/contact_user.dart';
import 'package:contact_app/feature/view/widget/custom_material_button.dart';
import 'package:contact_app/feature/view/widget/custom_text_form_feild_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class NewContactScreen extends StatefulWidget {
  const NewContactScreen ({super.key,});

  @override
  State<NewContactScreen> createState() => _NewContactScreenState();
}

class _NewContactScreenState extends State<NewContactScreen> {
  String? dropdownButtonValue = "Pending";
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  //int colorSelected = 4280391411;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Add New Contact",
          style:  TextStyle(fontSize: 25,fontWeight: .bold,color: Colors.amber),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 15,
          children: [
            CoustomTextFormFeild(
              label: "Name", 
              hint: "Enter Name", 
              controller: nameController,
              ), 
            CoustomTextFormFeild(
              label: "Phone Number", 
              hint: "Enter phone number",
              controller: phoneController,
              ),

            SizedBox(height: 50,),
            CustomMaterialButton(onPressed: () async {
              var name = nameController.text;
              var phone = phoneController.text;

              AppDialog.showLoading(context);
               try{
                AppFirebaseService.addUser(ContactUser(name: name, phone: phone,),);
               Navigator.of(context).pop();
               Navigator.of(context).pop();
              }catch (e) {
               Navigator.of(context).pop();
               AppDialog.showError(context, e.toString());
              }
            }, 
            text: "Save"),
          ],
        ),
      ),
    );
  }
}
