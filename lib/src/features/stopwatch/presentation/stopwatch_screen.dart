import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  // Es gibt ein paar wichtige Variablen im Code:

  int showMilliseconds = 0;
  bool isRunning = false;
  bool isStopped = false;
  List<String> records = [];

// Buttons brauchen Funktionen.

  // Ein Funktion dass wir die Sekunden hoch zu zählen
  // Set State Functionen damit sich das UI updated
  // Future & Async Function um auf die Zeit warten
  runTime() async {
    while (isRunning) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        showMilliseconds = showMilliseconds + 100;
      });
    }
  }

// Start Button: Stopwatch starten
  startWatch() {
    if (!isRunning) {
      isRunning = true;
      runTime();
    }
  }

// Stop Button: Stopwatch stoppen
  stopWatch() {
    isRunning = false;
    isStopped = true;
  }

// Reset Button: Alle Variablen zurücksetzen
  resetWatch() {
    isRunning = false;
    isStopped = false;
    showMilliseconds = 0;
    records.clear();
    setState(() {});
  }

// Zeitstempel erfassen, wenn der Benutzer auf Record-Taste drückt.
  addRecord() {
    records.add("${records.length + 1}. Record: ${showMilliseconds / 1000} s");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stopwatch"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 50),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  "${showMilliseconds / 1000}",
                  style: GoogleFonts.robotoMono(
                    fontSize: 78,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed:
                        isRunning ? addRecord : (isStopped ? resetWatch : null),
                    child: Text(isRunning
                        ? "Record"
                        : (isStopped ? "Reset" : "Record")),
                  ),
                  ElevatedButton(
                    onPressed: isRunning
                        ? stopWatch
                        : (isStopped ? startWatch : startWatch),
                    child: Text(isRunning
                        ? "Stop"
                        : (isStopped ? "Continue" : "Start")),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: records.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(records[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
