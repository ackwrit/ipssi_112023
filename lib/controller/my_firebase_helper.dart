import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MyFirebaseHelper {
  final auth = FirebaseAuth.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");
  final storage = FirebaseStorage.instance;

  //creer un utilisateur

  //connecter un utilisateur

  //ajouter un utilisateur dans la base de donnée

  //mettre à jour les infos d'un utilisateur
}
