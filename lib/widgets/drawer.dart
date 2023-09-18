import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagola_flutter/configs/colors.dart';
import 'package:lagola_flutter/screens/HistoryScreen.dart';
import 'package:lagola_flutter/screens/SupplyScreen.dart';
import 'package:lagola_flutter/screens/SupplyScreen.dart';

import '../configs/screen.dart';
import '../screens/HomeScreen.dart';
import '../screens/LoginScreen.dart';
import '../services/dio.dart';
import 'loading.dart';

class AppDrawer extends StatefulWidget {

  final String user_id, user_name, user_token;
  final int selected;

  const AppDrawer({super.key, required this.user_name, required this.user_token, required this.user_id, required this.selected,});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  logout() {
      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      backgroundColor: primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 4,
              child: Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Colors.white
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: largeur(context, 10), vertical: hauteur(context, 10)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top : hauteur(context, 20)),
                        child: CircleAvatar(
                            radius: hauteur(context, 60),
                            backgroundColor: iconBackColor,
                            child: const Image(image: AssetImage("assets/images/logo_lagola.png"))
                        ),
                      ),

                      Expanded(
                        child: Text(
                          widget.user_name,
                          style: TextStyle(
                              color: textGreyColor,
                              fontSize: hauteur(context, 20),
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          logout();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          primary: Colors.red,
                          minimumSize: const Size.fromHeight(45),
                        ),
                        child: const Text("Se déconnecter"),
                      )
                    ],
                  ),
                ),
              )
          ),
          Flexible(
            flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex : 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.selected == 1? ListTile(
                          leading: const Icon(Icons.home),
                          title: const Text("Accueil"),
                          selected: true,
                          selectedTileColor: Colors.orange,
                          selectedColor: Colors.white,
                          onTap: (){
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => HomeScreen())));
                          },
                        ) : ListTile(
                          leading: const Icon(Icons.home),
                          title: const Text("Accueil"),
                          textColor: Colors.white,
                          iconColor: Colors.white,
                          onTap: (){
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => HomeScreen())));
                          },
                        ),
                        widget.selected == 2? ListTile(
                          leading: const Icon(Icons.inventory_rounded),
                          title: const Text("Inventaires"),
                          selected: true,
                          selectedTileColor: Colors.orange,
                          selectedColor: Colors.white,
                          onTap: (){
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => SupplyScreen())));
                          },
                        ) : ListTile(
                          leading: const Icon(Icons.inventory_rounded),
                          title: const Text("Inventaires"),
                          textColor: Colors.white,
                          iconColor: Colors.white,
                          onTap: (){
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => SupplyScreen())));
                          },
                        ),
                        widget.selected == 3 ? ListTile(
                          leading: const Icon(Icons.history),
                          title: const Text("Historiques"),
                          selected: true,
                          selectedTileColor: Colors.orange,
                          selectedColor: Colors.white,
                          onTap: (){
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => HistoryScreen())));
                          },
                        ) : ListTile(
                          leading: const Icon(Icons.history),
                          title: const Text("Historiques"),
                          textColor: Colors.white,
                          iconColor: Colors.white,
                          onTap: (){
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => HistoryScreen())));
                          },
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex : 1,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                                  "Copyright © 2023 LAGOLA, Tous droits reservés.",
                                  style: TextStyle(
                                      fontSize: hauteur(context, 10),
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                            ),
                            Expanded(
                              child: Text(
                                "by: _inimini",
                                style: TextStyle(
                                    fontSize: hauteur(context, 10),
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}
