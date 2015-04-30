# electron

A Dart library for [Electron][] desktop apps.

[Electron]: http://electron.atom.io/

## Usage
   
    main() {
      app.onReady.listen((_) {
        var mainWindow = new BrowserWindow(width: 800, height: 600);
    
        mainWindow.loadUrl('file://$dirname/index.html');
    
        mainWindow.onClosed.listen((_) {
          mainWindow = null;
        });
      });
    }

## Example

A simple hello world app can be found at: https://github.com/rwl/electron_app
