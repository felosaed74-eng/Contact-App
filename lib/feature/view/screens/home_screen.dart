import 'package:contact_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Elbatol Contacts", 
        style: TextStyle(
           color: Colors.amber,
           fontSize: 30,
           fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => 
        CardPerson(title: "felo$index", subtitle: "0123456789$index"),
        
        itemCount: 20,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoute.newContact);
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
}

class CardPerson extends StatelessWidget {
  const CardPerson({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;  

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: ListTile(
        title: Text(title,style: TextStyle(
           color: Colors.black,
           fontSize: 20,),
        ),
        subtitle: Text(subtitle,style: TextStyle(
           color: const Color.fromARGB(255, 6, 214, 13),
           fontSize: 16,),
        ),
        trailing: Icon(Icons.person,size: 30,color: Colors.blue,),
      ),
    );
  }
}