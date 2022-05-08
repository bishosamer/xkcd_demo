import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:xkcd_demo/models/comic.dart';
import 'package:xkcd_demo/network/api_handler.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListInitialState());
  bool isLoading = false;
  int latestId = 0;
  List<Comic> comics = [];
  @override
  Stream<ListState> mapEventToState(
    ListEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is AddToList) {
      yield LoadingState();
      try {
        for (int i = 0; i < 10; i++) {
          var comic = await ApiHandler.getComic(event.comic.id);
          comics.add(comic);
          latestId = comic.id;
        }
        yield LoadedState(comics);
      } catch (e) {
        yield ErrorState();
      }
    }
  }
}
