import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test/bloc/bloc.dart';
import 'package:test/bloc/state.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is InternetGainState) {
        
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  
                  content: Text("Connected With Internet")));
          
          } else if (state is InternetLostState) {
         

            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Disconnected With Internet")));
          }
        },
        builder: (context, state) {
          if (state is InternetGainState) {
            return const Text("Connected with Data !");
          } else {
            return const Text("DisConnected with Data !");
          }
        },
      ),
    );
  }
}
