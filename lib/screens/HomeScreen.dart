import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagola_flutter/configs/colors.dart';
import 'package:lagola_flutter/configs/screen.dart';
import 'package:lagola_flutter/screens/NewSellScreen.dart';
import 'package:lagola_flutter/widgets/drawer.dart';

import '../services/dio.dart';
import '../widgets/Items/home_product_item.dart';
import '../widgets/LoadingIndicatorDialog.dart';

class HomeScreen extends StatefulWidget {

  final String user_name, user_id, user_token;

  const HomeScreen({super.key, required this.user_name, required this.user_id, required this.user_token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late String today = "";
  late String allProducts = "";
  late String allSumProductPrice = "";
  late List<Widget> productList = <Widget>[];

  getHome() async {

    // open loading dialog
    LoadingIndicatorDialog().show(context);

    try{
      var responseUser = await dio().get(
        '/home',
        options: Options(
          headers: {'Authorization' : 'Bearer ${widget.user_token}',},
          responseType: ResponseType.json,
          validateStatus: (statusCode) {
            if(statusCode == null){
              return false;
            }if(statusCode == 404){
              return true;
            }else{
              return statusCode >= 200 && statusCode < 300;
            }
          },
        ),
      );

      var response = responseUser.data["data"];

      setState(() {
        today = response["today"];
        allProducts = response["allProducts"];
        allSumProductPrice = response["allSumProductPrice"];

        var allProductsToday = response["allProductsToday"];

        for (var i = 0; i< allProductsToday.length; i++){
          productList.add(
            HomeProductItem(
              user_token: widget.user_token,
              id: allProductsToday[i]["id"],
              product_name: allProductsToday[i]["name"],
              inBox: '${allProductsToday[i]["inStock"]}',
              outBox: '${allProductsToday[i]["outStock"]}',
            ),
          );
        }

      });

      // close loading dialog
      LoadingIndicatorDialog().dismiss();

    }catch (e){
      print(e);
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {getHome();});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accueil"),
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
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => NewSellScreen(user_token: widget.user_token,), fullscreenDialog: true));
          },
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
      drawer: AppDrawer(
          user_id: widget.user_id,
          user_name: widget.user_name,
          user_token: widget.user_token,
          selected: 1,),
      
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
                              "Aujourd'hui $today",
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
                                    allProducts,
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
                                    allSumProductPrice,
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
                flex: 8,
                child: GridView.count(
                  primary: false,
                  padding: EdgeInsets.symmetric(vertical: largeur(context, 10)),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: productList,
                )
            ),
          ],
        ),
      ),
      
    );
  }
}
