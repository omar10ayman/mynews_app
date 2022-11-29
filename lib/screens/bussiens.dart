import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today/bloc/cubit.dart';
import 'package:today/bloc/states.dart';
import 'package:today/shared/componats.dart';

class bussienssPage extends StatelessWidget {
  const bussienssPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = newsCubit.get(context).bussenss;
        return Scaffold(
          appBar: appbar(text: "Bussiess News"),
          body: ConditionalBuilder(
            condition: list.isNotEmpty,
            builder: (context) {
              return ListView.separated(
                itemCount: list.length,
                separatorBuilder: (BuildContext context, int index) {
                  return dataDesign(list[index], context);
                },
                itemBuilder: (BuildContext context, int index) {
                  return itemBuild();
                },
              );
            },
            fallback: (context) {
              return const Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }
}
