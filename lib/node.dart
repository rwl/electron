library electron.node;

import 'dart:js';

final String dirname = context['nodejs']['__dirname'];
final _Process process = new _Process();

class _Process {
  String get platform => context['process']['platform'];
}
