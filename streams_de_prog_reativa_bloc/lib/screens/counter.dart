import 'package:streams_de_prog_reativa_bloc/components/container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Exemplo de contador utilizando Bloc
// Em duas variações

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}

class CounterContainer extends BlocContainer {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CounterCubit(), child: CounterView());
  }
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // não temos como saber quando devemos redesenhar
    // final state = context.bloc<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: Center(
        // ruim não sabemos quando rebuildar
        // child: Text("$state", style: textTheme.headline2),

        // é notificado quando deve ser rebuildado
        child: BlocBuilder<CounterCubit, int>(builder: (context, state) {
          return Text("$state", style: textTheme.headline2);
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            // abordagem 1 de como acessar o bloc
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}
