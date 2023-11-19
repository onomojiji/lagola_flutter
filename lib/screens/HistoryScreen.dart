import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lagola_flutter/widgets/Items/history_item.dart';

import '../configs/colors.dart';
import '../configs/screen.dart';
import '../services/dio.dart';
import '../widgets/LoadingIndicatorDialog.dart';
import '../widgets/drawer.dart';

class HistoryScreen extends StatefulWidget {

  final String user_name, user_id, user_token;

  const HistoryScreen({super.key, required this.user_name, required this.user_id, required this.user_token});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  late String today = "";
  late List<Widget> History = <Widget>[];

  getHistory() async {

    // open loading dialog
    LoadingIndicatorDialog().show(context);

    try{
      var responseUser = await dio().get(
        '/gethistory',
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

      var response = responseUser.data;
      
      print(response);

      setState(() {
        today = response["today"];

        for (var i = 0; i< response["commandes"].length; i++){
          History.add(
            HistoryItem(
              product_name: response["commandes"][i]["name"],
              imgUrl: "assets/images/burger.png",
              qte: response["commandes"][i]["quantity"],
              type: 1,
              date: response["commandes"][i]["date"],
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {getHistory();});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historiques"),
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
            ),
          ),
          Flexible(
            flex: 9,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: History,
            ),
          ),
        ],
      ),
    );
  }
}
