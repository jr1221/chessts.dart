import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  test('get', () {
    final Chess chess = Chess();

    expect(chess.get(Square.a2), Piece(Color.white, Chess.pawn));
    expect(chess.get(Square.a7), Piece(Color.black, Chess.pawn));
  });

  test('get - returns false for empty square', () {
    final Chess chess = Chess();

    expect(chess.get(Square.a4), null);
  });
}
