import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configs/colors.dart';
import '../configs/screen.dart';
import '../services/dio.dart';

class DownloadManyPayslipsItem extends StatefulWidget {

  final int monthId, yearId, bulletin_id, periode_id, region_id;
  final String month, year, user_token;
  
  const DownloadManyPayslipsItem({Key? key, required this.monthId, required this.yearId, required this.month, required this.year, required this.bulletin_id, required this.periode_id, required this.region_id, required this.user_token}) : super(key: key);

  @override
  State<DownloadManyPayslipsItem> createState() => _DownloadManyPayslipsItemState();
}

class _DownloadManyPayslipsItemState extends State<DownloadManyPayslipsItem> {

  late bool ok = true;

  downloadBulletin(String token) async {
    try{
      var bulletin = await dio().get(
        '/fr/download/bulletin/${widget.bulletin_id}/periode/${widget.periode_id}/region/${widget.region_id}',
        options: Options(
          headers: {'Authorization' : 'Bearer $token',},
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

      var bull = bulletin.data;

      setState(() {
        ok = false;
      });


    }catch (e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      ok == true?Column(
      children: [
        SizedBox(height: hauteur(context, 10),),
        ListTile(
          title: Text(
            "Télécharger le bulletin de ${widget.month} - ${widget.year}",
            style: TextStyle(
                fontSize: hauteur(context, 15),
                color: whiteColor),
            textAlign: TextAlign.center,
          ),
          tileColor: Colors.green,
          onTap: (){
              downloadBulletin(widget.user_token);
          },
        )
      ],
    ):Center(
          child: CupertinoActivityIndicator(
            animating: true,
            color: primaryColor,
            radius: hauteur(context, 20),
          )
      );
  }
}
