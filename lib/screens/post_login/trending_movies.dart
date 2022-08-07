import 'package:flutter/material.dart';

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
