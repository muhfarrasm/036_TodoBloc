part of 'todo_bloc_bloc.dart';


sealed class TodoBlocState {}

final class TodoBlocInitial extends TodoBlocState {}
final class TodoBlocLoading extends TodoBlocState {}

final class TodoBlocLoaded extends TodoBlocState {
  final List<Todo> todos;
  DateTime? selectedDate;

  TodoBlocLoaded({
    required this.todos, required this.selectedDate
  });
}
