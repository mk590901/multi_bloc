import '../response.dart';
import '../blocs/bloc_account.dart';
import '../blocs/bloc_action.dart';
import 'i_transition_method.dart';

class OnRegistering implements ITransitionMethod {

  final AccountBloc? _bloc;
  OnRegistering (this._bloc);

  @override
  void execute([String? userName]) async {
    print ("@OnRegistering->$userName");
    if (_bloc != null) {
      if (userName != null) {
        await delay(3);
        _bloc?.accountManager?.register(userName, Response(_bloc));
      }
      else {
        _bloc?.error("User name is empty");
      }
    }
    else {
      print ("OnRegistering.execute._bloc is null");
    }
  }
}

Future<void> delay(int duration) async {
  await Future.delayed(Duration(seconds: duration));
}

class OnLogout implements ITransitionMethod {

  final AccountBloc? _bloc;
  OnLogout (this._bloc);

  @override
  void execute([String? userName]) async {
    print ("@Logout->$userName");
    if (_bloc != null) {
      if (userName != null) {
        await delay(3);
        _bloc?.accountManager?.logout(userName, Response(_bloc));
      }
      else {
        _bloc?.error("User name is empty");
      }
    }
    else {
      print ("OnLogout.execute._bloc is null");
    }
  }
}

class OnUnregistering implements ITransitionMethod {

  final AccountBloc? _bloc;
  OnUnregistering (this._bloc);

  @override
  void execute([String? userName]) async {
    print ("@OnUnregistering->$userName");
    if (_bloc != null) {
      if (userName != null) {
        await delay(3);
        _bloc?.accountManager?.unregister(userName, Response(_bloc));
      }
      else {
        _bloc?.error("User name is empty");
      }
    }
    else {
      print ("OnUnregistering.execute._bloc is null");
    }
  }
}

class OnFetching implements ITransitionMethod {

  final AccountBloc? _bloc;
  OnFetching (this._bloc);

  @override
  void execute([String? userName]) async {
    print ("@OnFetching->$userName");
    if (_bloc != null) {
      if (userName != null) {
        await delay(5);
        _bloc?.accountManager?.fetch(userName, Response(_bloc));
      }
      else {
        _bloc?.error("User name is empty");
      }
    }
    else {
      print ("OnFetching.execute._bloc is null");
    }
  }
}

class OnLogin implements ITransitionMethod {

  final AccountBloc? _bloc;
  OnLogin (this._bloc);

  @override
  void execute([String? userName]) async {
    print ("@OnLogin->$userName");
    if (_bloc != null) {
      if (userName != null) {
        await delay(5);
        _bloc?.accountManager?.login(userName, Response(_bloc));
      }
      else {
        _bloc?.error("User name is empty");
      }
    }
    else {
      print ("OnFetching.execute._bloc is null");
    }
  }
}

class OnError implements ITransitionMethod {
  @override
  void execute([String? errorMessage]) {
    print ("@OnError $errorMessage");
  }
}

class OnSuccess implements ITransitionMethod {
  @override
  void execute([String? data]) {
    print ("@execute.OnSuccess");
  }
}

class OnSuccessResult implements ITransitionMethod {
  final ActionBloc? _bloc;
  OnSuccessResult (this._bloc);
  @override
  void execute([String? data]) {
    print ("@OnSuccessResult");
  }
}

class OnFailedResult implements ITransitionMethod {
  final ActionBloc? _bloc;
  OnFailedResult (this._bloc);
  @override
  void execute([String? data]) {
    print ("@OnFailedResult");
  }
}

class OnIdleResult implements ITransitionMethod {
  final ActionBloc? _bloc;
  OnIdleResult (this._bloc);
  @override
  void execute([String? data]) {
    print ("@OnIdleResult");
  }
}
