import 'package:calc_clone/widgets/button.dart';
import 'package:calc_clone/widgets/keypad.dart';
import 'package:flutter/cupertino.dart';
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
      /// 演算子やパーセントなどは後述の「アイコン」のテストで確認する
      expect(find.text('+'), findsNothing);
      expect(find.text('='), findsNothing);
    });

    testWidgets('アイコン', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: KeyPad(null),
        ),
      );

      await tester.pump();

      /// キーパッド上にアイコンが表示されているか確認
      /// アイコンはCupertinoIconsを使用しているため、Cupertinoのアイコンが表示される
      /// このアプリはiOS用のため、CupertinoIconsを使用している
      expect(find.byIcon(CupertinoIcons.plus_slash_minus), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.percent), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.plus), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.equal), findsOneWidget);
    });
  });

  group("キータップ", () {
    testWidgets("数字", (tester) async {
      /// キーパッドでの連続入力を確認するための変数
      String result = "";
      FunctionOnPressed onPress = (text) {
        result = result + text;
      };

      await tester.pumpWidget(
        MaterialApp(
          home: KeyPad(onPress),
        ),
      );

      await tester.pump();

      await tester.tap(find.text("1"));
      await tester.tap(find.text("2"));
      await tester.tap(find.text("3"));
      await tester.tap(find.text("4"));
      await tester.tap(find.text("5"));
      await tester.tap(find.text("6"));
      await tester.tap(find.text("7"));
      await tester.tap(find.text("8"));
      await tester.tap(find.text("9"));
      await tester.tap(find.text("0"));

      expect(result, "1234567890");
    });
  });
}
