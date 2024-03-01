import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemon_flutter/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokemon_flutter/bloc/pokemon_berry/pokemon_berry_bloc.dart';
import 'package:pokemon_flutter/bloc/pokemon_detail/pokemon_detail_bloc.dart';
import 'package:pokemon_flutter/bloc/startup/startup_bloc.dart';
import 'package:pokemon_flutter/bloc/storage/storage_bloc.dart';
import 'package:pokemon_flutter/data/data_provider/storage_data_provider.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_list_data_provider.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_detail_data_provider.dart';
import 'package:pokemon_flutter/data/repository/pokemon_berry_repository.dart';
import 'package:pokemon_flutter/data/repository/pokemon_detail_repository.dart';
import 'package:pokemon_flutter/data/repository/storage_repository.dart';
import 'package:pokemon_flutter/data/repository/pokemon_repository.dart';
import 'package:pokemon_flutter/ui/screens/detail_screen.dart';
import 'package:pokemon_flutter/ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PokemonRepository(
              PokemonResourceListDataProvider(),
              PokemonResourceDetailDataProvider()),
        ),
        RepositoryProvider(
          create: (context) => StorageRepository(StorageDataProvider()),
        ),
        RepositoryProvider(
          create: (context) =>
              PokemonDetailRepository(PokemonResourceDetailDataProvider()),
        ),
        RepositoryProvider(
          create: (context) => PokemonBerryRepository(
              PokemonResourceListDataProvider(),
              PokemonResourceDetailDataProvider()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PokemonBloc(context.read<PokemonRepository>()),
          ),
          BlocProvider(
            create: (context) => StorageBloc(context.read<StorageRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                PokemonDetailBloc(context.read<PokemonDetailRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                PokemonBerryBloc(context.read<PokemonBerryRepository>()),
          ),
          BlocProvider(
            create: (context) => StartupBloc(context.read<StorageRepository>()),
          ),
        ],
        child: MaterialApp(
          title: 'Pokemon App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          // home: const HomeScreen(),
          // home: const DetailScreen(id: 1),
          home: BlocBuilder<StartupBloc, StartupState>(
            builder: (context, state) {
              StartupBloc startupBloc = context.read<StartupBloc>();
              startupBloc.add(StartupLoaded());
              if (state is! StartupSuccess) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (state.destination == 'detail') {
                return DetailScreen(id: state.id);
              } else {
                return const HomeScreen();
              }
            },
          ),
        ),
      ),
    );
  }
}
