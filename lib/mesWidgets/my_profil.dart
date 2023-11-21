import 'package:flutter/material.dart';

class MyProfil extends StatefulWidget {
  const MyProfil({super.key});

  @override
  State<MyProfil> createState() => _MyProfilState();
}

class _MyProfilState extends State<MyProfil> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
                "http://www.captain-drive.com/wp-content/uploads/2014/12/bugatti-veyron.jpeg"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.mail),
              SizedBox(
                width: 20,
              ),
              Text("adresse mail"),
            ],
          ),
          Text("nom de la personne"),
          Text("prenom de la personne"),
          Text("pseudo de la personne"),
        ],
      ),
    );
  }
}
