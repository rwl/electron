library electron.browser_window;

import 'dart:js';
import 'dart:async';

JsObject _BrowserWindow =
    context['nodejs'].callMethod('require', ['browser-window']);

class BrowserWindow {
  final JsObject _window;
  StreamController _closedCtrl = new StreamController.broadcast(sync: true);

  BrowserWindow({int height, int width}) : _window = new JsObject(
          _BrowserWindow,
          [new JsObject.jsify({'height': height, 'width': width})]) {
    _window.callMethod('on', [
      'closed',
      (event) {
        _closedCtrl.add(event);
      }
    ]);
  }

  Stream get onClosed => _closedCtrl.stream;

  void loadUrl(String url) {
    _window.callMethod('loadUrl', [url]);
  }
}
