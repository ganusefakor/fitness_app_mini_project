class UserModel {
  final String firstname;
  final String lastname;
  final String gender;
  final String dataeOfBith;
  final double weight;
  final double height;
  final String email;
  final String uid;
  final String password;
  

   UserModel({
    required this.dataeOfBith,
    required this.firstname,
    required this.gender, 
    required this.lastname,
    required this.height,
    required this.weight,
    required this.email,
    required this.uid,
    required this.password,
    
  });
  
 Map<String, dynamic> toMap() {
    return {
       'dataeOfBith': dataeOfBith,
      'firstname': firstname,
       'lastname': lastname,
       'weight': weight,
       'height': height,
       'gender': gender,
      'email': email,
      'uid': uid,
      'password': password,
      
    };
  }
   factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      dataeOfBith: map['dataeOfBith'] ?? '',
      gender: map['gender'] ?? '',
      height: map['height']?? '',
      lastname: map['lastname']?? '',
      weight: map['weight'] ?? '',
      firstname: map['firstname'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
      password: map['password'] ?? '',
      
    );
  } 
}
