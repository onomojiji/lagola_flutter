import 'package:flutter/material.dart';
import 'package:lagola_flutter/widgets/Items/history_item.dart';

import '../configs/colors.dart';
import '../configs/screen.dart';
import '../widgets/drawer.dart';

class HistoryScreen extends StatefulWidget {

  final String user_name, user_id, user_token;

  const HistoryScreen({super.key, required this.user_name, required this.user_id, required this.user_token});

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
      drawer: AppDrawer(
        selected: 3,
        user_id: widget.user_id,
        user_name: widget.user_name,
        user_token: widget.user_token,
      ),
      
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Center(
              child: Text(
                "Aujourd'hui 28/08/2023",
                style: TextStyle(
                  color: textBoldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: hauteur(context, 15),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Flexible(
            flex: 9,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: const [
                HistoryItem(product_name: "Burger accompagné des mitoumbas de Yabassi", imgUrl: "assets/images/burger.png", qte: 23, type: 1),
                HistoryItem(product_name: "Chignong blanc de Bakassi", imgUrl: "assets/images/burger.png", qte: 543, type: 0),
                HistoryItem(product_name: "Burger accompagné des mitoumbas de Yabassi", imgUrl: "assets/images/burger.png", qte: 93, type: 0),
                HistoryItem(product_name: "Burger accompagné des mitoumbas de Yabassi", imgUrl: "assets/images/burger.png", qte: 13, type: 1),
                HistoryItem(product_name: "Burger accompagné des mitoumbas de Yabassi", imgUrl: "assets/images/burger.png", qte: 34, type: 1)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
