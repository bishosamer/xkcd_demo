import 'package:flutter/material.dart';
import 'package:xkcd_demo/UI/widgets/comic_tile.dart';
import 'package:xkcd_demo/UI/widgets/global_drawer.dart';
import 'package:xkcd_demo/models/comic.dart';
import 'package:xkcd_demo/prefs/shared_preferences.dart';

class FavouriteComicBrowser extends StatelessWidget {
  const FavouriteComicBrowser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const GlobalDrawer(),
      appBar: AppBar(
        title: const Text('Favourite Comics'),
      ),
      body: ListView.builder(
          itemCount: SharedPrefs.getFavouriteComics().isNotEmpty
              ? SharedPrefs.getFavouriteComics().length
              : 1,
          itemBuilder: (context, index) {
            Comic comic = SharedPrefs.getFavouriteComics().elementAt(index);
            if (SharedPrefs.getFavouriteComics().isEmpty) {
              return const Text('No favourites yet!');
            } else {
              return ComicTile(comic: comic);
            }
          }),
    );
  }
}
