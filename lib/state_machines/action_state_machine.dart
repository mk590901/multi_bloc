import '../events/action_events.dart';
import '../blocs/bloc_action.dart';
import '../events/event.dart';
import '../interfaces/trans_methods.dart';
import '../states/action_states.dart';
import 'state.dart';
import 'basic_state_machine.dart';
import 'trans.dart';

class ActionStateMachine extends BasicStateMachine {

  ActionBloc? _bloc;

  ActionStateMachine(super.currentState);
  ActionStateMachine.V(this._bloc, super.currentState);

  @override
  void create() {
    states_ [state_(ActionStates.idle)]       = State([ Trans(Succeeded(),  state_(ActionStates.succeeded),   OnSuccessResult(_bloc)),
                                                        Trans(Idle(),       state_(ActionStates.idle),        OnIdleResult(_bloc)),
                                                        Trans(Failed(),     state_(ActionStates.failed),      OnFailedResult(_bloc))]);
    states_ [state_(ActionStates.succeeded)]  = State([ Trans(Idle(),       state_(ActionStates.idle),        OnIdleResult(_bloc))]);
    states_ [state_(ActionStates.failed)]     = State([ Trans(Idle(),       state_(ActionStates.idle),        OnIdleResult(_bloc))]);

  }

  @override
  String? getEventName(int event) {
    // TODO: implement getEventName
    throw UnimplementedError();
  }

  @override
  String? getStateName(int state) {
    return "state [${ActionStates.values[state].name}]";
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
