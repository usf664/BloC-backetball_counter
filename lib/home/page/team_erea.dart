import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home.dart';

class TeamErea extends StatelessWidget {
  const TeamErea({super.key, required this.teamName, required this.label});
  final String teamName;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Team $teamName', style: const TextStyle(fontSize: 32)),
          Text(label, style: const TextStyle(fontSize: 150)),
          MyButton(
            onPressed: () =>
                context.read<CounterCubit>().increment(teamName, 1),
            label: 'Add 1 Point',
          ),
          MyButton(
            onPressed: () =>
                context.read<CounterCubit>().increment(teamName, 2),
            label: 'Add 2 Point',
          ),
          MyButton(
            onPressed: () =>
                context.read<CounterCubit>().increment(teamName, 3),
            label: 'Add 3 Point',
          ),
        ],
      ),
    );
  }
}
