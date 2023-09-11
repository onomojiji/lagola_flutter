import 'package:flutter/material.dart';

import '../configs/colors.dart';
import '../configs/screen.dart';
import '../widgets/drawer.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historiques"),
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
      drawer: const AppDrawer(user_id: "12", selected: 3, user_token: "token", user_name: "Marinette de lady bug"),
    );
  }
}
