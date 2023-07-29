

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bloc/bloc.dart';
import 'package:test/cubit%20and%20api/getcubit.dart';
import 'package:test/cubit%20and%20api/ui1.dart';
import 'package:test/cubit/cubic.dart';
import 'package:test/cubit/nextpage.dart';
import 'package:test/cubit/ui.dart';
import 'package:test/inputvalidation/bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create:(context)=>GetCubit()),
    BlocProvider(
      create: (context) => InternetBloc(),
    ),
    BlocProvider(
      create: (context) => InternetCubit(),
    ),
    BlocProvider(create: (context) => InputBloc())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/data": (context) => const Dataui(),
        "/next": (context) => const Nextpage()
      },
      debugShowCheckedModeBanner: false,
      home: BlocListener<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state == InternetState.gain) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Connected wifi with cubit")));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Disconnected wifi with cubit")));
          }
        },
        child: const Homeui(),
      ),
    );
  }
}
