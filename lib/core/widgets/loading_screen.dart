import 'dart:async';

import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key, this.text});

  final String? text;

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  int _currentTextIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTextAnimation();
  }

  void _startTextAnimation() {
    List<String> loadingTexts =
        widget.text != null ? ["${widget.text}", "${widget.text}.", "${widget.text}..", "${widget.text}..."] : ["Cargando", "Cargando.", "Cargando..", "Cargando..."];

    Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _currentTextIndex = (_currentTextIndex + 1) % loadingTexts.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> loadingTexts =
        widget.text != null ? ["${widget.text}", "${widget.text}.", "${widget.text}..", "${widget.text}..."] : ["Cargando", "Cargando.", "Cargando..", "Cargando..."];

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.05),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 48,
              width: 48,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                strokeWidth: 6,
              ),
            ),
            SizedBox(height: 20),
            Text(
              loadingTexts[_currentTextIndex],
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
