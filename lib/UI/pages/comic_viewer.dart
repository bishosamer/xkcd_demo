import 'package:flutter/material.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:xkcd_demo/UI/widgets/favourite_button.dart';
import 'package:xkcd_demo/models/comic.dart';

class ComicViewer extends StatelessWidget {
  const ComicViewer({Key? key, required this.comic}) : super(key: key);
  final Comic comic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(comic.title),
        actions: [
          FavouriteButton(comic: comic),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Hero(
              tag: comic.id,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: OptimizedCacheImage(
                    imageUrl: comic.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              )),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text('Explaination:',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
                comic.explaination.split('==Explanation==')[1].split('==')[0]),
          ),
        ]),
      ),
    );
  }
}
