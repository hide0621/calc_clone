import 'package:calc_clone/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("initialized", () {
    testWidgets("number", (tester) async {
      /// インテグレーションテスト対象のアプリを起動
      app.main();

      /// 上記のアプリが起動するまで待機（[await]は必須）
      await tester.pumpAndSettle();

      /// 「0」と言う数字テキストはボタン部分と表示部分の両方にあるため以下のようにテストする
      expect(find.text(0.toString()), findsNWidgets(2));

      for (int i = 1; i < 10; i++) {
        expect(find.text(i.toString()), findsOneWidget);
      }
    });
  });
}
