import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/components/components.dart';
import 'package:news/cubit/news_cubit.dart';
import 'package:news/cubit/news_states.dart';

class Business_Screen extends StatelessWidget {
  const Business_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) => NewsCubit(),
      builder: (context, state)
      {

        var list = NewsCubit().get(context).Business;
        return BuildItem(list);
      }

      ,);
  }
}
