import 'package:flutter/material.dart';
import 'package:lagola_flutter/configs/colors.dart';
import 'package:lagola_flutter/configs/screen.dart';
import 'package:lagola_flutter/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        elevation: 1,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white, size: hauteur(context, 20)),
        actions: [
          IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.search)
          ),
          IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.more_vert)
          )
        ],
      ),
      drawer: const AppDrawer(user_name: "Marinette de Lady Bug", user_token: "token", selected: 1, user_id: "12"),
    );
  }
}
