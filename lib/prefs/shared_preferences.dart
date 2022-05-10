import 'package:shared_preferences/shared_preferences.dart';
import 'package:xkcd_demo/models/comic.dart';

class SharedPrefs {
  static late SharedPreferences prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static List<Comic> getFavouriteComics() {
    // get comic from shared prefs
    List<String>? comicIds = prefs.getStringList('ids');
    if (comicIds == null) {
      return [];
    }
    List<Comic> comics = [];
    for (String id in comicIds) {
      comics.add(getComic(id)!);
    }
    return comics;
  }

  static List<String>? getFavouriteComicIds() {
    // get comic from shared prefs
    return prefs.getStringList('ids');
  }

  static Comic? getComic(String id) {
    // get comic from shared prefs
    List<String>? savedText = prefs.getStringList(id);
    if (savedText == null) {
      return null;
    }
    return Comic(
      title: savedText[0],
      imageUrl: savedText[1],
      id: int.parse(id),
      explaination: savedText[3],
      alt: savedText[4],
    );
  }

  static void removeComic(String id) {
    // get comic from shared prefs
    prefs.remove(id);
    //remove id from idlist
    List<String>? comicIds = prefs.getStringList('ids');
    if (comicIds == null) {
      return;
    }
    comicIds.remove(id);
    prefs.setStringList('ids', comicIds);
  }

  static void saveId(int id) {
    // save id to shared prefs
    List<String>? ids = prefs.getStringList('ids');

    ids ??= [];
    ids.add(id.toString());
    prefs.setStringList('ids', ids);
  }

  static void setComic(Comic comic) {
    saveId(comic.id);
    prefs.setStringList(comic.id.toString(), [
      comic.title,
      comic.imageUrl,
      comic.id.toString(),
      comic.explaination,
      comic.alt,
    ]);
  }
}
