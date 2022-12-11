import 'package:chessts/chessts.dart';
import 'package:test/test.dart';

void main() {
  group('History', () {
    final Chess chess = Chess();
    final List<({String fen, List<dynamic> moves})> tests = <({String fen, List<dynamic> moves})>[
    (
        fen: '4q2k/2r1r3/4PR1p/p1p5/P1Bp1Q1P/1P6/6P1/6K1 b - - 4 41',
    moves: <String>[
          'c4',
          'e6',
          'Nf3',
          'd5',
          'd4',
          'Nf6',
          'Nc3',
          'Be7',
          'Bg5',
          'O-O',
          'e3',
          'h6',
          'Bh4',
          'b6',
          'cxd5',
          'Nxd5',
          'Bxe7',
          'Qxe7',
          'Nxd5',
          'exd5',
          'Rc1',
          'Be6',
          'Qa4',
          'c5',
          'Qa3',
          'Rc8',
          'Bb5',
          'a6',
          'dxc5',
          'bxc5',
          'O-O',
          'Ra7',
          'Be2',
          'Nd7',
          'Nd4',
          'Qf8',
          'Nxe6',
          'fxe6',
          'e4',
          'd4',
          'f4',
          'Qe7',
          'e5',
          'Rb8',
          'Bc4',
          'Kh8',
          'Qh3',
          'Nf8',
          'b3',
          'a5',
          'f5',
          'exf5',
          'Rxf5',
          'Nh7',
          'Rcf1',
          'Qd8',
          'Qg3',
          'Re7',
          'h4',
          'Rbb7',
          'e6',
          'Rbc7',
          'Qe5',
          'Qe8',
          'a4',
          'Qd8',
          'R1f2',
          'Qe8',
          'R2f3',
          'Qd8',
          'Bd3',
          'Qe8',
          'Qe4',
          'Nf6',
          'Rxf6',
          'gxf6',
          'Rxf6',
          'Kg8',
          'Bc4',
          'Kh8',
          'Qf4',
        ],
    ),
          (
        fen: '4q2k/2r1r3/4PR1p/p1p5/P1Bp1Q1P/1P6/6P1/6K1 b - - 4 41',
        moves: <Move>[
          SanMove(
            color: Color.white,
            from: Square.c2,
            to: Square.c4,
            flags: [MoveTypes.bigPawn],
            piece: Chess.pawn,
            san: 'c4',
          ),
    SanMove(
            color: Color.black,
            from: Square.e7,
            to: Square.e6,
            flags: [MoveTypes.normal],
            piece: Chess.pawn,
            san: 'e6',
          ),
    SanMove(
            color: Color.white,
            from: Square.g1,
            to: Square.f3,
            flags: [MoveTypes.normal],
            piece: Chess.knight,
            san: 'Nf3',
    ),
    SanMove(
            color: Color.black,
            from: Square.d7,
            to: Square.d5,
            flags: [MoveTypes.bigPawn],
            piece: Chess.pawn,
            san: 'd5',
          ),
    SanMove(
            color: Color.white,
            from: Square.d2,
            to: Square.d4,
            flags:[MoveTypes.bigPawn],
            piece: Chess.pawn,
            san: 'd4',
          ),
    SanMove(
    color: Color.black,
    from: Square.g8,
    to: Square.f6,
    flags: [MoveTypes.normal],
    piece: Chess.knight,
    san: 'Nf6',
    ),
    SanMove(
    color: Color.white,
    from: Square.b1,
    to: Square.c3,
    flags: [MoveTypes.normal],
    piece: Chess.knight,
    san: 'Nc3',
    ),
    SanMove(
    color: Color.black,
    from: Square.f8,
    to: Square.e7,
    flags: [MoveTypes.normal],
    piece: Chess.bishop,
    san: 'Be7',
    ),
    SanMove(
    color: Color.white,
    from: Square.c1,
    to: Square.g5,
    flags: [MoveTypes.normal],
    piece: Chess.bishop,
    san: 'Bg5',
    ),
    SanMove(
    color: Color.black,
    from: Square.e8,
    to: Square.g8,
    flags: [MoveTypes.ksideCastle],
    piece: Chess.king,
    san: 'O-O',
    ),
    SanMove(
    color: Color.white,
    from: Square.e2,
    to: Square.e3,
    flags: [MoveTypes.normal],
    piece: Chess.pawn,
    san: 'e3',
    ),
   SanMove(
    color: Color.black,
    from: Square.h7,
    to: Square.h6,
    flags: [MoveTypes.normal],
    piece: Chess.pawn,
    san: 'h6',
    ),
   SanMove(
    color: Color.white,
    from: Square.g5,
    to: Square.h4,
    flags: [MoveTypes.normal],
    piece: Chess.bishop,
    san: 'Bh4',
    ),
   SanMove(
    color: Color.black,
    from: Square.b7,
    to: Square.b6,
    flags: [MoveTypes.normal],
    piece: Chess.pawn,
    san: 'b6',
    ),
   SanMove(
    color: Color.white,
    from: Square.c4,
    to: Square.d5,
    flags: [MoveTypes.capture],
    piece: Chess.pawn,
    captured: Chess.pawn,
    san: 'cxd5',
    ),
   SanMove(
    color: Color.black,
    from: Square.f6,
    to: Square.d5,
    flags: [MoveTypes.capture],
    piece: Chess.knight,
    captured: Chess.pawn,
    san: 'Nxd5',
    ),
   SanMove(
    color: Color.white,
    from: Square.h4,
    to: Square.e7,
    flags: [MoveTypes.capture],
    piece: Chess.bishop,
    captured: Chess.bishop,
    san: 'Bxe7',
    ),
   SanMove(
    color: Color.black,
    from: Square.d8,
    to: Square.e7,
    flags: [MoveTypes.capture],
    piece: Chess.queen,
    captured: Chess.bishop,
    san: 'Qxe7',
    ),
   SanMove(
    color: Color.white,
    from: Square.c3,
    to: Square.d5,
    flags: [MoveTypes.capture],
    piece: Chess.knight,
    captured: Chess.knight,
    san: 'Nxd5',
    ),
   SanMove(
    color: Color.black,
    from: Square.e6,
    to: Square.d5,
    flags: [MoveTypes.capture],
    piece: Chess.pawn,
    captured: Chess.knight,
    san: 'exd5',
    ),
   SanMove(
    color: Color.white,
    from: Square.a1,
    to: Square.c1,
    flags: [MoveTypes.normal],
    piece: Chess.rook,
    san: 'Rc1',
    ),
   SanMove(
    color: Color.black,
    from: Square.c8,
    to: Square.e6,
    flags: [MoveTypes.normal],
    piece: Chess.bishop,
    san: 'Be6',
    ),
   SanMove(
    color: Color.white,
    from: Square.d1,
    to: Square.a4,
    flags: [MoveTypes.normal],
    piece: Chess.queen,
    san: 'Qa4',
    ),
   SanMove(
    color: Color.black,
    from: Square.c7,
    to: Square.c5,
    flags: [MoveTypes.bigPawn],
    piece: Chess.pawn,
    san: 'c5',
    ),
   SanMove(
    color: Color.white,
    from: Square.a4,
    to: Square.a3,
    flags: [MoveTypes.normal],
    piece: Chess.queen,
    san: 'Qa3',
    ),
   SanMove(
    color: Color.black,
    from: Square.f8,
    to: Square.c8,
    flags: [MoveTypes.normal],
    piece: Chess.rook,
    san: 'Rc8',
    ),
   SanMove(
    color: Color.white,
    from: Square.f1,
    to: Square.b5,
    flags: [MoveTypes.normal],
    piece: Chess.bishop,
    san: 'Bb5',
    ),
   SanMove(
    color: Color.black,
    from: Square.a7,
    to: Square.a6,
    flags: [MoveTypes.normal],
    piece: Chess.pawn,
    san: 'a6',
    ),
   SanMove(
    color: Color.white,
    from: Square.d4,
    to: Square.c5,
    flags: [MoveTypes.capture],
    piece: Chess.pawn,
    captured: Chess.pawn,
    san: 'dxc5',
    ),
   SanMove(
    color: Color.black,
    from: Square.b6,
    to: Square.c5,
    flags: [MoveTypes.capture],
    piece: Chess.pawn,
    captured: Chess.pawn,
    san: 'bxc5',
    ),
   SanMove(
    color: Color.white,
    from: Square.e1,
    to: Square.g1,
    flags: [MoveTypes.ksideCastle],
    piece: Chess.king,
    san: 'O-O',
    ),
   SanMove(
    color: Color.black,
    from: Square.a8,
    to: Square.a7,
    flags: [MoveTypes.normal],
    piece: Chess.rook,
    san: 'Ra7',
    ),
   SanMove(
    color: Color.white,
    from: Square.b5,
    to: Square.e2,
    flags: [MoveTypes.normal],
    piece: Chess.bishop,
    san: 'Be2',
    ),
   SanMove(
    color: Color.black,
    from: Square.b8,
    to: Square.d7,
    flags: [MoveTypes.normal],
    piece: Chess.knight,
    san: 'Nd7',
    ),
   SanMove(
    color: Color.white,
    from: Square.f3,
    to: Square.d4,
    flags: [MoveTypes.normal],
    piece: Chess.knight,
    san: 'Nd4',
    ),
   SanMove(
    color: Color.black,
    from: Square.e7,
    to: Square.f8,
    flags: [MoveTypes.normal],
    piece: Chess.queen,
    san: 'Qf8',
    ),
   SanMove(
    color: Color.white,
    from: Square.d4,
    to: Square.e6,
    flags: [MoveTypes.capture],
    piece: Chess.knight,
    captured: Chess.bishop,
    san: 'Nxe6',
    ),
   SanMove(
    color: Color.black,
    from: Square.f7,
    to: Square.e6,
    flags: [MoveTypes.capture],
    piece: Chess.pawn,
    captured: Chess.knight,
    san: 'fxe6',
    ),
   SanMove(
    color: Color.white,
    from: Square.e3,
    to: Square.e4,
    flags: [MoveTypes.normal],
    piece: Chess.pawn,
    san: 'e4',
    ),
   SanMove(
    color: Color.black,
    from: Square.d5,
    to: Square.d4,
    flags: [MoveTypes.normal],
    piece: Chess.pawn,
    san: 'd4',
    ),
   SanMove(
    color: Color.white,
    from: Square.f2,
    to: Square.f4,
    flags: [MoveTypes.bigPawn],
    piece: Chess.pawn,
    san: 'f4',
    ),
   SanMove(
    color: Color.black,
    from: Square.f8,
    to: Square.e7,
    flags: [MoveTypes.normal],
    piece: Chess.queen,
    san: 'Qe7',
    ),
   SanMove(
    color: Color.white,
    from: Square.e4,
    to: Square.e5,
    flags: [MoveTypes.normal],
    piece: Chess.pawn,
    san: 'e5',
    ),
   SanMove(
    color: Color.black,
    from: Square.c8,
    to: Square.b8,
    flags: [MoveTypes.normal],
    piece: Chess.rook,
    san: 'Rb8',
    ),
   SanMove(
    color: Color.white,
    from: Square.e2,
    to: Square.c4,
    flags: [MoveTypes.normal],
    piece: Chess.bishop,
    san: 'Bc4',
    ),
   SanMove(
    color: Color.black,
    from: Square.g8,
    to: Square.h8,
    flags: [MoveTypes.normal],
    piece: Chess.king,
    san: 'Kh8',
    ),
   SanMove(
    color: Color.white,
    from: Square.a3,
    to: Square.h3,
    flags: [MoveTypes.normal],
    piece: Chess.queen,
    san: 'Qh3',
    ),
   SanMove(
    color: Color.black,
    from: Square.d7,
    to: Square.f8,
    flags: [MoveTypes.normal],
    piece: Chess.knight,
    san: 'Nf8',
    ),
   SanMove(
    color: Color.white,
    from: Square.b2,
    to: Square.b3,
    flags: [MoveTypes.normal],
    piece: Chess.pawn,
    san: 'b3',
    ),
   SanMove(
    color: Color.black,
    from: Square.a6,
    to: Square.a5,
    flags: [MoveTypes.normal],
    piece: Chess.pawn,
    san: 'a5',
    ),
   SanMove(
    color: Color.white,
    from: Square.f4,
    to: Square.f5,
    flags: [MoveTypes.normal],
    piece: Chess.pawn,
    san: 'f5',
    ),
   SanMove(
    color: Color.black,
    from: Square.e6,
    to: Square.f5,
    flags: [MoveTypes.capture],
    piece: Chess.pawn,
    captured: Chess.pawn,
    san: 'exf5',
    ),
   SanMove(
    color: Color.white,
    from: Square.f1,
    to: Square.f5,
    flags: [MoveTypes.capture],
    piece: Chess.rook,
    captured: Chess.pawn,
    san: 'Rxf5',
    ),
   SanMove(
    color: Color.black,
    from: Square.f8,
    to: Square.h7,
    flags: [MoveTypes.normal],
    piece: Chess.knight,
    san: 'Nh7',
    ),
   SanMove(
    color: Color.white,
    from: Square.c1,
    to: Square.f1,
    flags: [MoveTypes.normal],
    piece: Chess.rook,
    san: 'Rcf1',
    ),
   SanMove(
    color: Color.black,
    from: Square.e7,
    to: Square.d8,
    flags: [MoveTypes.normal],
    piece: Chess.queen,
    san: 'Qd8',
    ),
   SanMove(
    color: Color.white,
    from: Square.h3,
    to: Square.g3,
    flags: [MoveTypes.normal],
    piece: Chess.queen,
    san: 'Qg3',
    ),
   SanMove(
    color: Color.black,
    from: Square.a7,
    to: Square.e7,
    flags: [MoveTypes.normal],
    piece: Chess.rook,
    san: 'Re7',
    ),
   SanMove(
    color: Color.white,
    from: Square.h2,
    to: Square.h4,
    flags: [MoveTypes.bigPawn],
    piece: Chess.pawn,
    san: 'h4',
    ),
   SanMove(
    color: Color.black,
    from: Square.b8,
    to: Square.b7,
    flags: [MoveTypes.normal],
    piece: Chess.rook,
    san: 'Rbb7',
    ),
   SanMove(
    color: Color.white,
    from: Square.e5,
    to: Square.e6,
    flags: [MoveTypes.normal],
    piece: Chess.pawn,
    san: 'e6',
    ),
   SanMove(
    color: Color.black,
    from: Square.b7,
    to: Square.c7,
    flags: [MoveTypes.normal],
    piece: Chess.rook,
    san: 'Rbc7',
    ),
   SanMove(
    color: Color.white,
    from: Square.g3,
    to: Square.e5,
    flags: [MoveTypes.normal],
    piece: Chess.queen,
    san: 'Qe5',
    ),
   SanMove(
    color: Color.black,
    from: Square.d8,
    to: Square.e8,
    flags: [MoveTypes.normal],
    piece: Chess.queen,
    san: 'Qe8',
    ),
   SanMove(
    color: Color.white,
    from: Square.a2,
    to: Square.a4,
    flags: [MoveTypes.bigPawn],
    piece: Chess.pawn,
    san: 'a4',
    ),
   SanMove(
    color: Color.black,
    from: Square.e8,
    to: Square.d8,
    flags: [MoveTypes.normal],
    piece: Chess.queen,
    san: 'Qd8',
    ),
   SanMove(
    color: Color.white,
    from: Square.f1,
    to: Square.f2,
    flags: [MoveTypes.normal],
    piece: Chess.rook,
    san: 'R1f2',
    ),
   SanMove(
    color: Color.black,
    from: Square.d8,
    to: Square.e8,
    flags: [MoveTypes.normal],
    piece: Chess.queen,
    san: 'Qe8',
    ),
   SanMove(
    color: Color.white,
    from: Square.f2,
    to: Square.f3,
    flags: [MoveTypes.normal],
    piece: Chess.rook,
    san: 'R2f3',
    ),
   SanMove(
    color: Color.black,
    from: Square.e8,
    to: Square.d8,
    flags: [MoveTypes.normal],
    piece: Chess.queen,
    san: 'Qd8',
    ),
   SanMove(
    color: Color.white,
    from: Square.c4,
    to: Square.d3,
    flags: [MoveTypes.normal],
    piece: Chess.bishop,
    san: 'Bd3',
    ),
   SanMove(
    color: Color.black,
    from: Square.d8,
    to: Square.e8,
    flags: [MoveTypes.normal],
    piece: Chess.queen,
    san: 'Qe8',
    ),
   SanMove(
    color: Color.white,
    from: Square.e5,
    to: Square.e4,
    flags: [MoveTypes.normal],
    piece: Chess.queen,
    san: 'Qe4',
    ),
   SanMove(
    color: Color.black,
    from: Square.h7,
    to: Square.f6,
    flags: [MoveTypes.normal],
    piece: Chess.knight,
    san: 'Nf6',
    ),
   SanMove(
    color: Color.white,
    from: Square.f5,
    to: Square.f6,
    flags: [MoveTypes.capture],
    piece: Chess.rook,
    captured: Chess.knight,
    san: 'Rxf6',
    ),
   SanMove(
    color: Color.black,
    from: Square.g7,
    to: Square.f6,
    flags: [MoveTypes.capture],
    piece: Chess.pawn,
    captured: Chess.rook,
    san: 'gxf6',
    ),
   SanMove(
    color: Color.white,
    from: Square.f3,
    to: Square.f6,
    flags: [MoveTypes.capture],
    piece: Chess.rook,
    captured: Chess.pawn,
    san: 'Rxf6',
    ),
   SanMove(
    color: Color.black,
    from: Square.h8,
    to: Square.g8,
    flags: [MoveTypes.normal],
    piece: Chess.king,
    san: 'Kg8',
    ),
   SanMove(
    color: Color.white,
    from: Square.d3,
    to: Square.c4,
    flags: [MoveTypes.normal],
    piece: Chess.bishop,
    san: 'Bc4',
    ),
   SanMove(
    color: Color.black,
    from: Square.g8,
    to: Square.h8,
    flags: [MoveTypes.normal],
    piece: Chess.king,
    san: 'Kh8',
    ),
   SanMove(
    color: Color.white,
    from: Square.e4,
    to: Square.f4,
    flags: [MoveTypes.normal],
    piece: Chess.queen,
    san: 'Qf4',
    ),
          ],
    )];

    for (final ({String fen, List<dynamic> moves}) thisTest in tests) {
      test('History ${thisTest.fen}', () {
        chess.reset();

        if (thisTest.moves is List<String>) {
    for (final String move in (thisTest.moves as List<String>)) {
    chess.move(san: move);
    }

    final List<Move> history = chess.history(generateSan: true);
    expect(chess.fen(), thisTest.fen);
    expect(history.length, thisTest.moves.length);

    for (int j = 0; j < thisTest.moves.length; j++) {
    expect((history[j] as SanMove).san, thisTest.moves[j]);
    }
    } else if (thisTest.moves is List<Move>) {
    for (final Move move in (thisTest.moves as List<Move>)) {
    chess.move(from: move.from, to: move.to, promotion: move.promotion);
    }

    final List<Move> history = chess.history(generateSan: true);
    expect(chess.fen(), thisTest.fen);
    expect(history.length, thisTest.moves.length);

    for (int j = 0; j < thisTest.moves.length; j++) {
    expect(history[j], thisTest.moves[j]);
    }
    }

      });
    }
  });
}

