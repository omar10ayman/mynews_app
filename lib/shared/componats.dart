import 'package:flutter/material.dart';
import 'package:today/bloc/cubit.dart';
import 'package:today/modeles/data.dart';
import 'package:today/screens/Technology.dart';
import 'package:today/screens/bussiens.dart';
import 'package:today/screens/entertainment.dart';
import 'package:today/screens/health.dart';
import 'package:today/screens/science.dart';
import 'package:today/screens/sports.dart';
import 'package:today/screens/webview.dart';

List<dataModel> data = [
  dataModel(
      icon: Icons.apartment_sharp,
      text: "Bussienss News",
      weidgt: const bussienssPage()),
  dataModel(
      icon: Icons.sports_baseball,
      text: "Sports News",
      weidgt: const sportsPage()),
  dataModel(
      icon: Icons.science, text: "Science News", weidgt: const sciencePade()),
  dataModel(
      icon: Icons.health_and_safety,
      text: "Health News",
      weidgt: const healthPade()),
  dataModel(
      icon: Icons.psychology_sharp,
      text: "Technology News",
      weidgt: const TechnologyPAge()),
  dataModel(
      icon: Icons.child_care_outlined,
      text: "Entertainment News",
      weidgt: const entertainmentPade()),
];
Widget dataMainApp(dataModel data, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          navigto(context, data.weidgt);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                data.icon,
                size: 40,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "${data.text}",
                style: newsCubit.get(context).isDark
                    ? const TextStyle(color: Colors.black, fontSize: 25)
                    : const TextStyle(color: Colors.white, fontSize: 25),
              )
            ],
          ),
        ),
      ),
    );
// ignore: avoid_types_as_parameter_names, non_constant_identifier_names
void navigto(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
Widget defualtform({
  required String text,
  required IconData icon,
  required TextEditingController controller,
  required Function onchange,
  required Function valide,
  required BuildContext context,
}) {
  return TextFormField(
      style: TextStyle(
        color: newsCubit.get(context).isDark ? Colors.black : Colors.white,
      ),
      validator: (s) {
        return valide(s); // must be put return and put s in ()
      },
      onChanged: (value) {
        // ignore: void_checks
        return onchange(value);
      },
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: newsCubit.get(context).isDark ? Colors.black : Colors.white,
            width: 2,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: newsCubit.get(context).isDark ? Colors.black : Colors.white,
            width: 2,
            style: BorderStyle.solid,
          )),
          hintText: text,
          prefixIcon: Icon(
            icon,
            color: newsCubit.get(context).isDark ? Colors.black : Colors.white,
          ),
          hintStyle: newsCubit.get(context).isDark
              ? const TextStyle(
                  color: Colors.black,
                )
              : const TextStyle(
                  color: Colors.white,
                )));
}

dataDesign(list, context) {
  return InkWell(
    onTap: (() {
      navigto(context, webView(url: list['url']));
    }),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // ignore: unnecessary_null_comparison
                image: DecorationImage(
                    image: NetworkImage("${list["urlToImage"]}"),
                    fit: BoxFit.cover)),

            // child: Image.network(
            //     "https://img.youm7.com/large/202208030431103110.jpg"),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${list["title"]}",
                      style: Theme.of(context).textTheme.caption,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "${list["publishedAt"]}",
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

appbar({required String text}) {
  return AppBar(
    title: Text(text),
    centerTitle: true,
  );
}

itemBuild() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    ),
  );
}
