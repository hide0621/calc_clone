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
}
