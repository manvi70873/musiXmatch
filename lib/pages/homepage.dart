import 'dart:async';
import 'dart:math' as math;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music/model/classmodel.dart';
import 'package:music/pages/page2.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class Myapifile extends StatefulWidget {
  //final String entercity;
  const Myapifile({ Key? key,/*required this.entercity */}) : super(key: key);

  @override
  _MyapifileState createState() => _MyapifileState(/*entercity*/);
}

class _MyapifileState extends State<Myapifile> {
 
  Future<Classmodel> getProductsApi () async {
     String apiurl='https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=906abc196cc495b48ee9ea76dcbc9fb8';
     final response = await http.get(Uri.parse(apiurl));
     var data = jsonDecode(response.body.toString());
     if(response.statusCode == 200){
       return Classmodel.fromJson(data);
     }else {
       return Classmodel.fromJson(data);

     }
  }



  Widget updateTempwidget (){
    return FutureBuilder<Classmodel>(
      future: getProductsApi(),
      builder: ( context, snapshot){
        if(snapshot.hasData){
          //var iconcode=content!['weather'][0]['icon'];
          return 
          // Center(
          //   child: Text(content!['message']['body']['track_list']['track']['track_name'].toString(),style: TextStyle(color: Colors.white),),
          // );
          ListView.builder(
        itemCount: snapshot.data?.message?.body?.trackList?.length,
        itemBuilder: (context,index){
           var item= snapshot.data?.message?.body?.trackList?[index].track?.trackName;
           var item2=snapshot.data?.message?.body?.trackList?[index].track?.artistName;
           var item5=snapshot.data?.message?.body?.trackList?[index].track?.trackId;
           return Card(
            color: Colors.deepPurple,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.all(
         Radius.circular(16.0),
       ),
     ),
             child: ListTile(
              horizontalTitleGap: 40.0,
              title: Text(item.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
              subtitle: Text(item2.toString(),style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Page2(id: item5!.toInt(),)));
              },
             ),
           );
        }
        );
        
        
        }
        else{
          return Center(
         child: CircularProgressIndicator(
          color: Colors.deepPurple,
         ),
         );
        }
      }
    );
  }
          
          
          
     

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title: Text('musiXmatch'),
        centerTitle: true,
      ),

      body: updateTempwidget(),
    ),
    );
  }


  
}

