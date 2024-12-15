import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Kitchen extends StatefulWidget {
  const Kitchen({Key? key}) : super(key: key);

  @override
  State<Kitchen> createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> {
  bool isSelected = false;
  bool door = false;
  bool fridge = false;
  bool oven = false;
  bool Fan = false;
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
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Kitchen Door',
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
                    '37.2',
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 200,
              width: 180,
              decoration: BoxDecoration(
                color: HexColor('242424'),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Row(
                children: [
                  Container(
                    height:100,
                    child: Image.asset('images/smart-fridge.png'),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Fridge',
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
                            fridge = !fridge;
                          });
                        },
                        icon: fridge?
                        Icon(Icons.power_settings_new,color: HexColor('6FC1C5'),size: 50,) :
                        Icon(Icons.power_settings_new,color: Colors.grey,size: 50,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Container(
              height: 200,
              width: 175,
              decoration: BoxDecoration(
                color: HexColor('242424'),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:100,
                    child: Image.asset('images/smart-oven.png'),
                  ),
                  SizedBox(width: 5,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Oven',
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
                            oven = !oven;
                          });
                        },
                        icon: oven?
                        Icon(Icons.power_settings_new_outlined,color: HexColor('6FC1C5'),size: 50,) :
                        Icon(Icons.power_settings_new_outlined,color: Colors.grey,size: 50,),
                      ),
                    ],
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
