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
}
