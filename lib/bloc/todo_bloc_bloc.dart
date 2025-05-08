import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todobloc/model/todo.dart';

part 'todo_bloc_event.dart';
part 'todo_bloc_state.dart';

class TodoBlocBloc extends Bloc<TodoBlocEvent, TodoBlocState> {
  TodoBlocBloc() : super(TodoBlocLoaded(todos: [], selectedDate: null)) {
    on<TodoEventAdd>((event, emit) {
      final currentState = state;
      if (currentState is TodoBlocLoaded) {
        final List<Todo> updateTodos = List.from(currentState.todos);
        updateTodos.add(
          Todo(title: event.title, isCompleted: false, date: event.date),
        );
        emit(
          TodoBlocLoaded(
            todos: updateTodos,
            selectedDate: currentState.selectedDate
          )
        );
      }
    });

    on<TodoSelectDate>((event, emit) {
      final currentState = state;
      if (currentState is TodoBlocLoaded) {
        emit(
          TodoBlocLoaded(todos: currentState.todos, selectedDate: event.date),
        );
      }
    });
    on<TodoEventComplete>((event, emit) {
      final currentState = state;
      if (currentState is TodoBlocLoaded) {
        final List<Todo> updateTodos = List.from(currentState.todos);

        if (event.index >= 0 && event.index < updateTodos.length) {
          updateTodos[event.index] = Todo(
            title: updateTodos[event.index].title,
            isCompleted: !updateTodos[event.index].isCompleted,
            date: updateTodos[event.index].date,
          );
        }
        emit(
          TodoBlocLoaded(
            todos: updateTodos,
            selectedDate: currentState.selectedDate,
          ),
        );
      }
    });
  }
}

