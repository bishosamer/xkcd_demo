import 'package:flutter/material.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:xkcd_demo/UI/pages/comic_viewer.dart';
import 'package:xkcd_demo/UI/widgets/favourite_button.dart';
import 'package:xkcd_demo/models/comic.dart';

class ComicTile extends StatelessWidget {
  const ComicTile({Key? key, required this.comic}) : super(key: key);
  final Comic comic;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: SizedBox(
          width: 100,
          height: 100,
          child: OptimizedCacheImage(
            imageUrl: comic.imageUrl,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        title: Text(comic.title),
        subtitle: Text(comic.alt),
        trailing: FavouriteButton(comic: comic),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ComicViewer(comic: comic);
          }));
        },
      ),
    );
  }
}
