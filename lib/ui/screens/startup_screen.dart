import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/bloc/startup/startup_bloc.dart';
import 'package:pokemon_flutter/ui/screens/detail_screen.dart';
import 'package:pokemon_flutter/ui/screens/home_screen.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  late StartupBloc _startupBloc;

  @override
  void initState() {
    super.initState();
    _startupBloc = context.read<StartupBloc>();
    _startupBloc.add(StartupLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartupBloc, StartupState>(builder: (context, state) {
      if (state is StartupFailure) {
        return Center(
          child: Text(state.error),
        );
      }

      if (state is! StartupSuccess) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      }

      final route = state.destination;

      if (route == 'home') {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: ((context) {
          return const HomeScreen();
        })));
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: ((context) {
          return DetailScreen(id: state.id);
        })));
      }
    });
  }
}
