import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokemon_flutter/bloc/storage/storage_bloc.dart';
import 'package:pokemon_flutter/data/data_provider/storage_data_provider.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_data_provider.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_details_data_provider.dart';
import 'package:pokemon_flutter/data/repository/storage_repository.dart';
import 'package:pokemon_flutter/data/repository/pokemon_repository.dart';
import 'package:pokemon_flutter/ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PokemonRepository(
              PokemonDataProvider(), PokemonDetailsDataProvider()),
        ),
        RepositoryProvider(
          create: (context) => StorageRepository(StorageDataProvider()),
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
        ],
        child: MaterialApp(
          title: 'Pokemon App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
