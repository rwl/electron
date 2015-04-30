library electron.app;

import 'dart:js';
import 'dart:async';

JsObject _app = context['nodejs'].callMethod('require', ['app']);

final app = new _App();

class _App {
  StreamController _readyCtrl = new StreamController.broadcast(sync: true);
  StreamController _windowAllClosedCtrl = new StreamController.broadcast(sync: true);

  _App() {
    print('app');
    _app.callMethod('on', ['window-all-closed', (event) {
      _windowAllClosedCtrl.add(event);
    }]);
    _app.callMethod('on', ['ready', (event) {
      print('ready $event');
      _readyCtrl.add(event);
//      if (onReadyFn != null) onReadyFn(event);
    }]);
  }

  Stream get onReady => _readyCtrl.stream;
//  Function onReadyFn;
  Stream get onWindowAllClosed => _windowAllClosedCtrl.stream;

  void quit() {
    _app.callMethod('quit');
  }
}
