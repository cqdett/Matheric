/// author: J. Ponce
/// class: main.dart
/// version: 1.0
/// Product Ide: Intellij (Android Studio)
/// langue: dart
/// framework: flutter
/// github: github.com/cqdett
/// date: 08:29p.m 13/06/26 (Release Finished The Version Stable 2.3)
library;

import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jull App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.blue),
        fontFamily: 'starshiel',
      ),
      home: const HomePage(title: 'Julls App'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class MessageList {
  static const List<String> titles = [
    '!Atencion!',
    'De Parte De Conalep',
    'Presentamos al',
    ' ',
    'Presentaremos',
    'Presentaremos',
    'Presentaremos',
    ' ',
    'V.C.I',
    'Gracias',
    'Atentamente.',
    ' ',
    'Excelente Dia!',
  ];
  static const List<String> subtitles = [
    'Buena Tarde a Todos',
    'Colegio Nacional de Educación Profesional Técnica.',
    'Plantel Venustiano Carranza I',
    ' ',
    'Electronica, Programacion.',
    'Nuestro Aprendizaje',
    'Nuestra Comunidad',
    ' ',
    ' ',
    'Por Asistir y Participar.',
    'Docentes, Alumnos y Organizadores',
    'Conalep Venustiano Carranza I.',
    '!Suerte!',
  ];
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      setState(() {
        currentIndex++;

        if (currentIndex >= MessageList.titles.length) {
          currentIndex = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = MessageList.titles[currentIndex];
    final subtitle = MessageList.subtitles[currentIndex];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/img/sf.jpg", fit: BoxFit.cover),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
            child: Container(color: Colors.transparent),
          ),
          Container(color: Colors.black.withValues(alpha: 0.6)),

          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Image.asset("assets/img/cn.jpg", width: 190, height: 190),
                  const SizedBox(height: 30),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      title,
                      key: ValueKey(title),
                      textAlign: .center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 90,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 15,
                            offset: Offset(2, 2),
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      subtitle,
                      key: ValueKey(subtitle),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 15,
                            offset: Offset(2, 2),
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
