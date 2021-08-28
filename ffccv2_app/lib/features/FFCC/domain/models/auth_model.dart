class Auth {
  Auth({
    this.email,
    this.password,
  });

  String? email;
  String? password;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
