import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty ? data :ModalRoute.of(context).settings.arguments;
    print(data);

    //set background
    String bgImage ;
    Color bgcolor;
    if(data['isDaytime']==true){bgImage = 'ascension_day.jpg';bgcolor=Colors.blue;}
    else{bgImage='night.jpg';bgcolor=Colors.indigo[700];}


    return Scaffold(
     backgroundColor: bgcolor,
      body:SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:  AssetImage('img/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0,150,0,0),
          child:Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location',arguments: {
                      'location': data['location']
                    });
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location' : result['location'],
                        'isDaytime' : result['isDaytime'],
                        'flag' : result ['flag']
                      };
                    });
                  },
                  icon: Icon(
                      Icons.edit_location,
                    color: Colors.grey[700],
                  ),
                  label:Text(
                      'Edit Location',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                  ),

              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2,
                        color: Colors.grey[700],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 66.0,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
