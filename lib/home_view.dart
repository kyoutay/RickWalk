import 'package:flutter/material.dart';
import 'user_location.dart';
import 'package:provider/provider.dart';
import'location_service.dart';
import 'about.dart';
import 'bit_icons.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:bordered_text/bordered_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>{
  List<String> subject = ['RICK ASTLEYS', 'SPONGEBOBS', 'GNOMES', 'GOATS', 'KOOL-AID MAN', 'CHICKENS', 'HOTDOGS', 'DOLLARS'];
  bool start = true, stop = true;
  double x = 1.86;
  static int subInc = 0;
  final player = AudioCache();

  void changeMetric(){
    setState(() {
      if (subInc == 4) {
        subInc = 0;
      } else {
        subInc++;
      }
    });
  }

  void theAns() {
    setState(() {
      if (subInc == 0) {
        player.play('rick_sound.mp3');
        x =  1.86;
      } else if (subInc == 1) {
        player.play('Spongebob_Laughing.mp3');
        x =  0.1016;
      } else if (subInc == 2) {
        player.play('gnomed.mp3');
        x = .45;
      } else if (subInc == 3) {
        player.play('goat_ree.mp3');
        x = 1;
      } else if (subInc == 4) {
        player.play('SLURP_PP.mp3');
        x = 1.8288;
      } else if (subInc == 5){
        player.play('Chicken.mp3');
        x =  0.4;
      } else if(subInc == 6){
        player.play('sizzle_effect.mp3');
        x =  0.15;
      } else if(subInc == 7){
        player.play('CHACHING.mp3');
        x =  0.1561;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Scaffold(
      appBar: new AppBar(
          centerTitle: true,
          title: BorderedText(
            strokeWidth: 6,
            child: Text(
              'RICKWALK',
              style: TextStyle(
                fontFamily: '8-bit',
                fontSize: 22,
                color: Colors.blue,
                decorationColor: Colors.yellow,
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                  Icons.info,
                  color: Colors.black
              ),
              onPressed:(){
                Navigator.pushReplacement(context, new MaterialPageRoute(
                    builder: (context) => about()
                ));
              },
            ),
          ],
          backgroundColor: Colors.orange,
      ),
      body: Container(
        alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/warakumunny.png"),
              fit: BoxFit.cover,
            ),
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'YOU HAVE WALKED: ',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: '8-bit',
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 40),
              Text(
                  start ? '0.0' : '${(LocationService.fin / x).toStringAsFixed(3)}',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: '8-bit',
                    color: Colors.white,
                  )
              ),
              Text(
                subject[subInc],
                style: TextStyle(
                  fontFamily: '8-bit',
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 40),
              FlatButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                color: start ? Colors.green : Colors.red,
                child:  stop ? Text("START", style: TextStyle(fontFamily: '8-bit')) : Text("RESET", style: TextStyle(fontFamily: '8-bit')),
                onPressed: () {
                  setState(() {
                    start = !start;
                    LocationService.fin = 0;
                  });
                },
              ),
            ],
          )
      ),
      floatingActionButton: MaterialButton(
        enableFeedback: false,
        color: Colors.orange,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.black)
        ),
        child: Icon(Custom.arrow, size: 55, color: Colors.blue),
        onPressed: (){
          changeMetric();
          theAns();
        },
      ),
      backgroundColor: Colors.blue[600]
    );
  }
}