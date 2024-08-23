import 'package:calc_clone/logic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("1をそのまま出力", () {
    final logic = Logic();
    logic.input('1');
    expect(logic.text, '1');
  });

  test("2をそのまま出力", () {
    final logic = Logic();
    logic.input('2');
    expect(logic.text, '2');
  });

  test("3をそのまま出力", () {
    final logic = Logic();
    logic.input('3');
    expect(logic.text, '3');
  });
}
