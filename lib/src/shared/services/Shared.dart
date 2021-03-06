import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class CustomShared {
  void sharedWithImage({required String path, String? text}) async {
    Directory temp = await getTemporaryDirectory();
    ByteData bytes = await rootBundle.load(path);

    File file = File('${temp.path}/chuck-norris.jpg');
    bool exist = await file.exists();
    if (!exist) {
      File newFile = await file.create();
      await newFile.writeAsBytes(bytes.buffer.asUint8List());
    }
    await Share.shareFiles([file.path], text: text);
  }
}
