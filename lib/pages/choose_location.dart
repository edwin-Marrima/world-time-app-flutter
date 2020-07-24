import 'package:flutter/material.dart';
import 'package:mobile/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  Map dados = {};
List <WordTime> locations = [
WordTime(location:'Maputo',flag: 'Moz.png',url: 'Africa/Maputo'),
  WordTime(location:'Luanda',flag: 'Angola.png',url: 'Africa/Luanda'),
  WordTime(location:'Bruxelas',flag: 'Belgium.jpg',url: 'Europe/Bruxelas'),
  WordTime(location:'Brazil',flag: 'Brazil.png',url: 'America/Brasilia'),
  WordTime(location:'Cairo',flag: 'Egypt.png',url: 'Africa/Cairo'),
  WordTime(location:'Mexico',flag: 'Mexico.png',url: 'America/Brasilia'),
  WordTime(location:'Dodoma',flag: 'Tanzania.jpg',url: 'Africa/Dodoma'),
  WordTime(location:'Washingthon',flag: 'USA.jpg',url: 'Africa/Washington')
];
verifica(int index){
  Color color=Colors.black;
  if (dados['location']==locations[index].location){color = Colors.amber;}
  else{color = Colors.black;}
  return color;
}
void updateTime(index) async{
  WordTime instance = locations[index];
  await instance.getTime();
  //navegate to home screen
  Navigator.pop(context,{
    'location': instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'isDaytime':instance.isDaytime
  });

}
  @override
  Widget build(BuildContext context) {

   dados = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location') ,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 4),
              child: Card(

                child: ListTile(
                  onTap: (){
                   updateTime(index);
                  },
                  title: Text(
                    locations[index].location,
                   style: TextStyle(
                    color: verifica(index)
                  ),
                  ),

                  leading: CircleAvatar(
                    backgroundImage: AssetImage('img/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
