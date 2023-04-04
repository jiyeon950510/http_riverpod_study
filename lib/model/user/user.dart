class User {
  int? id;
  String? username;
  String? email;

  User({this.id, this.username, this.email});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id:json["email"],
      email: json["email"]
    );
  }
  Map<String, dynamic> toJson(){
    return{
      "id":id,
      "username":username,
      "email":email
    };
  }
}