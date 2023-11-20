class MyUser {
  late String uid;
  late String mail;
  String? image;
  late String nom;
  late String prenom;
  String? pseudo;
  List? favoris;

  MyUser.empty() {
    uid = "";
    mail = "";
    nom = "";
    prenom = "";
  }
}
