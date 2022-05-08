import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xkcd_demo/models/comic.dart';

class ApiHandler {
  static const String baseUrl = 'https://xkcd.com/';
  static Future<String> getExplaination(String title, int id) async {
    //replace spaces with _
    title = title.replaceAll(' ', '_');
    //add _ at the beginning
    title = '_$title';
    // https get from url
    var url =
        "https://www.explainxkcd.com/wiki/api.php?action=parse&page=$id:$title&prop=wikitext&sectiontitle=Explanation&format=json";
    // get response from url
    var response = await http.get(Uri.parse(url));
    var parsedResponse = jsonDecode(response.body);
    return parsedResponse['parse']['wikitext']['*'];
  }

  static Future<Comic> getComic(int? id) async {
    String url;
    if (id == null) {
      url = '${baseUrl}info.0.json';
    } else {
      url = '$baseUrl$id/info.0.json';
    }
    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> parsedResponse = jsonDecode(response.body);
    String explaination =
        await getExplaination(parsedResponse['title'], parsedResponse['num']);

    return Comic(
      title: parsedResponse['title'],
      imageUrl: parsedResponse['img'],
      id: parsedResponse['num'],
      explaination: explaination,
      alt: parsedResponse['alt'],
    );
  }
}
