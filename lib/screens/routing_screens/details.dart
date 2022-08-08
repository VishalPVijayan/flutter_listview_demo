import 'package:flutter/material.dart';
import 'package:flutterdemo/utilities/colors.dart';

class Movie_Details extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Movie_Details(
      {
        required this.name,
        required this.description,
        required this.bannerurl,
        required this.posterurl,
        required this.vote,
        required this.launch_on});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ])),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.all(10),
              child: RichText(
                text: TextSpan(
                  text: name != null ? name : 'Not Loaded',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )

          ),
          Container(
              child: new ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  new ElevatedButton(
                    child: new Icon(Icons.download,size: 12.0),
                    onPressed: () {
                    },
                  ),
                  new ElevatedButton(
                    child: new Icon(Icons.play_arrow_outlined,size: 12.0),
                    onPressed: () {
                  },
                  ),
                  new ElevatedButton(
                    child: new Icon(Icons.favorite,size: 12.0,color: AppColors.red),
                    onPressed: () {
                    },
                  ),

                ],
              ),


          ),
          Container(
              padding: EdgeInsets.only(left: 10),
              child:
              RichText(
                text: TextSpan(
                  text: 'Releasing On - ' + launch_on,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
          ),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child:

                    RichText(
                      text: TextSpan(
                          text: '' + description,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          children: <TextSpan>[
                          ]
                      ),
                    )
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
