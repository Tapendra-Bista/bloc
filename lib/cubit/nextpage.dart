import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/inputvalidation/bloc.dart';
import 'package:test/inputvalidation/event.dart';
import 'package:test/inputvalidation/state.dart';

class Nextpage extends StatefulWidget {
  const Nextpage({super.key});

  @override
  State<Nextpage> createState() => _NextpageState();
}

class _NextpageState extends State<Nextpage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(" This is a next page "),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: TextField(
              controller: _controller,
              onChanged: (value) {
                BlocProvider.of<InputBloc>(context, listen: false)
                    .add(InputEvent(_controller.text));
              },
              decoration: const InputDecoration(hintText: "Username"),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          nameValidation(),
          const SizedBox(
            height: 5,
          ),
          blocforbutton(),
          const SizedBox(
            height: 5,
          ),
          blocforConform(),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, "/data");
            },
            color: Colors.blueAccent,
            child: const Text("Go to next page"),
          ),
        ],
      ),
    );
  }

  Widget nameValidation() {
    return BlocBuilder<InputBloc, InputSate>(
      builder: (context, state) {
        if (state is InvalideSate) {
          return Text(
            state.error,
            style: const TextStyle(color: Colors.red),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget blocforbutton() {
    return BlocBuilder<InputBloc, InputSate>(
      builder: (context, state) {
        return MaterialButton(
          color: state is ValideSate ? Colors.blue : Colors.grey,
          onPressed: () {
            state is ValideSate
                ? BlocProvider.of<InputBloc>(context, listen: false)
                    .add(OnclickEven())
                : Container();
          },
          child: const Text("Conform"),
        );
      },
    );
  }

  Widget blocforConform() {
    return BlocBuilder<InputBloc, InputSate>(
      builder: (context, state) {
        if (state is OnbuttonClick) {
          return Text(state.result,
              style: const TextStyle(color: Colors.green));
        } else {
          return Container();
        }
      },
    );
  }
}
