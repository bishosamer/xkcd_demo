part of 'list_bloc.dart';

@immutable
abstract class ListState {}

class ListInitialState extends ListState {}

class ErrorState extends ListState {}

class LoadedState extends ListState {
  final List<Comic> comics;

  LoadedState(this.comics);
}

class LoadingState extends ListState {
  final List<Comic> comics;

  LoadingState(this.comics);
}
