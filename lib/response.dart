import 'blocs/bloc_account.dart';
import '../interfaces/i_response.dart';

class Response implements IResponse {
  final AccountBloc? _bloc;
  
  Response(this._bloc);
  
  @override
  void onFailed([String? error]) {
    _bloc?.error(error);
  }

  @override
  void onSucceded([String? message]) {
    _bloc?.success(message);
  }

}