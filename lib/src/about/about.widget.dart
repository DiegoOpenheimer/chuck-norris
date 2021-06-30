import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutWidget extends StatelessWidget {
  final Function? onPress;

  AboutWidget({this.onPress});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (onPress == null) {
          return Future.value(true);
        }
        onPress!();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('About'),
          backgroundColor: Colors.transparent,
          leading: onPress != null
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: onPress as void Function()?,
                )
              : null,
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Container(
          height: Get.height - Get.statusBarHeight,
          child: Column(
            children: [
              Text(
                '''
            The application was made just for practice and study purposes, the api used was from https://api.chucknorris.io/, in which all images and messages shown are copyrighted by them.
          ''',
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.headline5,
              ),
              Spacer(),
              Text(
                'https://api.chucknorris.io/',
                style: TextStyle(
                    fontSize: 20, decoration: TextDecoration.underline),
              )
            ],
          ),
        ),
      ),
    );
  }
}
