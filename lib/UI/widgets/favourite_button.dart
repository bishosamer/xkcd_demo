import 'package:flutter/material.dart';
import 'package:xkcd_demo/models/comic.dart';
import 'package:xkcd_demo/prefs/shared_preferences.dart';

class FavouriteButton extends StatefulWidget {
  final Comic comic;
  const FavouriteButton({Key? key, required this.comic}) : super(key: key);

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0,
      child: IconButton(
          onPressed: () {
            setState(() {
              if (SharedPrefs.getFavouriteComicIds() == null) {
                SharedPrefs.setComic(widget.comic);
              } else {
                if (SharedPrefs.getFavouriteComicIds()!
                    .contains(widget.comic.id.toString())) {
                  SharedPrefs.removeComic(widget.comic.id.toString());
                } else {
                  SharedPrefs.setComic(widget.comic);
                }
              }
            });
          },
          icon: SharedPrefs.getFavouriteComicIds() == null
              ? const Icon(Icons.favorite_border_outlined)
              : SharedPrefs.getFavouriteComicIds()!
                      .contains(widget.comic.id.toString())
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_border_outlined,
                    )),
    );
  }
}
