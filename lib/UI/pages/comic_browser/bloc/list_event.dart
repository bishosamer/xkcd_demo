part of 'list_bloc.dart';

@immutable
abstract class ListEvent extends Equatable {
  const ListEvent();

  @override
  List<Object> get props => [];
}

class AddToList extends ListEvent {
  final int numberToLoad;
  const AddToList(this.numberToLoad);
  @override
  List<Object> get props => [numberToLoad];
}
