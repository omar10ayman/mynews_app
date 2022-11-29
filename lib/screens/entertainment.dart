import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today/bloc/cubit.dart';
import 'package:today/bloc/states.dart';
import 'package:today/shared/componats.dart';

class entertainmentPade extends StatelessWidget {
  const entertainmentPade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, NewsStates>(
      builder: (context, state) {
        var list = newsCubit.get(context).entertainment;
        return Scaffold(
          appBar: appbar(text: "Entertainment News"),
          body: ConditionalBuilder(
            condition: list.length > 0,
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
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
