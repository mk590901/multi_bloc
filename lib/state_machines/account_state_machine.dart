import '../blocs/bloc_account.dart';
import '../events/event.dart';
import '../interfaces/trans_methods.dart';
import '../states/account_states.dart';
import '../state_machines/trans.dart';
import '../events/account_events.dart';
import 'basic_state_machine.dart';
import 'state.dart';

class AccountStateMachine extends BasicStateMachine {

  AccountBloc? _bloc;

  AccountStateMachine(super.currentState);
  AccountStateMachine.V(this._bloc, super.currentState);

  @override
  void create() {
    states_ [state_(AccountStates.unregistered)]   = State([Trans(Registration(),   state_(AccountStates.registering),   OnRegistering(_bloc)),]);
    states_ [state_(AccountStates.registering)]    = State([Trans(Error(),          state_(AccountStates.unregistered),  OnError()),
                                                            Trans(Success(),        state_(AccountStates.registered),    OnSuccess())]);
    states_ [state_(AccountStates.registered)]     = State([Trans(Login(),          state_(AccountStates.fetching),      OnLogin(_bloc)),
                                                            Trans(Unregistration(), state_(AccountStates.unregistering), OnUnregistering(_bloc))]);
    states_ [state_(AccountStates.unregistering)]  = State([Trans(Error(),          state_(AccountStates.registered),    OnError()),
                                                            Trans(Success(),        state_(AccountStates.unregistered),  OnSuccess())]);
    states_ [state_(AccountStates.fetching)]       = State([Trans(Error(),          state_(AccountStates.registered),    OnError()),
                                                            Trans(Success(),        state_(AccountStates.loaded),        OnSuccess())]);
    states_ [state_(AccountStates.loaded)]         = State([Trans(Fetching(),       state_(AccountStates.refreshing),    OnFetching(_bloc)),
                                                            Trans(Unregistration(), state_(AccountStates.unregistering), OnUnregistering(_bloc)),
                                                            Trans(Logout(),         state_(AccountStates.uninitializing),OnLogout(_bloc))]);
    states_ [state_(AccountStates.refreshing)]     = State([Trans(Error(),          state_(AccountStates.loaded),        OnError()),
                                                            Trans(Success(),        state_(AccountStates.loaded),        OnSuccess())]);
    states_ [state_(AccountStates.uninitializing)] = State([Trans(Error(),          state_(AccountStates.loaded),        OnError()),
                                                            Trans(Success(),        state_(AccountStates.registered),    OnSuccess())]);

  }

  @override
  String? getEventName(int event) {
    // TODO: implement getEventName
    throw UnimplementedError();
  }

  @override
  String? getStateName(int state) {
    // TODO: implement getStateName
    //print("getStateName for $state");
    return "state [${AccountStates.values[state]}]";
  }

  @override
  void publishEvent(Event event) {
    print ("publishEvent->${event}");
  }

  @override
  void publishState(int state) {
    // TODO: implement publishState
  }

}
