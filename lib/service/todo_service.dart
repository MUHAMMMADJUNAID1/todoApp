import 'package:Todo/model/todo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoService {
  final todoCollection = FirebaseFirestore.instance.collection('todoApp');

  //create

  void addNewTask(TodoModel model) {
    todoCollection.add(model.toMap());
  }
}
