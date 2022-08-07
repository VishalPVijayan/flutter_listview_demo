import 'package:flutter/material.dart';

class Top_Movies extends StatelessWidget {
  final List toprated;

  const Top_Movies({ required this.toprated});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Top Movies',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toprated.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        child: Column(
                          children: [
                            Container(
                              height: 180,
                              child: FadeInImage.assetNetwork(
                                placeholder: 'Images/loading.gif',
                                image: 'https://image.tmdb.org/t/p/w500' + toprated[index]?['poster_path'],
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: toprated[index]['title'],
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