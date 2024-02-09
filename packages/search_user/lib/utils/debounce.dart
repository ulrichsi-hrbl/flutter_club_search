import 'dart:async';
import 'dart:ui';

class Debounce {
  final int milliseconds;
  Timer? _timer;

  Debounce({
    this.milliseconds = 500
  });

  void run(VoidCallback action) {
    close();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void close() {
    if(_timer != null){
      _timer!.cancel();
    }
  }
}