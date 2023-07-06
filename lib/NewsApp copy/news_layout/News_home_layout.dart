import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/NewsApp%20copy/search/Search.dart';
import 'package:messanger/components/components.dart';
import 'package:messanger/news_cubit%20copy/news_cubit.dart';
import 'package:messanger/news_cubit%20copy/news_state.dart';

class newslayout extends StatelessWidget {
  const newslayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newscubic, newsstates>(
      builder: (context, state) {
        var cubit = newscubic.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, search());
                  },
                  icon: Icon(Icons.search))
            ],
            title: Text(cubit.titles[cubit.index]),
          ),
          body: cubit.body[cubit.index],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.index,
              onTap: (value) {
                cubit.changebottombar(value);
              },
              items: cubit.items),
        );
      },
      listener: (context, state) {},
    );
  }
}
