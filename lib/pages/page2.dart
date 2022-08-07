import 'package:flutter/material.dart';
import 'package:music/model/classmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:math' as math;
import 'dart:convert';

import 'package:music/model/type_b_api.dart';
import 'package:music/model/type_c_api.dart';

class Page2 extends StatefulWidget {
  int id;
   Page2({super.key,required this.id});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {


   Future<TypeBApi> getProductsApi2 () async {
    //https://api.musixmatch.com/ws/1.1/track.get?track_id=TRACK_ID&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7
     String apiurl='https://api.musixmatch.com/ws/1.1/track.get?track_id=$id&apikey=906abc196cc495b48ee9ea76dcbc9fb8';
     final response = await http.get(Uri.parse(apiurl));
     var data = jsonDecode(response.body.toString());
     if(response.statusCode == 200){
       return TypeBApi.fromJson(data);
     }else {
       return TypeBApi.fromJson(data);

     }
  }





Future<TypeCApi> getProductsApi3 () async {
    //https://api.musixmatch.com/ws/1.1/track.get?track_id=TRACK_ID&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7
     String apiurl='https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$id&apikey=906abc196cc495b48ee9ea76dcbc9fb8';
     final response = await http.get(Uri.parse(apiurl));
     var data = jsonDecode(response.body.toString());
     if(response.statusCode == 200){
       return TypeCApi.fromJson(data);
     }else {
       return TypeCApi.fromJson(data);

     }
  }


  
  late int id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id=widget.id;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Track Details'),
    ),
    body: SingleChildScrollView(
      child: FutureBuilder<TypeBApi>(
        future: getProductsApi2(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("NAME",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
              Text(snapshot.data!.message!.body!.track!.trackName.toString(),style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(
                height: 20,
              ),
              Text("ARTIST NAME",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
              Text(snapshot.data!.message!.body!.track!.artistName.toString(),style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(
                height: 20,
              ),
              Text("ALBUM NAME",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
              Text(snapshot.data!.message!.body!.track!.albumName.toString(),style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(
                height: 20,
              ),
              Text("RATING",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
              Text(snapshot.data!.message!.body!.track!.trackRating.toString(),style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 18),),
      
              SizedBox(
                height: 20,
              ),
              Text("LYRICS",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
              FutureBuilder<TypeCApi>(
        future: getProductsApi3(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Text(snapshot.data!.message!.body!.lyrics!.lyricsBody!,style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 18),);
          }
          else{
            return Center(
           child: CircularProgressIndicator(
            color: Colors.deepPurple,
           ),
           );
          }
        }
              )
            ],
          ),
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
      ),
    ),
    );
  }
}
