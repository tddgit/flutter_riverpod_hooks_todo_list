import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod_hooks_todo_list/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends HookWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController newTodoController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do Riverpod with Hooks'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 800,
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            children: <Widget>[
              Title(),
              TextField(
                controller: newTodoController,
                decoration: const InputDecoration(
                  labelText: 'What needs to be done?',
                ),
                onSubmitted: (value) {
                  // TODO: on submitted
                },
              ),
              const SizedBox(height: 42),
              Column(
                // ignore: flutter_style_todos
                children: <Widget>[
                  ToolBar(),
                  // TODO: TodoList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ToolBar extends StatelessWidget {
  const ToolBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('ToolBar');
  }
}

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);
  static const double _size = 86;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'todos',
          style: TextStyle(fontSize: _size, fontWeight: FontWeight.w100),
        ),
        Icon(
          Icons.check,
          size: _size,
        ),
      ],
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('TodoItem');
  }
}
