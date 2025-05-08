part of 'todo_bloc_bloc.dart';


sealed class TodoBlocEvent {}
final class TodoEventAdd extends TodoBlocEvent {
  final String title;
  final String date;
  TodoEventAdd({required this.title,required this.date });


}

final class TodoEventComplete extends TodoBlocEvent{
  final int index;

  TodoEventComplete({required this.index});
}

final class TodoSelectDate extends TodoBlocEvent{
  final DateTime date;

  TodoSelectDate({required this.date});
}