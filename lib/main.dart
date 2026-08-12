import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess Habit Tracker',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int streakCount = 0;
  String currentTip = '';
  final Random _random = Random();

  // Chess tips and quotes
  final List<String> chessTips = [
    '♟ Control the center of the board with your pawns and pieces.',
    '♟ Develop your pieces before attacking the opponent\'s king.',
    '♟ Protect your king early with castling.',
    '♟ Never move the same piece twice in the opening.',
    '♟ A passed pawn should be pushed.',
    '♟ Rooks belong on open files.',
    '♟ Knights on the rim are grim.',
    '♟ Two bishops can checkmate a lone king.',
    '♟ The best move is the one that improves your position.',
    '♟ Sacrifice material for a strong attack when justified.',
    '♟ Weak squares are worth more than weak pawns.',
    '♟ Your pieces should have multiple purposes.',
    '♟ In the opening, a master should play like a book.',
    '♟ In the middlegame, he should play like a machine.',
    '♟ In the endgame, he should play like a computer.',
    '♟ When in doubt, centralize your pieces.',
    '♟ Silence is also acceptable in chess.',
    '♟ The beauty of a move lies not in its appearance but in the thought behind it.',
    '♟ Combinations are the poetry of chess.',
    '♟ Every pawn is a potential queen.',
  ];

  @override
  void initState() {
    super.initState();
    _getRandomTip();
  }

  void _getRandomTip() {
    setState(() {
      currentTip = chessTips[_random.nextInt(chessTips.length)];
    });
  }

  void _incrementStreak() {
    setState(() {
      streakCount++;
    });
  }

  void _decrementStreak() {
    setState(() {
      if (streakCount > 0) {
        streakCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Header
              Column(
                children: [
                  Text(
                    'Chess Habit Tracker',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Daily Puzzles Solved',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              // Streak Counter Section
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Large Counter Display
                  Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFFF9600),
                        width: 3,
                      ),
                    ),
                    child: Text(
                      '$streakCount',
                      style: const TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF9600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Control Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _decrementStreak,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF9600),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(20),
                          elevation: 0,
                        ),
                        child: const Text(
                          '−',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF121212),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      ElevatedButton(
                        onPressed: _incrementStreak,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF9600),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(20),
                          elevation: 0,
                        ),
                        child: const Text(
                          '+',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF121212),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Chess Tip Section
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFFF9600),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      currentTip,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        height: 1.6,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _getRandomTip,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF9600),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'New Chess Tip',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF121212),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
