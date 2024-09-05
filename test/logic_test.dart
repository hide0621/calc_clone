import 'package:calc_clone/logic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// ここではまだ初期化しない
  late Logic logic;

  /// setUp関数は、Dartのflutter_testパッケージで提供される関数で、
  /// 各テストが実行される前に必ず呼び出されるように設計されている
  setUp(() {
    /// ここで初期化
    logic = Logic();
  });

  group("整数", () {
    test("1をそのまま出力", () {
      expect(logic.text, '0');
      logic.input('1');
      expect(logic.text, '1');
    });

    test("2をそのまま出力", () {
      expect(logic.text, '0');
      logic.input('2');
      expect(logic.text, '2');
    });

    test("3をそのまま出力", () {
      expect(logic.text, '0');
      logic.input('3');
      expect(logic.text, '3');
    });

    test("連続でテスト", () {
      expect(logic.text, '0');
      logic.input('1');
      expect(logic.text, '1');
      logic.input('2');
      expect(logic.text, '12');
      logic.input('3');
      expect(logic.text, '123');
      logic.input('4');
      expect(logic.text, '1,234');
      logic.input('5');
      expect(logic.text, '12,345');
      logic.input('6');
      expect(logic.text, '123,456');
      logic.input('7');
      expect(logic.text, '1,234,567');
      logic.input('8');
      expect(logic.text, '12,345,678');
      logic.input('9');
      expect(logic.text, '123,456,789');
    });
  });

  group("小数", () {
    test("小数点の入力", () {
      expect(logic.text, '0');
      logic.input('1');
      expect(logic.text, '1');
      logic.input('.');
      expect(logic.text, '1.');
      logic.input('2');
      expect(logic.text, '1.2');
      logic.input('3');
      expect(logic.text, '1.23');
      logic.input('4');
      expect(logic.text, '1.234');
      logic.input('5');
      expect(logic.text, '1.2345');
      logic.input('6');
      expect(logic.text, '1.23456');
      logic.input('7');
      expect(logic.text, '1.234567');
      logic.input('8');
      expect(logic.text, '1.2345678');
      logic.input('9');
      expect(logic.text, '1.23456789');
    });

    test('0.00000000', () {
      expect(logic.text, '0');
      logic.input('0');
      logic.input('.');
      logic.input('0');
      logic.input('0');
      logic.input('0');
      logic.input('0');
      logic.input('0');
      logic.input('0');
      logic.input('0');
      logic.input('0');
      expect(logic.text, '0.00000000');
    });
  });

  group("getDisplayText", () {
    test("整数", () {
      expect(logic.getDisplayText(0), '0');
      expect(logic.getDisplayText(1), '1');
      expect(logic.getDisplayText(1234), '1,234');
      expect(logic.getDisplayText(56789), '56,789');
      expect(logic.getDisplayText(123456789), '123,456,789');
    });

    test("0の時", () {
      expect(logic.getDisplayText(0, numAfterPoint: 0), '0.');
      expect(logic.getDisplayText(0, numAfterPoint: 1), '0.0');
      expect(logic.getDisplayText(0, numAfterPoint: 8), '0.00000000');
    });

    test("小数点以下のみの時", () {
      expect(logic.getDisplayText(0.1, numAfterPoint: 1), '0.1');
      expect(logic.getDisplayText(0.12345678, numAfterPoint: 1), '0.12345678');
    });

    test("1以上で小数点かある時", () {
      expect(logic.getDisplayText(1.1, numAfterPoint: 1), '1.1');
      expect(logic.getDisplayText(12345.678, numAfterPoint: 1), '12,345.678');
    });
  });
}
