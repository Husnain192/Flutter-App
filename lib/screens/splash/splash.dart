import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    this.duration = const Duration(seconds: 2),
    this.nextScreen,
  });

  final Duration duration;
  final Widget? nextScreen;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showNextScreen = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.duration, () {
      if (!mounted) return;
      setState(() => _showNextScreen = true);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_showNextScreen) {
      return widget.nextScreen ?? const Home();
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.auto_awesome,
              size: 72,
              color: AppColors.highlightColor,
            ),
            const SizedBox(height: 16),
            Text(
              'Flutter RPG',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Preparing your adventure...',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
