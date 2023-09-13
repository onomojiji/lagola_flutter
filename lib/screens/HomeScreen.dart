import 'package:flutter/material.dart';
import 'package:lagola_flutter/configs/colors.dart';
import 'package:lagola_flutter/configs/screen.dart';
import 'package:lagola_flutter/widgets/drawer.dart';
import 'package:lagola_flutter/widgets/home_product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List <String> products = [
   'burger',
    '231',
    '11'
  ];

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
    
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
        elevation: 2,
        isExtended: true,
        tooltip: "Ajouter une nouvelle vente",
      ),
      
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: largeur(context, 10), vertical: hauteur(context, 10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
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
                        )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: primaryColor, 
                            ),
                            borderRadius: BorderRadius.circular(hauteur(context, 10)),
                          ),
                          child: Container(
                            width: (screenWidth(context)/ 2) - largeur(context, 20),
                            height: hauteur(context, 70),
                            padding: EdgeInsets.symmetric(horizontal: largeur(context, 5), vertical: hauteur(context, 5)),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(hauteur(context, 10))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                    Icons.fastfood,
                                  color: primaryColor,
                                  size: hauteur(context, 25),
                                ),
                                Text(
                                    "1 978 898",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: hauteur(context, 20)
                                  ),
                                )
                              ],
                            )
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(hauteur(context, 10)),
                          ),
                          child: Container(
                              width: (screenWidth(context)/ 2) - largeur(context, 20),
                              height: hauteur(context, 70),
                              padding: EdgeInsets.symmetric(horizontal: largeur(context, 5), vertical: hauteur(context, 5)),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(hauteur(context, 10))
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.attach_money,
                                    color: primaryColor,
                                    size: hauteur(context, 25),
                                  ),
                                  Text(
                                    "1 907 830 Fcfa",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: hauteur(context, 18)
                                    ),
                                  )
                                ],
                              )
                          ),
                        ),
                      ],
                    )
                  ],
                )
            ),
            Flexible(
                flex: 10,
                child: GridView.count(
                  primary: false,
                  padding: EdgeInsets.symmetric(vertical: largeur(context, 10)),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: const <Widget>[
                    HomeProductItem(product_name: "Burger quizz", inBox: "231", outBox: "11",),
                    HomeProductItem(product_name: "Burger quizz", inBox: "231", outBox: "11",),
                    HomeProductItem(product_name: "Burger quizz", inBox: "231", outBox: "11",),
                    HomeProductItem(product_name: "Burger quizz", inBox: "231", outBox: "11",),
                    HomeProductItem(product_name: "Burger quizz", inBox: "231", outBox: "11",),
                    HomeProductItem(product_name: "Burger quizz", inBox: "231", outBox: "11",),
                    HomeProductItem(product_name: "Burger quizz", inBox: "231", outBox: "11",),
                    HomeProductItem(product_name: "Burger quizz", inBox: "231", outBox: "11",),
                    HomeProductItem(product_name: "Burger quizz", inBox: "231", outBox: "11",),
                    HomeProductItem(product_name: "Burger quizz", inBox: "231", outBox: "11",),
                  ],
                )
            ),
          ],
        ),
      ),
      
    );
  }
}
