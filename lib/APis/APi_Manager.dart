/*
c9982c89a71df99ded8f7e0e8824ec52
class apiconstant{
static String authority = "newsapi.org" ;
static String unencodedPath = "/v2/top-headlines/sources" ;
static String newspath = "/v2/everything" ;

*/
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/Models/Movies.dart';

class Apimanager {
  static Future<HeaderResponse> FetchDataFromHeader() async {
    final apiKey = 'c9982c89a71df99ded8f7e0e8824ec52';

    final url = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';

    const token =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjOTk4MmM4OWE3MWRmOTlkZWQ4ZjdlMGU4ODI0ZWM1MiIsInN1YiI6IjY1ZmM0ODNkNjA2MjBhMDE3YzI3NjYxOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cjGBOJbu1GhkN3MQs068ole-QWPFdY9y-s4iAWXG2Q8 ';

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );
      var bodystring = response.body;
      var json = jsonDecode(bodystring);
      return HeaderResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
