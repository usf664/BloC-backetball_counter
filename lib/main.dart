import 'package:basketball_counter/home/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const PointsCounter());
}

class PointsCounter extends StatelessWidget {
  const PointsCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: HomeScaffold(),
      ),
    );
  }
}

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Points Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Team A', style: TextStyle(fontSize: 32)),
                    Text(
                      context.watch<CounterCubit>().state.counterA.toString(),
                      style: const TextStyle(fontSize: 150),
                    ),
                    MyButton(
                      onPressed: () =>
                          context.read<CounterCubit>().increment('A', 1),
                      label: 'Add 1 Point',
                    ),
                    MyButton(
                      onPressed: () =>
                          context.read<CounterCubit>().increment('A', 2),
                      label: 'Add 2 Point',
                    ),
                    MyButton(
                      onPressed: () =>
                          context.read<CounterCubit>().increment('A', 3),
                      label: 'Add 3 Point',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 500,
                child: VerticalDivider(
                  indent: 50,
                  endIndent: 50,
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              SizedBox(
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Team B', style: TextStyle(fontSize: 32)),
                    Text(
                      context.watch<CounterCubit>().state.counterB.toString(),
                      style: const TextStyle(fontSize: 150),
                    ),
                    MyButton(
                      onPressed: () =>
                          context.read<CounterCubit>().increment('B', 1),
                      label: 'Add 1 Point',
                    ),
                    MyButton(
                      onPressed: () =>
                          context.read<CounterCubit>().increment('B', 2),
                      label: 'Add 2 Point',
                    ),
                    MyButton(
                      onPressed: () =>
                          context.read<CounterCubit>().increment('B', 3),
                      label: 'Add 3 Point',
                    ),
                  ],
                ),
              ),
            ],
          ),
          MyButton(
            label: 'Reset',
            onPressed: () {
              context.read<CounterCubit>().reset();
            },
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({required this.label, required this.onPressed, super.key});
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8),
        backgroundColor: Colors.orange,
        minimumSize: const Size(150, 50),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
