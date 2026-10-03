import 'package:flutter/material.dart';

class CardPerson extends StatelessWidget {
  const CardPerson({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String title;
  final String subtitle;  
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: ListTile(
        title: Text(title,style: TextStyle(
           color: Colors.black,
           fontSize: 20,
           fontWeight:.bold,),
        ),
        subtitle: Text(subtitle,style: TextStyle(
           color: Colors.orange,
           fontSize: 16,
           fontWeight:.bold,),
        ),
        trailing: InkWell(
          onTap: onTap,
          child: Icon(Icons.delete,size: 30,color: Colors.red,)),
      ),
    );
  }
}