import 'package:calc_clone/widgets/keypad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("テキスト", () {
    testWidgets("数字", (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: KeyPad(null),
        ),
      );

      await tester.pump();

      /// キーパッド上に数字が表示されているか確認
      for (int i = 0; i < 10; i++) {
        expect(find.text(i.toString()), findsOneWidget);
      }
    });
  });
}
