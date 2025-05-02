import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _controller = TextEditingController();
  final List<TodoItem> _todos = [];

  void _addTodo() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _todos.add(TodoItem(text));
        _controller.clear();
      });
    }
  }

  void _toggleDone(int index) {
    setState(() {
      _todos[index].isDone = !_todos[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Tarefas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Digite uma tarefa',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _addTodo,
                  icon: const Icon(Icons.add),
                )
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  final item = _todos[index];
                  return ListTile(
                    leading: Checkbox(
                      value: item.isDone,
                      onChanged: (_) => _toggleDone(index),
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                        decoration: item.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoItem {
  String title;
  bool isDone;

  TodoItem(this.title, [this.isDone = false]);
}
