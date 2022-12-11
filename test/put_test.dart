import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  test('put', () {
    final Chess chess = Chess();
    chess.clear();

    final Piece piece = Piece(Color.BLACK, Chess.ROOK);
    expect(chess.put(piece, Square.a1), true);
    expect(chess.get(Square.a1), piece);
  });

//test('put - capitalized square', () => {
//  const chess = new Chess()
//  chess.clear()
//
//  const piece = { type: ROOK, color: BLACK }
//  expect(chess.put(piece, 'A1')).toEqual(true)
//  expect(chess.get('a1')).toEqual(piece)
//})

  test('put - disallow two white kings', () {
    final Chess chess = Chess();
    chess.clear();
    final Piece piece = Piece(Color.WHITE, Chess.KING);
    expect(chess.put(piece, Square.a2), true);
    expect(chess.put(piece, Square.a3), false);
  });

  test('put - disallow two black kings', () {
    final Chess chess = Chess();
    chess.clear();
    final Piece piece = Piece(Color.BLACK, Chess.KING);
    expect(chess.put(piece, Square.e8), true);
    expect(chess.put(piece, Square.d8), false);
  });

  test('put - allow two kings if overwriting the same square', () {
    final Chess chess = Chess();
    chess.clear();
    final Piece piece = Piece(Color.WHITE, Chess.KING);
    expect(chess.put(piece, Square.a2), true);
    expect(chess.put(piece, Square.a2), true);
  });
}
