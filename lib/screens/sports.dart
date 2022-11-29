import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today/bloc/cubit.dart';
import 'package:today/bloc/states.dart';
import 'package:today/shared/componats.dart';

class sportsPage extends StatelessWidget {
  const sportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, NewsStates>(
      builder: (context, state) {
        var list = newsCubit.get(context).sports;
        return Scaffold(
            appBar: appbar(text: "Sports News"),
            body: ConditionalBuilder(
              condition: list.isNotEmpty,
              builder: (context) {
                return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return dataDesign(list[index], context);
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey,
                        ),
                      );
                    },
                    itemCount: list.length);
              },
              fallback: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ));
      },
      listener: (context, state) {},
    );
  }
}
