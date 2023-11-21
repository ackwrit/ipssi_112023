import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MyFirebaseHelper {
  final auth = FirebaseAuth.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");
  final storage = FirebaseStorage.instance;

  //creer un utilisateur
  createUserFirebase(
      {required String email,
      required String password,
      required String nom,
      required prenom}) async {
    UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    String uid = credential.user!.uid;
    Map<String, dynamic> data = {
      "NOM": nom,
      "PRENOM": prenom,
      "EMAIL": email,
    };
    addUser(uid, data);
  }

  //connecter un utilisateur
  Future connectFirebase(
      {required String email, required String password}) async {
    UserCredential credential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  //ajouter un utilisateur dans la base de donnée
  addUser(String uid, Map<String, dynamic> data) {
    cloudUsers.doc(uid).set(data);
  }

  //mettre à jour les infos d'un utilisateur
}
