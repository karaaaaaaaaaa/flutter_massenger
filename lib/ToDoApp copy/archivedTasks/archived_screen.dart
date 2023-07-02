import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/todo_cubit%20copy/cubit.dart';
import 'package:messanger/todo_cubit%20copy/states.dart';

import '../../components/components.dart';


class archive extends StatelessWidget {
  const archive({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<todocubit,todostates>(
        listener: (context,state){},
      builder: (context,state) {
    var taskes = todocubit.get(context).archiveTasks;
         
          return tasksEmpty(tasks:taskes );
    }
    );
  }
}
