import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:guess_o_rama/screens/home_screen.dart';
import 'package:guess_o_rama/screens/playing_screen.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';
import 'package:guess_o_rama/widgets/custom_button.dart';

class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key, required this.numToGuess});
  final int numToGuess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numOfGuessesForRecentGame = Utils().getNumOfGuessesList(ref).last;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Text("That's right! My number was $numToGuess"),
          Text('You took $numOfGuessesForRecentGame tries to guess my number'),
          CustomButton(
            onPressed: () => Utils().moveToNewScreen(
              context,
              const HomeScreen(),
            ),
            text: 'Home',
          ),
          CustomButton(
            onPressed: () => Utils().moveToNewScreen(
              context,
              const PlayingScreen(),
            ),
            text: 'Play Again',
          ),
        ],
      ),
    );
  }
}
