import 'package:flutter/material.dart';
import 'package:isspi_bd3/mesWidgets/my_animation.dart';
import 'package:isspi_bd3/view/my_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  //image
                  MyAnimation(
                    time: 1,
                    child: Image.network(
                        "https://get.wallhere.com/photo/sports-car-vehicle-photography-supercars-yellow-Lamborghini-Lamborghini-Aventador-Canon-California-Lamborghini-Gallardo-sports-car-performance-car-symbolic-flickr-wheel-cars-amazing-auto-tumblr-automobile-rim-series-supercar-socal-canoneos5dmarkiii-automotive-automotivated-davidcoynephotography-land-vehicle-automotive-design-automotive-exterior-race-car-luxury-vehicle-motor-vehicle-automotive-wheel-system-870390.jpg"),
                  ),

                  //champs des mails

                  MyAnimation(
                    time: 2,
                    child: TextField(
                        controller: mail,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.amber,
                            prefixIcon: Icon(Icons.mail),
                            hintText: "Entrer un mail",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)))),
                  ),

                  //champs du mot de passe
                  const SizedBox(height: 10),

                  MyAnimation(
                    time: 3,
                    child: TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.amber,
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Entrer un password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)))),
                  ),
                  const SizedBox(height: 10),

                  // bouton
                  MyAnimation(
                    time: 4,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyDashBoard()));
                        },
                        child: Text("Connexion")),
                  )
                ]))) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}