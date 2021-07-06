import 'package:chuck_norris/src/about/about.viewmodel.dart';
import 'package:chuck_norris/src/shared/services/Linking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutWidget extends StatelessWidget {
  final Function? onPress;
  final AboutViewModel _aboutViewModel = AboutViewModel(linkingService: Linking());

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
              TextButton(
                onPressed: handlerTapLink,
                child: Text(
                  'https://api.chucknorris.io/',
                  style: TextStyle(
                      fontSize: 20, decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future handlerTapLink() async {
    try {
      _aboutViewModel.openLink();
    } catch (e) {
      Get.snackbar('Atenção', 'Houve uma falha ao abrir o link');
    }
  }

}
