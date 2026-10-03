import 'package:contact_app/feature/view/widget/custom_material_button.dart';
import 'package:contact_app/feature/view/widget/custom_text_form_feild_widget.dart';
import 'package:flutter/material.dart';

class NewContactScreen extends StatefulWidget {
  const NewContactScreen ({super.key,});

  @override
  State<NewContactScreen> createState() => _NewContactScreenState();
}

class _NewContactScreenState extends State<NewContactScreen> {
  String? dropdownButtonValue = "Pending";
  var name = TextEditingController();
  var phone = TextEditingController();
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
              controller: name,
              ), 
            CoustomTextFormFeild(
              label: "Phone Number", 
              hint: "Enter phone number",
              controller: phone,
              ),

            SizedBox(height: 50,),
            CustomMaterialButton(onPressed: () async{}, text: "Save"),
          ],
        ),
      ),
    );
  }
}
