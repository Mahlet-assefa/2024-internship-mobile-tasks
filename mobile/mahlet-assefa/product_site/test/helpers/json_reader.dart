import 'dart:io';

String readJson(String name, {String? id = ''}) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  if (id != null) {
    return File('$dir/test/$name').readAsStringSync();
  }
  return File('$dir/test/$name').readAsStringSync();
}
