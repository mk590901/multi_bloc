enum ActionStates { idle, succeeded, failed }

int state_(ActionStates state) {
  return state.index;
}

class ActionState {
  final ActionStates _state;
  String? _message = "*";

  ActionState(this._state) {
    print ("ActionState.constructor ($_state)");
  }

  ActionStates state() {
    return _state;
  }
  void setMessage(String? message) {
    _message = message;
  }

  String? message() {
    return _message;
  }

}
