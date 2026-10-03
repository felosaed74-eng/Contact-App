import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_app/feature/data/model/contact_user.dart';

abstract class AppFirebaseService {
  static CollectionReference<ContactUser> collection() {
   return FirebaseFirestore.instance
    .collection("Contact")
    .withConverter<ContactUser>(
      fromFirestore:(snapshot, options) => ContactUser.fromjson(snapshot.data()!), 
      toFirestore: (contactUser, _) => contactUser.tojson(),
    );
  }



  static Future<void> addUser(ContactUser user) async{
    var doc = collection().doc();
    user.id = doc.id;
    await doc.set(user);
  }

  static Future<void> delete(String? id) async {
    await collection().doc(id).delete();
  }

  static Future<void> update(ContactUser user, String id) async {
    await collection().doc(user.id).update(user.tojson());
  }

  static Future<List<ContactUser>> getAllCollaction() async{
    var data = await collection().get();
    return data.docs
    .map(
      (e) => ContactUser(
      name: e.data().name, 
      phone: e.data().phone, 
      id: e.data().id), 
    )
    .toList();
  }

}