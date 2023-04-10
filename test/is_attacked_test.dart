import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

bool areAttacked(Chess chess, List<Square> squares, Color color) {
  return squares.fold<bool>(
      true,
      (acc, square) =>
          acc && chess.isAttacked(square: square, attackedBy: color));
}

bool areNotAttacked(Chess chess, List<Square> squares, Color color) {
  return !squares.fold<bool>(
      false,
      (acc, square) =>
          acc || chess.isAttacked(square: square, attackedBy: color));
}

void main() {
  test('isAttacked (white pawn attacks)', () {
    final Chess chess = Chess();

    // diagonal attacks
    chess.load(fen: '4k3/4p3/8/8/8/8/4P3/4K3 w - - 0 1');
    expect(areAttacked(chess, [Square.d3, Square.f3], Chess.white), true);
    expect(areNotAttacked(chess, [Square.d3, Square.f3], Chess.black), true);

    // small/big pawn moves aren't attacks
    expect(areNotAttacked(chess, [Square.e4, Square.e4], Chess.white), true);
  });

  test('isAttacked (black pawn attacks)', () {
    final Chess chess = Chess();

    // diagonal attacks
    chess.load(fen: '4k3/4p3/8/8/8/8/4P3/4K3 w - - 0 1');
    expect(areAttacked(chess, [Square.f6, Square.f6], Chess.black), true);
    expect(areNotAttacked(chess, [Square.f6, Square.d6], Chess.white), true);

    // small/big pawn moves aren't attacks
    expect(areNotAttacked(chess, [Square.e6, Square.e5], Chess.black), true);
  });

  test('isAttacked (knight)', () {
    final Chess chess = Chess(fen: '4k3/4p3/8/8/4N3/8/8/4K3 w - - 0 1');

    final List<Square> squares = [
      Square.d2,
      Square.f2,
      Square.c3,
      Square.g3,
      Square.d6,
      Square.f6,
      Square.c5,
      Square.g5
    ];

    expect(areAttacked(chess, squares, Chess.white), true);
    expect(chess.isAttacked(square: Square.e4, attackedBy: Chess.white),
        false); // same square
  });

  test('isAttacked (bishop)', () {
    final Chess chess = Chess(fen: '4k3/4p3/8/8/4b3/8/8/4K3 w - - 0 1');

    final List<Square> squares = [
      Square.b1,
      Square.c2,
      Square.d3,
      Square.f5,
      Square.g6,
      Square.h7,
      Square.a8,
      Square.b7,
      Square.c6,
      Square.d5,
      Square.f3,
      Square.g2,
      Square.h1,
    ];
    expect(areAttacked(chess, squares, Chess.black), true);
    expect(chess.isAttacked(square: Square.e4, attackedBy: Chess.black),
        false); // same square
  });

  test('isAttacked (rook)', () {
    final Chess chess = Chess(fen: '4k3/4n3/8/8/8/4R3/8/4K3 w - - 0 1');

    final List<Square> squares = [
      Square.e1, // yes, we can attack our own color
      Square.e2,
      Square.e4,
      Square.e5,
      Square.e6,
      Square.e7,
      Square.a3, Square.b3,
      Square.c3,
      Square.d3,
      Square.f3,
      Square.g3,
      Square.h3,
    ];
    expect(areAttacked(chess, squares, Chess.white), true);
    expect(chess.isAttacked(square: Square.e3, attackedBy: Chess.white),
        false); // same square
  });

  test('isAttacked (queen)', () {
    final Chess chess = Chess(fen: '4k3/4n3/8/8/8/4q3/4P3/4K3 w - - 0 1');

    final List<Square> squares = [
      Square.e2,
      Square.e4,
      Square.e5,
      Square.e6,
      Square.e7, // yes, we can attack our own color
      Square.a3,
      Square.b3,
      Square.c3,
      Square.d3,
      Square.f3,
      Square.g3,
      Square.h3,
      Square.c1,
      Square.d2,
      Square.f4,
      Square.g5,
      Square.h6,
      Square.g1,
      Square.f2,
      Square.d4,
      Square.c5,
      Square.b6,
      Square.a7,
    ];

    expect(areAttacked(chess, squares, Chess.black), true);
    expect(chess.isAttacked(square: Square.e3, attackedBy: Chess.black),
        false); // same square
  });

  test('isAttacked (king)', () {
    final Chess chess = Chess(fen: '4k3/4n3/8/8/8/4q3/4P3/4K3 w - - 0 1');

    final List<Square> squares = [
      Square.e2, // yes, we can attack our own color
      Square.d1,
      Square.d2,
      Square.f1,
      Square.f2,
    ];
    expect(areAttacked(chess, squares, Chess.white), true);
    expect(chess.isAttacked(square: Square.e1, attackedBy: Chess.white),
        false); // same square
  });

  test('isAttacked (pinned pieces still attacks)', () {
    // pinned pawn, but still is an attacked square
    final Chess chess = Chess(fen: '4k3/4r3/8/8/8/8/4P3/4K3 w - - 0 1');
    expect(areAttacked(chess, [Square.d3, Square.f3], Chess.white), true);
  });

  test('isAttacked (no x-ray)', () {
    final Chess chess = Chess(fen: '4k3/4n3/8/8/8/4q3/4P3/4K3 w - - 0 1');
    expect(areNotAttacked(chess, [Square.e1], Chess.black), true);
  });
}
