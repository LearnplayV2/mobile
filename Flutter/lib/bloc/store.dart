import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_bloc/login_bloc.dart';

class Store extends StatelessWidget {

  final Widget child;

  const Store({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc())
      ], 
      child: child
    );
  }
}