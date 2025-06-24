import 'package:flutter/material.dart';
import 'package:gamify_learning_ui/data.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _deviceHeight;
  late double _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    _deviceWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: Stack(
        children: [
          _featuredGamesWidget(),
          _gradientBoxWidget(),
          _topLayerWidget()
          // Ajoutez d'autres widgets ici si nécessaire
        ],
      ),
    );
  }

  Widget _featuredGamesWidget() {
    return SizedBox(
        height: _deviceHeight * 0.5,
        width: _deviceWidth,
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: featuredGames.map((game) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(featuredGames[0].coverImage.url),
                  fit: BoxFit.cover, // Pour adapter l'image au conteneur
                ),
              ),
            );
          }).toList(),
        )
    );
  }

  Widget _gradientBoxWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _deviceHeight * 0.80, width: _deviceWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(35, 45, 59, 1.0),
              Colors.transparent
            ],
                stops: [0.65, 1.0],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
            )
        ),

      ),
    );
  }


  Widget _topLayerWidget(){
    return Padding(padding: EdgeInsets.symmetric( horizontal: _deviceWidth * 0.05,vertical:_deviceHeight * 0.005 ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget> [
           _topBarWidget()
         ],
      ),
    );
  }

  Widget _topBarWidget() {
    return SizedBox(
      height: _deviceHeight * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: _deviceWidth * 0.03,
              ),
              Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 30,
              ),
            ],
          )
        ],
      ),
    );
  }


}