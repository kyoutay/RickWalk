import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:walkmoney/home_view.dart';
import 'bit_icons.dart';
import 'dart:math' as math;


class about extends StatelessWidget {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        leading: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: new IconButton(icon: new Icon(Custom.arrow, size: 50),
              onPressed: (){
                Navigator.pushReplacement(context, new MaterialPageRoute(
                    builder: (context) => HomeView()
                ));
              }
          ),
        ),
        title: Text('About', style: TextStyle(fontFamily: '8-bit', color: Colors.white)),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('Kyle Thai',
                style: TextStyle(color: Colors.greenAccent[400], fontFamily: '8-bit', fontSize: 15),
              ),
              subtitle: Text('Software and Development',
                style: TextStyle(
                    color: Colors.pinkAccent, fontFamily: '8-bit'),
              ),
              onTap: (){
                launch('https://www.youtube.com/watch?v=5F_Kj5xgAcg');
              },
            ),
            ListTile(
              title: Text('Kyle Lam',
                style: TextStyle(color: Colors.blue, fontFamily: '8-bit', fontSize: 15),
              ),
              subtitle: Text('Product Management and Graphic Design',
                style: TextStyle(
                    color: Colors.pinkAccent, fontFamily: '8-bit'),
              ),
              onTap: (){
                launch('https://www.youtube.com/watch?v=dQw4w9WgXcQ');
              },
            ),
            ListTile(
              title: Text('Sam Chen',
                style: TextStyle(color: Colors.indigo, fontFamily: '8-bit', fontSize: 15),
              ),
              subtitle: Text('Marketing',
                style: TextStyle(
                    color: Colors.pinkAccent, fontFamily: '8-bit'),
              ),
              onTap: (){
                launch('https://www.youtube.com/watch?v=rgZ8arxkFXY');
              },
            ),
            ListTile(
              title: Text('Ray An',
                style: TextStyle(color: Colors.orange[400], fontFamily: '8-bit', fontSize: 15),
              ),
              subtitle: Text('Sound FX',
                style: TextStyle(
                    color: Colors.pinkAccent, fontFamily: '8-bit'),
              ),
              onTap: (){
                launch('https://www.youtube.com/watch?v=d1YBv2mWll0');
              },
            ),
            ListTile(
              title: Text('Version',
                style: TextStyle(color: Colors.yellow, fontFamily: '8-bit'),
              ),
              subtitle: Text('1.0.0',
                style: TextStyle(color: Colors.pinkAccent, fontFamily: '8-bit'),
              ),
              onTap:(){},
            ),
            ListTile(
              title: Text('Privacy Policy',
                style: TextStyle(color: Colors.red, fontFamily: '8-bit'),
              ),
              trailing: IconButton(
                icon: Icon(Custom.arrow, size: 50, color: Colors.redAccent),
                onPressed:(){
                  launch('https://github.com/kyoutay/RickWalk/blob/master/README.md');
                },
              ),
              onTap:(){
                launch('https://github.com/kyoutay/RickWalk/blob/master/README.md');
              },
            ),
          ],
        ).toList(),
      ),
      backgroundColor: Colors.pink[200],
    );
  }
}
