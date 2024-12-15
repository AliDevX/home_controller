import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BedRoom extends StatefulWidget {
  const BedRoom({Key? key}) : super(key: key);

  @override
  State<BedRoom> createState() => _BedRoomState();
}

class _BedRoomState extends State<BedRoom> {
  bool isSelected = false;
  bool light1 = false;
  bool door = false;
  bool Fan = false;
  bool speaker = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Container(
              height: 150,
              width: 240,
              decoration: BoxDecoration(
                color: HexColor('242424'),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Row(
                children: [
                  Container(
                    height:120,
                    child: Image.asset('images/smart-door.png'),
                  ),
                  SizedBox(width: 1,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'BedRoom Door',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            door = !door;
                          });
                        },
                        icon: door?
                        Icon(Icons.toggle_on,color: HexColor('6FC1C5'),size: 50,) :
                        Icon(Icons.toggle_off,color: Colors.grey,size: 50,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Container(
              height: 150,
              width: 116,
              decoration: BoxDecoration(
                color: HexColor('242424'),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                  Text('Temperature',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '33.5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontFamily: 'Oxanium',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'celsius',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Container(
          height: 150,
          width: 70,
          decoration: BoxDecoration(
            color: HexColor('242424'),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Image.asset('images/air-conditioner.png'),
              ),
              SizedBox(width: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Air Conditioner',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      setState(() {
                        Fan = !Fan;
                      });
                    },
                    icon: Fan?
                    Icon(Icons.toggle_on,color: HexColor('6FC1C5'),size: 50,) :
                    Icon(Icons.toggle_off,color: Colors.grey,size: 50,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
