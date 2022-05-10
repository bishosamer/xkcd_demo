import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:xkcd_demo/models/comic.dart';
import 'package:xkcd_demo/network/api_handler.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListInitialState()) {
    on<AddToList>(((event, emit) async {
      print('loading');
      try {
        emit(LoadingState(comics));
        await loadComics(event.numberToLoad);
        emit(LoadedState(comics));
      } catch (e) {
        emit(ErrorState());
      }
    }));
  }
  bool isLoading = false;
  int latestId = -1;
  List<Comic> comics = [];
  loadComics(int comicsToGet) async {
    for (int i = 0; i < comicsToGet; i++) {
      if (latestId == -1) {
        Comic temp = await ApiHandler.getComic(null);
        latestId = temp.id - 1;
        comics.add(temp);
      } else {
        Comic temp = await ApiHandler.getComic(latestId);
        latestId = temp.id - 1;
        comics.add(temp);
      }
    }
  }
}
