import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/constants.dart';

import '../../components/components.dart';
import '../../news_cubit copy/news_cubit.dart';
import '../../news_cubit copy/news_state.dart';
import '../../news_cubit/news_cubit.dart';

class search extends StatelessWidget {
  // const search({super.key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newscubic, newsstates>(
      builder: (context, state) {
        var cubit = newscubic.get(context);
        List list = cubit.search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                defaultFormText(
                    control: searchController,
                    type: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please write what your search content";
                      }
                      return null;
                    },
                    label: ("search"),
                    onChanged: (value) {
                      cubit.getseach(value);
                    },
                    prefix: Icons.search),
                Expanded(
                    child: listartical(list, context, listcount: list.length))
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
