import 'package:flutter/material.dart';
import 'package:lagola_flutter/widgets/Items/Supply_product_item.dart';
import 'package:lagola_flutter/widgets/drawer.dart';

import '../configs/colors.dart';
import '../configs/screen.dart';

class SupplyScreen extends StatefulWidget {
  const SupplyScreen({super.key});

  @override
  State<SupplyScreen> createState() => _SupplyScreenState();
}

class _SupplyScreenState extends State<SupplyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventaires"),
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
      drawer: const AppDrawer(user_id: "12", selected: 2, user_token: "token", user_name: "Marinette de lady bug"),
    
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: hauteur(context, 10)),
        child: Column(
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
              flex : 9,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: const [
                  SupplyProductItem(product_name: "Burger des blancs avec vanille accompagné de la crème", imgUrl: "assets/images/burger.png", count: 3892),
                  SupplyProductItem(product_name: "Burger des noirs", imgUrl: "assets/images/burger.png", count: 23),
                  SupplyProductItem(product_name: "Burger des blancs avec vanille accompagné de la crème", imgUrl: "assets/images/burger.png", count: 12),
                  SupplyProductItem(product_name: "Burger des blancs avec vanille accompagné de la crème", imgUrl: "assets/images/burger.png", count: 3892),
                  SupplyProductItem(product_name: "Burger des blancs avec vanille accompagné de la crème", imgUrl: "assets/images/burger.png", count: 3892),
                  SupplyProductItem(product_name: "Burger des blancs avec vanille accompagné de la crème", imgUrl: "assets/images/burger.png", count: 3892),
                  SupplyProductItem(product_name: "Burger des blancs avec vanille accompagné de la crème", imgUrl: "assets/images/burger.png", count: 3892),
                  SupplyProductItem(product_name: "Burger des blancs avec vanille accompagné de la crème", imgUrl: "assets/images/burger.png", count: 3892),
                  SupplyProductItem(product_name: "Burger des blancs avec vanille accompagné de la crème", imgUrl: "assets/images/burger.png", count: 3892),
                  SupplyProductItem(product_name: "Burger des blancs avec vanille accompagné de la crème", imgUrl: "assets/images/burger.png", count: 3892),
                  SupplyProductItem(product_name: "Burger des blancs avec vanille accompagné de la crème", imgUrl: "assets/images/burger.png", count: 3892),
                  SupplyProductItem(product_name: "Burger des blancs avec vanille accompagné de la crème", imgUrl: "assets/images/burger.png", count: 3892),
                  SupplyProductItem(product_name: "Burger des blancs avec vanille accompagné de la crème", imgUrl: "assets/images/burger.png", count: 3892),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
