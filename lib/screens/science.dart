import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today/bloc/cubit.dart';

import 'package:today/bloc/states.dart';

// ignore: duplicate_import

import '../shared/componats.dart';

// ignore: camel_case_types
class sciencePade extends StatelessWidget {
  const sciencePade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = newsCubit.get(context).science;
        return Scaffold(
            appBar: appbar(text: "Science News"),
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
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }));
      },
    );
  }
}
