
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WordTime{
  String location;
  String time; //time at location
  String flag;// url too bandeira
  String url; //location url for api endpont
  bool isDaytime;
 WordTime({this.location,this.flag,this.url});


  Future <void> getTime() async{
    try{
      Response response = await get ('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print('');
      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);


      //creat DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours:int.parse(offset)));

      //set time
      if(now.hour>6 && now.hour<20){isDaytime = true;}
      else {isDaytime=false;}
      time = DateFormat.jm().format(now);
      print(time);

    }
    catch(e){
      print('erro encontrado: $e');
      time = 'nao pode retornar a data';
    }



  }
}