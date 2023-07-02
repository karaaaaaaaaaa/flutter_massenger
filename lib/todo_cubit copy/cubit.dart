import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/ToDoApp%20copy/DoneTasks/todoscreen.dart';
import 'package:messanger/ToDoApp%20copy/archivedTasks/archived_screen.dart';
import 'package:messanger/ToDoApp%20copy/tasks/tasks_screen.dart';
import 'package:messanger/todo_cubit%20copy/states.dart';
import 'package:sqflite/sqflite.dart';

class todocubit extends Cubit<todostates> {
  todocubit() : super(todoinitalstate());
  static todocubit get(context) => BlocProvider.of(context);
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  int index = 0;
  void changeBottombar(value) {
    index = value;
    emit(bottombarstate());
  }

  List<Widget> body = [
    taskes(),
    Done(),
    archive(),
  ];
  List<String> titles = ["Taskes", "Done", "Archive"];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Taskes"),
    BottomNavigationBarItem(
        icon: Icon(Icons.check_circle_outline), label: "TODO"),
    BottomNavigationBarItem(icon: Icon(Icons.archive), label: "Archive"),
  ];
  bool isBottomSheetShown = false;
  IconData flotIcon = Icons.edit;
  void changeBottomSheet({required bool isshow, required IconData icon}) {
    isBottomSheetShown = isshow;
    flotIcon = icon;
    emit(BottomSheetShownstate());
  }

  late Database database;

  void createdatabade() {
    openDatabase(
      "kareem.db",
      version: 1,
      onCreate: (database, version) {
        print("database has created");
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)')
            .then((value) {
          print("Table has created");
        }).catchError((Error) {
          print(Error);
        });
      },
      onOpen: (database) {
        print("database has opened");
        getDataFromDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(CreateDataBaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String date,
    required String time,
  }) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO tasks(title, date, time, status) VALUES( "$title", "$date", "$time", "new" )')
          .then((value) {
        print("$value data is inserted");

        emit(TodoInsertDataBaseState());
        getDataFromDatabase(database);
      }).catchError((error) {
        print(error);
      });
    });
  }

  void getDataFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new')
          newTasks.add(element);
        else if (element['status'] == 'done')
          doneTasks.add(element);
        else
          archiveTasks.add(element);
        // print(element['status']);
      });
      emit(GetDataBaseState());
    });
  }

  void updateData({required String status, required int id}) {
    database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getDataFromDatabase(database);
      emit(UpdateDataBaseState());
    });
  }

  void deleteFromdatabase({required int id}) {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      print('deleted');
      emit(deleteDataBaseState());
    }).catchError((error) {
      print(error);
    });
  }
}
