import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  // 15 s, spricht die Sekunden müssen variable werden
  // Buttons brauchen Funktionen
  // Reset Button: Alle Variablen zurücksetzen
  // Start Button: Stopwatch starten
  // Stop Button: Stopwatch stoppen
  // Ein Funktion dass wir die Sekunden hoch zu zählen
  // Set State Functionen damit sich das UI updated
  // Future & Async Function um auf die Zeit warten

  int showSeconds = 0;
  bool running = false;

  runTime() async {
    while (running) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        showSeconds = showSeconds + 100;
      });
    }
  }

  startWatch() {
    // Kannst den Funktion nur aus führen wenn der Start Button nicht gedrückt ist.
    if (!running) {
      running = true;
      runTime();
    }
  }

  stopWatch() {
    running = false;
  }

  resetWatch() {
    running = false;
    showSeconds = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stopwatch"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${showSeconds / 1000} s",
              style: const TextStyle(fontSize: 78, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: startWatch,
                  child: const Text("Start"),
                ),
                ElevatedButton(
                  onPressed: stopWatch,
                  child: const Text("Stop"),
                ),
                ElevatedButton(
                  onPressed: resetWatch,
                  child: const Text("Reset"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
