import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/news_cubit.dart';
import 'package:news/cubit/news_states.dart';
import 'package:news/main_cubit/main_cubit.dart';
import 'package:news/moduels/search-screen/search_screen.dart';
import 'package:news/networks/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit().get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Search_Screen()));
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                icon: const Icon(Icons.brightness_4_outlined),
                onPressed: () {
                  MainCubit().get(context).ChangeBrightnessButtom();
                },
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentindex,
            items: cubit.BottomItems,
            onTap: (index) {
              cubit.ChangeBotNav(index);
            },
          ),
          body: cubit.screens[cubit.currentindex],
        );
      },
    );
  }
}
