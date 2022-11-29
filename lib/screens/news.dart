import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today/bloc/cubit.dart';
import 'package:today/bloc/states.dart';
import 'package:today/screens/search.dart';
import 'package:today/shared/componats.dart';

class news extends StatelessWidget {
  news({Key? key}) : super(key: key);

  double font = 20;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = newsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.dark_mode_rounded),
              onPressed: () {
                cubit.darkMode();
              },
            ),
            centerTitle: true,
            title: const Text('Your World is here'),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.search_sharp,
                ),
                onPressed: () {
                  navigto(context, searchPage());
                },
              ),
            ],
          ),
          body: ListView.separated(
              itemBuilder: (context, index) {
                return dataMainApp(data[index], context);
              },
              separatorBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                );
              },
              itemCount: data.length),
        );
      },
    );
  }
}
