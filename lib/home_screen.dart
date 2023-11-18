import 'package:bloc_practice/bloc/internet_bloc.dart';
import 'package:bloc_practice/bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is InternetGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Internet Conneted!'),
              backgroundColor: Colors.green,
            ));
          } else if (state is InternetLostState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Internet Not Conneted!'),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          if (state is InternetGainedState) {
            return Text('Connected!');
          } else if (state is InternetLostState) {
            return Text('Not Connected!');
          } else {
            return Text('Loading...');
          }
        },
      ))),
    );
  }
}
