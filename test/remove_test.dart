import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  test('remove - returns piece', () {
    final Chess chess = Chess();
    expect(chess.remove(Square.d1), Piece(Color.WHITE, Chess.QUEEN));
    expect(chess.get(Square.d1), isNull);
  });

  test('remove - returns null for empty square', () {
    final Chess chess = Chess();
    expect(chess.remove(Square.e4), isNull);
  });
}
