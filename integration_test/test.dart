import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:clear_path_feedback/flutter_flow/flutter_flow_icon_button.dart';
import 'package:clear_path_feedback/flutter_flow/flutter_flow_widgets.dart';
import 'package:clear_path_feedback/flutter_flow/flutter_flow_theme.dart';
import 'package:clear_path_feedback/index.dart';
import 'package:clear_path_feedback/main.dart';
import 'package:clear_path_feedback/flutter_flow/flutter_flow_util.dart';

import 'package:clear_path_feedback/backend/firebase/firebase_config.dart';
import 'package:clear_path_feedback/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();

    await FlutterFlowTheme.initialize();
  });

  setUp(() async {
    await authManager.signOut();
  });

  testWidgets('Create an Account', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(const MyApp());
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.enterText(find.byKey(const ValueKey('Signup-Email_3jcf')),
        'testing@firebase.edu');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(const ValueKey('Signup-Password_wt4p')), 'password');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(const ValueKey('Signup-ConfirmPassword_7kco')), 'password');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.scrollUntilVisible(
      find.byKey(const ValueKey('Signup-Button_js59')),
      300.0,
      scrollable: find
          .descendant(
            of: find.byKey(const ValueKey('Column_mqv2')),
            matching: find.byType(Scrollable),
          )
          .first,
    );
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.tap(find.byKey(const ValueKey('Signup-Button_js59')));
    await tester.pumpAndSettle(const Duration(milliseconds: 30000));
    expect(find.byKey(const ValueKey('Container_cmzu')), findsOneWidget);
  });

  testWidgets('US2-User Login-Test1', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp(
      entryPage: LoginWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.tap(find.byKey(const ValueKey('LoginTab_tkoh')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('LoginTab_tkoh')));
    await tester.enterText(
        find.byKey(const ValueKey('Login-Email_p5vw')), 'rlacerda@uri.edu');
    await tester.enterText(
        find.byKey(const ValueKey('login_fuht')), 'test1234');
    await tester.tap(find.bySemanticsLabel(RegExp('login')));
    await tester.pumpAndSettle(const Duration(milliseconds: 2000));
    expect(find.byKey(const ValueKey('Feedbacks_1k93')), findsOneWidget);
  });

  testWidgets('US2-User Login-Test2', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp(
      entryPage: LoginWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.tap(find.byKey(const ValueKey('LoginTab_tkoh')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('LoginTab_tkoh')));
    await tester.enterText(
        find.byKey(const ValueKey('Login-Email_p5vw')), 'invalid@uri.edu');
    await tester.enterText(
        find.byKey(const ValueKey('login_fuht')), 'test1234');
    await tester.tap(find.bySemanticsLabel(RegExp('login')));
    await tester.pumpAndSettle(const Duration(milliseconds: 2000));
    expect(find.byKey(const ValueKey('login_fuht')), findsOneWidget);
  });

  testWidgets('US2-User Login-Test3', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp(
      entryPage: LoginWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.tap(find.byKey(const ValueKey('LoginTab_tkoh')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('LoginTab_tkoh')));
    await tester.enterText(
        find.byKey(const ValueKey('Login-Email_p5vw')), 'rlacerda@uri.edu');
    await tester.enterText(
        find.byKey(const ValueKey('login_fuht')), '1234test');
    await tester.tap(find.bySemanticsLabel(RegExp('login')));
    await tester.pumpAndSettle(const Duration(milliseconds: 2000));
    expect(find.byKey(const ValueKey('login_fuht')), findsOneWidget);
  });

  testWidgets('US3 - Onboarding', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp(
      entryPage: OnboardingWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.enterText(find.byKey(const ValueKey('Signup-Email_3jcf')),
        'testingonboarding@uri.edu');
    await tester.enterText(
        find.byKey(const ValueKey('Signup-Password_wt4p')), 'qazwsx123');
    await tester.enterText(
        find.byKey(const ValueKey('Signup-ConfirmPassword_7kco')), 'qazwsx123');
    await tester.tap(find.byKey(const ValueKey('Signup-Button_js59')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    // Checks Name field
    await tester.enterText(
        find.byKey(const ValueKey('Onboarding-Name_jtg3')), 'Test');
    // Checks Email field
    await tester.enterText(
        find.byKey(const ValueKey('Onboarding-Email_98ca')), 'test@gmail.com');
    await tester.enterText(
        find.byKey(const ValueKey('Onboarding-Password_8g4i')), 'qazwsx123');
    await tester.tap(find.byKey(const ValueKey('Button_ue3p')));
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
