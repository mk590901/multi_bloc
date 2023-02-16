import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../account_repository.dart';
import '../blocs/bloc_account.dart';
import '../blocs/bloc_action.dart';
import '../states/action_states.dart';
import 'home_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: RepositoryProvider(
        create: (context) => const AccountRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => AccountBloc(context)),
            BlocProvider(create: (_) => ActionBloc(context, ActionState(ActionStates.idle))),
          ],
          child: const HomeLayout(),
        ),
      ),

    );
  }
}
