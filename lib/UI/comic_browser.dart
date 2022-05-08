import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xkcd_demo/bloc/list_bloc.dart';
import 'package:xkcd_demo/models/comic.dart';

class ComicBrowser extends StatefulWidget {
  const ComicBrowser({Key? key}) : super(key: key);

  @override
  State<ComicBrowser> createState() => _ComicBrowserState();
}

class _ComicBrowserState extends State<ComicBrowser> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListBloc, ListState>(builder: (context, state) {
      if (state is ListInitialState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is LoadedState) {
        return GridView.builder(
            itemCount: state.comics.length,
            itemBuilder: (context, index) {
              var comic = state.comics[index];
              return ListTile(
                title: Text(comic.title),
                subtitle: Text(comic.alt),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(context, '/comic/${comic.id}');
                },
              );
            },
            gridDelegate: null);
      }
    });
  }
}
