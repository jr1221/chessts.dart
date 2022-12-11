import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  test('reset', () {
    final Chess chess = Chess();
    chess.clear();
    chess.reset();
    expect(chess.fen(), Chess.DEFAULT_POSITION);
  });
}
