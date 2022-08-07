import 'package:flutter/material.dart';

class Tele_shows extends StatelessWidget {
  final List? tv;

  const Tele_shows({ required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              text: 'Popular Television shows',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            // color: Colors.red,
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(5),
                      // color: Colors.green,
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'Images/loading.gif',
                              image: 'https://image.tmdb.org/t/p/w500' + tv?[index]['backdrop_path'],
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                text: "Most Views",
                                style: TextStyle(color: Colors.white, fontSize: 10),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
