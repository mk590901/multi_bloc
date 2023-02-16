import 'dart:collection';
import 'dart:math';
import '../interfaces/i_response.dart';

class AccountManager {

  static AccountManager? _instance;

  static void initInstance() {
    _instance ??= AccountManager();
  }

  static AccountManager? manager() {
    if (_instance == null) {
      initInstance();
    }
    return _instance;
  }

  final _random = Random();
  final HashMap<String, bool> _container = HashMap<String, bool>();

//  Methods
  bool blocked() {
    bool blocked = false;
    if (_random.nextInt(100) < 30) {
      blocked = true;
    }
    return blocked;
  }

  void register (String user, IResponse response) {
    if (blocked()) {
      response.onFailed("Registration is failed because internal error");
      return;
    }
    if (!_container.containsKey(user)) {
      _container[user] = false;
      response.onSucceded('User $user has been registered');
    }
    else {
      response.onFailed("User already registered");
    }
  }

  void unregister (String user, IResponse response) {
    if (blocked()) {
      response.onFailed("Unregister is failed because internal error");
      return;
    }
    if (_container.containsKey(user)) {
      _container.remove(user);
      response.onSucceded('User $user was unregistered');
    }
    else {
      response.onFailed("User is unregistered");
    }
  }

  void login (String user, IResponse response) {
    if (blocked()) {
      response.onFailed("Login is failed because internal error");
      return;
    }
    if (_container.containsKey(user)) {
      _container[user] = true;
      response.onSucceded('User $user is logged in');
    }
    else {
      response.onFailed("User is unregistered");
    }
  }

  void fetch (String user, IResponse response) {
    if (blocked()) {
      response.onFailed("Fetching is failed because internal error");
      return;
    }
    if (_container.containsKey(user)) {
      if (_container[user] == true) {
        response.onSucceded('User $user is fetched');
      }
      else {
        response.onFailed("User isn't logged");
      }
    }
    else {
      response.onFailed("User is unregistered");
    }
  }

  void logout (String user, IResponse response) {
    if (blocked()) {
      response.onFailed("Logout is failed because internal error");
      return;
    }
    if (_container.containsKey(user)) {
      _container[user] = false;
      response.onSucceded('User $user is logged out');
    }
    else {
      response.onFailed("User is uninitialized");
    }
  }
}