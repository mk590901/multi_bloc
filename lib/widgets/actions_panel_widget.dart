import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bloc_action.dart';
import '../states/action_states.dart';

class ActionsPanelWidget extends StatelessWidget {

  const ActionsPanelWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActionBloc, ActionState>(
      builder: (context, state) {
        return Center(
          child: Column(children: <Widget>[
            const SizedBox(height: 32,),
            Text(
              state.state().name,
              //'${state.state().name}:${state.message()}',
              style: const TextStyle(fontSize: 24.0, color: Colors.blue),
            ),

            const SizedBox(height: 32,),

            CircularProgressIndicator(
              backgroundColor:
                state.message() == 'Run!' ? Colors.blueAccent : Colors.transparent,
              valueColor: AlwaysStoppedAnimation(
                state.message() == 'Run!' ? Colors.blueGrey : Colors.transparent),
              strokeWidth: 10,
            ),
          ]),
        );
      },
    );
  }
}
