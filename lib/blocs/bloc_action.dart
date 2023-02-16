import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc/actions/gui_action.dart';
import '../state_machines/basic_state_machine.dart';
import '../state_machines/action_state_machine.dart';
import '../events/event.dart';
import '../states/action_states.dart';
import '../events/action_events.dart';

//  https://bloclibrary.dev/#/coreconcepts
//  https://itnext.io/flutter-blocs-at-scale-1-the-state-machine-fce5f086d7b9

class ActionBloc extends Bloc<Event, ActionState> {

  final BuildContext _context;
  BasicStateMachine? _stateMachine;
  ActionBloc(this._context, ActionState state) : super(state) {

    _stateMachine = ActionStateMachine.V(this, state_(ActionStates.idle));

    on<Idle>((event, emit) {
      event.setGuiAction(GuiAction(_context));
      done(event, emit);
    });

    on<Succeeded>((event, emit) {
      event.setGuiAction(GuiAction(_context));
      done(event, emit);
    });

    on<Failed>((event, emit) {
      event.setGuiAction(GuiAction(_context));
      done(event, emit);
    });
  }

  void done(Event event, Emitter<ActionState> emit) {
    int newState = _stateMachine!.dispatch(event);
    if (newState >= 0) {
      //emit(ResultStates.values[newState]);
      ActionState nextState = ActionState(ActionStates.values[newState]);
      nextState.setMessage(event.getData());
      emit(nextState);
    }
  }

  @override
  void onChange(Change<ActionState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(Transition<Event, ActionState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  void idle() {
    add(Idle());
  }

  void secceeded(String cause) {
    add(Succeeded.attr(cause));
  }

  void failed(String cause) {
    add(Failed.attr(cause));
  }
}
