import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  test('get', () {
    final Chess chess = Chess();

    expect(chess.get(Square.a2), Piece(Color.WHITE, Chess.PAWN));
    expect(chess.get(Square.a7), Piece(Color.BLACK, Chess.PAWN));
  });

  test('get - returns false for empty square', () {
    final Chess chess = Chess();

    expect(chess.get(Square.a4), null);
  });
}
