import 'package:calc_clone/main.dart' as app;
import 'package:flutter/cupertino.dart';
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

    testWidgets("character", (tester) async {
      app.main();

      await tester.pumpAndSettle();

      expect(find.text("C"), findsOneWidget);
      expect(find.text("."), findsOneWidget);

      /// 以下は文字ではなくアイコンで実装しているため、このテスト内容となる
      expect(find.text("+"), findsNothing);
      expect(find.text("="), findsNothing);

      /// 上記に加えて追記
      expect(find.text("x"), findsNothing);
      expect(find.text("-"), findsNothing);
      expect(find.text("%"), findsNothing);
    });

    testWidgets('icon', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.byIcon(CupertinoIcons.plus_slash_minus), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.percent), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.plus), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.equal), findsOneWidget);
    });
  });

  group("tap", () {
    testWidgets("tap1", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text("1"));

      /// 画面が更新（計算結果やタップ操作が反映）されるまで待たせる
      await tester.pump();

      expect(find.text("1"), findsNWidgets(2));

      /// 計算結果の部分[main]とButton部分でKeyを指定しているため、以下のテストにより一意に特定してテストができる
      /// 以下のテストは[button.dart]のButtonクラスで[Key(text)]としているため、このKeyのことを指している
      expect(find.byKey(const Key("1")), findsOneWidget);

      /// 計算結果の部分[main]とButton部分でKeyを指定しているため、以下のテストにより一意に特定してテストができる
      await tester.tap(find.byKey(const Key('1')));
    });

    testWidgets('number', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      /// こっちのKeyは[main.dart]のTextクラスで[Key('txtResult')]としているため、このKeyのことを指している
      Finder resultFinder = find.byKey(const Key('txtResult'));
      expect(tester.widget<Text>(resultFinder).data, '0');

      await tester.tap(find.text('1'));
      await tester.tap(find.text('2'));
      await tester.tap(find.text('3'));
      await tester.pump();
      expect(tester.widget<Text>(resultFinder).data, '123');

      await tester.tap(find.text('4'));
      await tester.tap(find.text('5'));
      await tester.tap(find.text('6'));
      await tester.tap(find.text('7'));
      await tester.tap(find.text('8'));
      await tester.tap(find.text('9'));
      await tester.pump();
      expect(tester.widget<Text>(resultFinder).data, '123,456,789');

      await tester.tap(find.text('0'));
      await tester.pump();
      expect(tester.widget<Text>(resultFinder).data, '123,456,789');
    });
  });
}
