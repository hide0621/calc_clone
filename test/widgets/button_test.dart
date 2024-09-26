import 'package:calc_clone/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Button", (tester) async {
    /// テストコードを記述
    ///
    /// ウィジェットテストでは実際にエミュレータ（実機含む）を使わずとも、
    /// 下記の記述をすることでウィジェットのテストが可能
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

  /// ボタンが押された時[onPressed]の振る舞いをテスト
  group("押された時の処理", () {
    testWidgets("1", (tester) async {
      /// ボタンが押された時の処理を確認するための変数
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

  group("色", () {
    testWidgets("1", (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Button("1", Colors.black, Colors.white, null),
      ));

      await tester.pump();

      /// MaterialApp内のウィジェット（今回はButtonウィジェット）を取得
      Finder finder = find.byType(Material);
      Material material = tester.widget(finder);

      /// 上記で取得したButtonウィジェットの背景色とテキストの色をアサーション
      expect(material.color, Colors.black);
      expect(material.textStyle?.color, Colors.white);
    });

    testWidgets("2", (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Button("2", Colors.white, Colors.black, null),
      ));

      await tester.pump();

      Finder finder = find.byType(Material);
      Material material = tester.widget(finder);

      expect(material.color, Colors.white);
      expect(material.textStyle?.color, Colors.black);
    });
  });
}
