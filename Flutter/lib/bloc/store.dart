import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_state.dart';

import 'counter_bloc/counter_bloc.dart';
import 'login_bloc/login_bloc.dart';

class Store extends StatelessWidget {

  final Widget child;

  const Store({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => LoginBloc())
      ], 
      child: child
    );
  }
}