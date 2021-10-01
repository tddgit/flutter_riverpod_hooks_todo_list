import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Uuid _uuid = Uuid();

class Todo {
  Todo({
    required this.description,
    String? id,
    this.isCompleted = false,
  }) : id = id ?? _uuid.v4();

  final String description;
  final String id;
  final bool isCompleted;

  @override
  String toString() =>
      'Todo(description: $description, id: $id, isCompleted: $isCompleted)';

  Todo copyWith({
    String? description,
    String? id,
    bool? isCompleted,
  }) {
    return Todo(
      description: description ?? this.description,
      id: id ?? this.id,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class TodoList extends StateNotifier<List<Todo>> {
  TodoList(List<Todo> initialTodos) : super(initialTodos);

  void addTodo(String description) {
    state = [
      ...state,
      Todo(
        description: description,
      ),
    ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          // Todo(
          //   id: todo.id,
          //   isCompleted: !todo.isCompleted,
          //   description: todo.description,
          // )
          todo.copyWith(
            isCompleted: !todo.isCompleted,
          )
        else
          todo,
    ];
  }

  void edit({required String id, required String description}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(
            description: description,
          )
        else
          todo,
    ];
  }

  void remove(Todo target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}

enum TodoListFilter {
  all,
  active,
  completed,
}

final todoListFilter = StateProvider((_) => TodoListFilter.all);
