import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isspi_bd3/controller/my_firebase_helper.dart';
import 'package:isspi_bd3/globale.dart';
import 'package:isspi_bd3/model/my_user.dart';

class MyAllUsers extends StatefulWidget {
  const MyAllUsers({super.key});

  @override
  State<MyAllUsers> createState() => _MyAllUsersState();
}

class _MyAllUsersState extends State<MyAllUsers> {
  List tableau = [];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: MyFirebaseHelper().cloudUsers.snapshots(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            //temps d'attente lors de la connexion à la base de donnée
            return const CircularProgressIndicator.adaptive();
          } else {
            if (!snap.hasData) {
              //il n'y a pas d'informations dans la base de donnée
              return const Center(
                child: Text("Aucune donnée"),
              );
            } else {
              List documents = snap.data!.docs;
              return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    MyUser lesAutres = MyUser(documents[index]);
                    if (moi.uid == lesAutres.uid) {
                      return Container();
                    } else {
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(lesAutres.image!),
                          ),
                          title: Text(lesAutres.nom),
                          subtitle: Text(lesAutres.mail),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: (moi.favoris!.contains(lesAutres.uid))
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            onPressed: () {
                              if (moi.favoris!.contains(lesAutres.uid)) {
                                setState(() {
                                  moi.favoris!.remove(lesAutres.uid);
                                  tableau = moi.favoris!;
                                });
                              } else {
                                setState(() {
                                  moi.favoris!.add(lesAutres.uid);
                                  tableau = moi.favoris!;
                                });
                              }
                              Map<String, dynamic> data = {"FAVORIS": tableau};
                              MyFirebaseHelper().upadteUser(moi.uid, data);
                            },
                          ),
                        ),
                      );
                    }
                  });
            }
          }
        });
  }
}
