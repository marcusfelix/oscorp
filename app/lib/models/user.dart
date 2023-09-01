import 'dart:async';

class User {
  final String uid;
  String email;
  String name;
  String photo;

  User({
    required this.uid,
    required this.email,
    required this.name,
    required this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'name': name,
    'photo': photo,
  };

  factory User.mock() => User(
    uid: "123",
    email: "",
    name: "Demo User",
    photo: "https://via.placeholder.com/150",
  );
}

StreamTransformer<dynamic, User?> userTransformer = StreamTransformer<dynamic, User?>.fromHandlers(
  handleData: (data, sink) {
    if(data.session != null){
      sink.add(User.fromJson(data.session!.user.toJson()));
    } else {
      sink.add(null);
    }
  }
);