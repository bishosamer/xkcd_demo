part of 'list_bloc.dart';

@immutable
abstract class ListEvent extends Equatable {
  const ListEvent();

  @override
  List<Object> get props => [];
}

class AddToList extends ListEvent {
  final Comic comic;
  const AddToList(this.comic);
  @override
  List<Object> get props => [comic];
}
