import '../events/event.dart';

class Idle extends Event {
  String? cause;
  Idle();
  Idle.attr(this.cause);
  @override
  String? getData() {
    return cause;
  }
}

class Succeeded extends Event {
  String? cause;
  Succeeded();
  Succeeded.attr(this.cause);
  @override
  String? getData() {
    return cause;
  }
}

class Failed extends Event {
  String? cause;
  Failed();
  Failed.attr(this.cause);
  @override
  String? getData() {
    return cause;
  }
}
