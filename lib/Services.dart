
import 'package:http/http.dart' as http;
import 'package:http/http.dart' ;


import 'package:providerstatemanagementflutter/Album.dart';

class Services{
  static const String BASE_URL ="http://jsonplaceholder.typicode.com/albums";
  static const GET_ALBUM= "/albums";

static Future<List<Album>> getAlbum() async {
  try{
    // Uri uri= Uri.https(BASE_URL, GET_ALBUM);
    // http.Response response = await http.get(BASE_URL+GET_ALBUM);
    http.Response response = await http.get(BASE_URL);
    if(response.statusCode == 200) {

      return albumFromJson(response.body);
    }else {
      return List<Album>();
    }
  }catch(e){
    throw e;
  }
 }
}