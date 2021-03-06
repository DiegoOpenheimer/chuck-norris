import 'package:chuck_norris/src/AppBindings.dart';
import 'package:chuck_norris/src/routes.dart';
import 'package:chuck_norris/src/shared/services/AppConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  Get.lazyPut(() => AppConfig(), fenix: true);
  await AppConfig.init();
  runApp(ChuckNorrisApp());
}

class ChuckNorrisApp extends StatelessWidget {

  final AppConfig appConfig = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chuck norris',
      defaultTransition: Transition.topLevel,
      themeMode: appConfig.getTheme(),
      darkTheme: ThemeData.dark().copyWith(accentColor: Colors.orange[900]),
      initialBinding: ChuckNorrisBindings(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            brightness: Brightness.light,
            color: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(headline5: TextStyle(color: Colors.black)),
            iconTheme: IconThemeData(color: Colors.black)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.orange[900]
      ),
      getPages: routes,
    );
  }
}
