import 'package:contact_app/core/helper/app_dialog.dart';
import 'package:contact_app/core/routes/app_routes.dart';
import 'package:contact_app/feature/data/firebase/firebase_sevice.dart';
import 'package:contact_app/feature/data/model/contact_user.dart';
import 'package:contact_app/feature/view/widget/card_person_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContactUser> users = [];

  @override
  void initState() {
    super.initState();
    getAllContact();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Elbatol Contact", 
        style: TextStyle(
           color: Colors.orange,
           fontSize: 30,
           fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => 
        CardPerson(
          title: users[index].name ?? "", 
          subtitle: users[index].phone ?? "",
          onTap: () async{
            AppDialog.showLoading(context);
            await AppFirebaseService.delete(users[index].id);
            Navigator.of(context).pop();
            users.removeAt(index);
            setState(() {});
          },
          ),
        
        itemCount: users.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: ()  async {
          await Navigator.of(context).pushNamed(AppRoute.newContact);
          getAllContact();
        },
        child: Text(
           "Add", 
           style: TextStyle(
           color: Colors.black,
           fontSize: 16,
           fontWeight: .bold
          ),
        ),
      ),
    );
  }

  void getAllContact() async{
  users = await AppFirebaseService.getAllCollaction();
    setState(() {

    });
  }
}