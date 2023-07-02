import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:messanger/components/components.dart';
import 'package:messanger/todo_cubit%20copy/cubit.dart';
import 'package:messanger/todo_cubit%20copy/states.dart';

class Todolayout extends StatelessWidget {
  // const Todolayout({super.key});
  var formkey = GlobalKey<FormState>();
  var scaflkey = GlobalKey<ScaffoldState>();
  var taskTitlecontr = TextEditingController();
  var taskDatecontr = TextEditingController();
  var taskTimecontr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => todocubit()..createdatabade(),
      child: BlocConsumer<todocubit, todostates>(
        builder: (context, state) {
          var cubit = todocubit.get(context);
          return Scaffold(
            key: scaflkey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.index]),
            ),
            body: cubit.body[cubit.index],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formkey.currentState!.validate()) {
                    cubit.insertToDatabase(
                        date: taskDatecontr.text,
                        time: taskTimecontr.text,
                        title: taskTitlecontr.text);
                    print("object");
                  }
                } else {
                  scaflkey.currentState!
                      .showBottomSheet((context) => Container(
                            child: Form(
                              key: formkey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultFormText(
                                      control: taskTitlecontr,
                                      type: TextInputType.name,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "please write task Title";
                                        }
                                        return null;
                                      },
                                      label: "task Title",
                                      prefix: Icons.add_location),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  defaultFormText(
                                      control: taskTimecontr,
                                      type: TextInputType.name,
                                      onTap: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) {
                                          taskTimecontr.text =
                                              value!.format(context).toString();
                                        });
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "please write task Time";
                                        }
                                        return null;
                                      },
                                      label: "task Time",
                                      prefix: Icons.watch_later_outlined),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  defaultFormText(
                                      control: taskDatecontr,
                                      type: TextInputType.name,
                                      onTap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse('2023-12-01'),
                                        ).then((value) {
                                          taskDatecontr.text =
                                              DateFormat.yMMMd().format(value!);
                                        });
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "please write task Date";
                                        }
                                        return null;
                                      },
                                      label: "task Date",
                                      prefix: Icons.date_range),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .closed
                      .then((value) {
                    cubit.changeBottomSheet(isshow: false, icon: Icons.edit);
                  });
                  cubit.changeBottomSheet(isshow: true, icon: Icons.add);
                }
              },
              child: Icon(cubit.flotIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.index,
                onTap: (value) {
                  cubit.changeBottombar(value);
                },
                items: todocubit.get(context).items),
          );
        },
        listener: (context, state) {
          if (state is TodoInsertDataBaseState) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
