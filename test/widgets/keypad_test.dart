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

    testWidgets('文字', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: KeyPad(null),
        ),
      );

      await tester.pump();
      expect(find.text('C'), findsOneWidget);
      expect(find.text('.'), findsOneWidget);

      /// 演算子は文字ではないので、テキストが存在しないことを確認
      /// 演算子やパーセントなどは「アイコン」のテストで確認する
      expect(find.text('+'), findsNothing);
      expect(find.text('='), findsNothing);
    });
  });
}
