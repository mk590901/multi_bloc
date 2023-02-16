import 'event.dart';

class Registration extends Event {
  String? password;
  Registration();
  Registration.attr(this.password);
  @override
  String? getData() {
    return password;
  }
}

class Unregistration extends Event {
  String? password;
  Unregistration();
  Unregistration.attr(this.password);
  @override
  String? getData() {
    return password;
  }
}

class Logout extends Event {
  String? password;
  Logout();
  Logout.attr(this.password);
  @override
  String? getData() {
    return password;
  }
}

class Fetching extends Event {
  String? password;
  Fetching();
  Fetching.attr(this.password);
  @override
  String? getData() {
    return password;
  }
}

class Login extends Event {
  String? password;
  Login();
  Login.attr(this.password);
  @override
  String? getData() {
    return password;
  }
}

class Error extends Event {
  String? message;
  Error();
  Error.attr (this.message);
  @override
  String? getData() {
    return message;
  }
}

class Success extends Event {
  String? message;
  Success();
  Success.attr (this.message);
  @override
  String? getData() {
    return message;
  }
}
