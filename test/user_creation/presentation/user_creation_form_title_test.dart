/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/feature/user_creation/presentation/sections/form/user_creation_form_tile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

main() {
  testWidgets('UserCreationFormTile renders correctly',
      (WidgetTester tester) async {
    final controller = TextEditingController();
    final isValid = RxBool(true);

    await tester.pumpWidget(GetMaterialApp(
        home: Scaffold(
      body: UserCreationFormTile(
        controller: controller,
        title: 'title',
        hint: 'hint',
        isValid: isValid,
        onTap: () {},
      ),
    )));

    expect(find.byType(UserCreationFormTile), findsOneWidget);
  });

  testWidgets('TextField shows correct hint and color based on isValid',
      (WidgetTester tester) async {
    final controller = TextEditingController();
    final isValid = RxBool(true);

    await tester.pumpWidget(GetMaterialApp(
        home: Scaffold(
      body: UserCreationFormTile(
        controller: controller,
        title: 'title',
        hint: 'hint',
        isValid: isValid,
        onTap: () {},
      ),
    )));

    // Find TextField and validate hint and color
    Widget field = find.byType(TextField).evaluate().first.widget;

    if (field is TextField) {
      expect(field.decoration!.hintText, 'hint');
      expect(field.decoration!.hintStyle!.color, validFormColor);
    }
  });

  testWidgets('onTap and onEdit callbacks are executed correctly',
      (WidgetTester tester) async {
    final controller = TextEditingController();
    final isValid = RxBool(true);
    bool wasOnTappedCalled = false;
    bool wasOnEditCalled = false;

    await tester.pumpWidget(GetMaterialApp(
        home: Scaffold(
      body: UserCreationFormTile(
        controller: controller,
        title: 'title',
        hint: 'hint',
        isValid: isValid,
        onTap: () {
          wasOnTappedCalled = true;
        },
        editable: true,
        onEdit: () {
          wasOnEditCalled = true;
        },
      ),
    )));

    await tester.tap(find.byKey(const Key('user_creation_form_ink_well')));
    expect(wasOnTappedCalled, false);

    await tester.enterText(find.byType(TextField), 'Test');
    expect(wasOnEditCalled, true);
  });

  testWidgets('onTap and onEdit callbacks are executed correctly',
          (WidgetTester tester) async {
        final controller = TextEditingController();
        final isValid = RxBool(true);
        bool wasOnTappedCalled = false;
        bool wasOnEditCalled = false;

        await tester.pumpWidget(GetMaterialApp(
            home: Scaffold(
              body: UserCreationFormTile(
                controller: controller,
                title: 'title',
                hint: 'hint',
                isValid: isValid,
                onTap: () {
                  wasOnTappedCalled = true;
                },
                editable: false,
                onEdit: () {
                  wasOnEditCalled = true;
                },
              ),
            )));

        await tester.tap(find.byKey(const Key('user_creation_form_ink_well')));
        expect(wasOnTappedCalled, true);

        await tester.enterText(find.byType(TextField), 'Test');
        expect(wasOnEditCalled, false);
      });
}
