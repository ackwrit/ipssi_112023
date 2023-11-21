import 'package:flutter/material.dart';
import 'package:isspi_bd3/globale.dart';

class MyProfil extends StatefulWidget {
  const MyProfil({super.key});

  @override
  State<MyProfil> createState() => _MyProfilState();
}

class _MyProfilState extends State<MyProfil> {
  //méthode
  popUp() {}
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(moi.image!),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.mail),
              SizedBox(
                width: 20,
              ),
              Text(moi.mail),
            ],
          ),
          Row(
            children: [
              Text(moi.nom),
              IconButton(
                  onPressed: () {
                    popUp();
                  },
                  icon: Icon(Icons.update))
            ],
          ),
          Text(moi.prenom),
          Text(moi.pseudo!),
        ],
      ),
    );
  }
}
