import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/cubit%20and%20api/getcubit.dart';
import 'package:test/cubit%20and%20api/getsatate.dart';

class Dataui extends StatelessWidget {
  const Dataui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<GetCubit, InitialSatate>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadedSatate) {
          return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                var data = state.data[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Lenght is ${state.data.length}"),
                    Text(" id : ${data.id}"),
                    Text(" userId : ${data.userId}"),
                    Text(" title : ${data.title}"),
                    Text("Body : ${data.body}"),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              });
        } else if (state is LoadingSatate) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container();
      },
    ));
  }
}
