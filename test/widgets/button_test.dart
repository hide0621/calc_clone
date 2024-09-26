import 'package:calc_clone/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Button", (tester) async {
    /// テストコードを記述
    await tester.pumpWidget(

        /// テスト対象のウィジェットを指定
        MaterialApp(
      home: Button("0", Colors.black, Colors.white, null),
    ));

    /// テスト対象のウィジェットが作成されるまで待つ
    await tester.pump();

    /// テスト対象のウィジェットが作成されたか確認
    expect(find.text("0"), findsOneWidget);
    expect(find.text("1"), findsNothing);
  });

  group("押された時の処理", () {
    testWidgets("1", (tester) async {
      String result = "";
      FunctionOnPressed onPressed = (String text) {
        result = text;
      };

      await tester.pumpWidget(MaterialApp(
        home: Button("1", Colors.black, Colors.white, onPressed),
      ));

      await tester.pump();

      /// ボタンを押す前の状態
      expect(result, "");

      /// テキスト "1" を持つウィジェットを検索し、タップする
      Finder finder = find.text("1");
      await tester.tap(finder);

      /// 上記でのタップをもとに、テスト対象のウィジェットが作成されたか確認
      expect(result, "1");
    });

    testWidgets("2", (tester) async {
      String result = "";
      FunctionOnPressed onPressed = (String text) {
        result = text;
      };

      await tester.pumpWidget(MaterialApp(
        home: Button("2", Colors.black, Colors.white, onPressed),
      ));

      await tester.pump();

      expect(result, "");

      await tester.tap(find.text("2"));

      expect(result, "2");
    });
  });
}
