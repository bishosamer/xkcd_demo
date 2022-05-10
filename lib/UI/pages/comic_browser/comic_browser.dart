import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xkcd_demo/UI/widgets/comic_tile.dart';
import 'package:xkcd_demo/UI/pages/comic_browser/bloc/list_bloc.dart';
import 'package:xkcd_demo/UI/widgets/global_drawer.dart';
import 'package:xkcd_demo/prefs/shared_preferences.dart';

class ComicBrowser extends StatelessWidget {
  const ComicBrowser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListBloc>(
      create: (BuildContext context) => ListBloc(),
      child: Scaffold(
        drawer: const GlobalDrawer(),
        appBar: AppBar(
          title: const Text('Latest XKCD'),
        ),
        body: BlocBuilder<ListBloc, ListState>(builder: (context, state) {
          ScrollController controller = ScrollController();

          controller.addListener(() {
            if (controller.position.pixels ==
                controller.position.maxScrollExtent) {
              if (state is LoadedState) {
                print(controller.position.pixels);
                BlocProvider.of<ListBloc>(context).add(const AddToList(3));
              }
            }
          });
          if (state is ListInitialState) {
            SharedPrefs.init();

            context.read<ListBloc>().add(const AddToList(2));

            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadingState) {
            return state.comics.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    controller: controller,
                    itemCount: state.comics.length,
                    itemBuilder: (context, index) {
                      var comic = state.comics[index];

                      return Column(
                        children: [
                          ComicTile(comic: comic),
                          index == state.comics.length - 1
                              ? const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(),
                                )
                              : Container(
                                  child: state.comics.isEmpty
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : Container(),
                                )
                        ],
                      );
                    },
                  );
          } else if (state is LoadedState) {
            if (state.comics.length < 10) {
              context.read<ListBloc>().add(const AddToList(2));
            }
            return ListView.builder(
              controller: controller,
              itemCount: state.comics.length,
              itemBuilder: (context, index) {
                var comic = state.comics[index];

                return ComicTile(comic: comic);
              },
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        }),
      ),
    );
  }
}
