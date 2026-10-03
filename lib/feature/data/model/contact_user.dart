class ContactUser {
  String? name;
  String? phone;
  String? id;
  ContactUser({ this.name, this.phone, this.id});

  // to json
  // convert object to json
  Map<String, dynamic> tojson() {
    return {"name": name,"phone": phone, "id": id};
  }


  // from json
  // convert json to object
  
  ContactUser.fromjson(Map<String, dynamic> json) {
    name = json["name"];
    phone = json["phone"];
    id = json["id"];
  }

}