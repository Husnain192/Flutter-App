import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/splash/splash.dart';

void main() {
  testWidgets('Splash screen renders and transitions to next screen',
      (WidgetTester tester) async {
    const readyText = 'Ready!';

    await tester.pumpWidget(
      const MaterialApp(
        home: SplashScreen(
          duration: Duration(milliseconds: 100),
          nextScreen: Scaffold(
            body: Text(readyText),
          ),
        ),
      ),
    );

    expect(find.text('Flutter RPG'), findsOneWidget);
    expect(find.text('Preparing your adventure...'), findsOneWidget);
    expect(find.text(readyText), findsNothing);

    await tester.pump(const Duration(milliseconds: 101));

    expect(find.text(readyText), findsOneWidget);
  });
}
