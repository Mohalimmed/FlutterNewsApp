import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../cubit/news_cubit.dart';
import '../../cubit/news_states.dart';

class Science_Screen extends StatelessWidget {
  const Science_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) => NewsCubit(),
      builder: (context, state)
      {

        var list = NewsCubit().get(context).Science;
        return BuildItem(list);
      }

      ,);
  }
}
