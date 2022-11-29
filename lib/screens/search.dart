import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today/shared/componats.dart';

import '../bloc/cubit.dart';
import '../bloc/states.dart';

class searchPage extends StatelessWidget {
  searchPage({Key? key}) : super(key: key);
  var searchBar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = newsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defualtform(
                  context: context,
                  valide: (v) {
                    if (v.isEmpty) {
                      return "must put value";
                    } else {
                      return null;
                    }
                  },
                  text: "Search",
                  icon: Icons.search,
                  controller: searchBar,
                  onchange: (String value) {
                    newsCubit.get(context).getSearch(value);
                  }),
            ),
            Expanded(
                child: ConditionalBuilder(
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
            ))
          ]),
        );
      },
    );
  }
}
