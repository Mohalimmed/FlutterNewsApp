import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/components/components.dart';
import 'package:news/cubit/news_cubit.dart';
import 'package:news/cubit/news_states.dart';

class Search_Screen extends StatelessWidget {
  const Search_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    var TextContorller = TextEditingController();

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var list = NewsCubit().get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller:TextContorller ,
                  cursorColor: Colors.deepOrange,
                  onChanged: ( value){
                    NewsCubit().get(context).getSearchData(value);
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: 'Search',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)
                      ),
                      counterStyle:TextStyle(
                        color: Colors.deepOrange,
                      ) ,
                      prefixIconColor: Colors.deepOrange,
                      prefixIcon: Icon(
                          Icons.search
                      ),
                      border: OutlineInputBorder(),

                  ),
                ),
              ),
              Expanded(child: BuildItem(list,isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
