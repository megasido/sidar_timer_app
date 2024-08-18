import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  // Die Buttons wurden optimiert
  // Zeitstempel erfassen, wenn der Benutzer auf Record-Taste drückt.

  int showSeconds = 0;
  bool running = false;
  bool stopped = false;
  List<String> records = [];

  runTime() async {
    while (running) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        showSeconds = showSeconds + 100;
      });
    }
  }

  startWatch() {
    if (!running) {
      running = true;
      runTime();
    }
  }

  stopWatch() {
    running = false;
    stopped = true;
  }

  resetWatch() {
    running = false;
    stopped = false;
    showSeconds = 0;
    records.clear();
    setState(() {});
  }

  addRecord() {
    records.add("${records.length + 1}. Record: ${showSeconds / 1000} s");
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
                  "${showSeconds / 1000}",
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
                        running ? addRecord : (stopped ? resetWatch : null),
                    child: Text(
                        running ? "Record" : (stopped ? "Reset" : "Record")),
                  ),
                  ElevatedButton(
                    onPressed: running
                        ? stopWatch
                        : (stopped ? startWatch : startWatch),
                    child: Text(
                        running ? "Stop" : (stopped ? "Continue" : "Start")),
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
