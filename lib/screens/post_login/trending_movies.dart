import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../routing_screens/details.dart';

class Treading_Movies extends StatelessWidget {
  final List trending;

  const Treading_Movies({ required this.trending});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Trending movies',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {

                        if(trending[index]['title'] != null){

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Movie_Details(
                                    name: trending[index]['title'],
                                    bannerurl:
                                    'https://image.tmdb.org/t/p/w500' +
                                        trending[index]['backdrop_path'],
                                    posterurl:
                                    'https://image.tmdb.org/t/p/w500' +
                                        trending[index]['poster_path'],
                                    description: trending[index]['overview'],
                                    vote: trending[index]['vote_average']
                                        .toString(),
                                    launch_on: trending[index]
                                    ['release_date'],
                                  )));

                        }else{

                          Fluttertoast.showToast(
                              msg: "Details Not Found.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );

                        }


                      },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              child:FadeInImage.assetNetwork(
                                placeholder: 'Images/loading.gif',
                                image: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: trending[index]['title'],
                                  style: TextStyle(color: Colors.white, fontSize: 10),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
