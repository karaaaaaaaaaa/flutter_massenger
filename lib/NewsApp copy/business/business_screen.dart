import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/components/components.dart';

import '../../news_cubit copy/news_cubit.dart';
import '../../news_cubit copy/news_state.dart';

class business extends StatelessWidget {
  const business({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newscubic, newsstates>(
      builder: (context, state) {
        var cubit = newscubic.get(context);
      List  list = newscubic.get(context).busin;
        return listartical(list, context, listcount: 10);
      },
      listener: (context, state) {},
    );
  }
}
