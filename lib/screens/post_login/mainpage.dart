import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/post_login/top_movies.dart';
import 'package:flutterdemo/screens/post_login/trending_movies.dart';
import 'package:flutterdemo/screens/post_login/tv_shows.dart';
import 'package:flutterdemo/screens/pre_login/loginscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../utilities/string_constants.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final String apikey = '67af5e631dcbb4d0981b06996fcd47bc';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2N2FmNWU2MzFkY2JiNGQwOTgxYjA2OTk2ZmNkNDdiYyIsInN1YiI6IjYwNzQ1OTA0ZjkyNTMyMDAyOTFmZDczYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C_Bkz_T8OybTGo3HfYsESNjN46LBYdw3LHdF-1TzYYs';
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title:
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Image.asset(
                    'Images/hutechlogo.png',
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  )
                ),
                TextSpan(
                  text: "  Hutech Movies",
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          children: [
            Tele_shows(tv: tv),
            Treading_Movies(trending: trendingmovies,),
            Top_Movies(toprated: topratedmovies,),
            Treading_Movies(trending: trendingmovies,),
            ElevatedButton(
              child: Text(StringConstants.logout),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () {

                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Login(),
                    ),
                  );

                  Fluttertoast.showToast(
                      msg: "Logged Out",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );


              },
            ),
          ],
        ));
  }
}