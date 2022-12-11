import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  test('moves', () {
    final Chess chess = Chess();
    final String moves =
        'a3 a4 b3 b4 c3 c4 d3 d4 e3 e4 f3 f4 g3 g4 h3 h4 Na3 Nc3 Nf3 Nh3';
    expect(chess.moves(generateSan: true).map((Move e) => (e as SanMove).san),
        containsAll(moves.split(' ')));
  });

  test('moves - single square', () {
    final Chess chess = Chess();
    final String moves = 'e3 e4';
    expect(chess.moves(square: Square.e2, generateSan: true).map((Move e) => (e as SanMove).san),
        containsAll(moves.split(' ')));
  });

  test('moves - single square - pinned piece', () {
    final Chess chess = Chess(
        fen:
            'rnbqk1nr/pppp1ppp/4p3/8/1b1P4/2N5/PPP1PPPP/R1BQKBNR w KQkq - 2 3');
    expect(chess.moves(square: Square.c3), <String>[]);
  });

  test('moves - single square - promotion', () {
    final Chess chess = Chess(fen: '8/k7/8/8/8/8/7p/K7 b - - 0 1');
    final String moves = 'h1=N h1=B h1=R+ h1=Q+';
    expect(chess.moves(square: Square.h2, generateSan: true).map((Move e) => (e as SanMove).san),
        containsAll(moves.split(' ')));
  });

  test('moves - single square - castling', () {
    final Chess chess = Chess(
        fen:
            'r1bq1rk1/1pp2ppp/p1np1n2/2b1p3/2B1P3/2NP1N2/PPPBQPPP/R3K2R w KQ - 0 8');
    final String moves = 'Kf1 Kd1 O-O O-O-O';
    expect(chess.moves(square: Square.e1, generateSan: true).map((Move e) => (e as SanMove).san),
        containsAll(moves.split(' ')));
  });

  test('moves - single square - no castling', () {
    final Chess chess = Chess(
        fen:
            'r1bq1rk1/1pp2ppp/p1np1n2/2b1p3/2B1P3/2NP1N2/PPPBQPPP/R3K2R w - - 0 8');
    final String moves = 'Kf1 Kd1';
    expect(chess.moves(square: Square.e1, generateSan: true).map((Move e) => (e as SanMove).san),
        containsAll(moves.split(' ')));
  });

  test('moves - single square - trapped king', () {
    final Chess chess = Chess(fen: '8/7K/8/8/1R6/k7/1R1p4/8 b - - 0 1');
    expect(chess.moves(square: Square.a3, generateSan: true).map((Move e) => (e as SanMove).san),
        <String>[]);
  });

  test('moves - single square ', () {
    final Chess chess = Chess(fen: '8/7K/8/8/1R6/k7/1R1p4/8 b - - 0 1');
    final List<Move> moves = <Move>[
      SanMove(
        color: Color.black,
        from: Square.d2,
        to: Square.d1,
        flags: [MoveTypes.normal, MoveTypes.promotion],
        piece: Chess.pawn,
        promotion: Chess.queen,
        san: 'd1=Q',
      ),
      SanMove(
        color: Color.black,
        from: Square.d2,
        to: Square.d1,
        flags: [MoveTypes.normal, MoveTypes.promotion],
        piece: Chess.pawn,
        promotion: Chess.rook,
        san: 'd1=R',
      ),
      SanMove(
        color: Color.black,
        from: Square.d2,
        to: Square.d1,
        flags: [MoveTypes.normal, MoveTypes.promotion],
        piece: Chess.pawn,
        promotion: Chess.bishop,
        san: 'd1=B',
      ),
      SanMove(
        color: Color.black,
        from: Square.d2,
        to: Square.d1,
        flags: [MoveTypes.normal, MoveTypes.promotion],
        piece: Chess.pawn,
        promotion: Chess.knight,
        san: 'd1=N',
      ),
    ];
    expect(chess.moves(square: Square.d2, generateSan: true), containsAll(moves));
  });
}
