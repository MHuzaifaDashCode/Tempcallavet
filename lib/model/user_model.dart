class UserModel {
  String? uid;
  String? name;
  String? email;
  String? role;

  UserModel({this.uid, this.name, this.email, this.role});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      role: map['role'],      
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'role': role,
    };
  }
}
