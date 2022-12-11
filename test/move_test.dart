import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  group('Make Move - Standard Algebraic Notation (SAN)', () {
    final List<({PieceSymbol? captured, String fen, bool legal, String move, String? next, bool sloppy})> positions = <({String fen, bool legal, String move, String? next, PieceSymbol? captured, bool sloppy})>[
    (
        fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
        legal: true,
        move: 'e4',
        next: 'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1',
        captured: null,
        sloppy: false,
    ),
    (
        fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
        legal: false,
        next: null,
        move: 'e5',
    captured: null,
        sloppy: false,

    ),
    (
        fen: '7k/3R4/3p2Q1/6Q1/2N1N3/8/8/3R3K w - - 0 1',
        legal: true,
        move: 'Rd8#',
        next: '3R3k/8/3p2Q1/6Q1/2N1N3/8/8/3R3K b - - 1 1',
        captured: null,
        sloppy: false,


    ),
    (
        fen: 'rnbqkbnr/pp3ppp/2pp4/4pP2/4P3/8/PPPP2PP/RNBQKBNR w KQkq e6 0 1',
        legal: true,
        move: 'fxe6',
        next: 'rnbqkbnr/pp3ppp/2ppP3/8/4P3/8/PPPP2PP/RNBQKBNR b KQkq - 0 1',
        captured: Chess.pawn,
        sloppy: false,

    ),
    (
        fen: 'rnbqkbnr/pppp2pp/8/4p3/4Pp2/2PP4/PP3PPP/RNBQKBNR b KQkq e3 0 1',
        legal: true,
        move: 'fxe3',
        next: 'rnbqkbnr/pppp2pp/8/4p3/8/2PPp3/PP3PPP/RNBQKBNR w KQkq - 0 2',
        captured: Chess.pawn,
        sloppy: false,

    ),

      // strict move parser
    (
        fen: 'r2qkbnr/ppp2ppp/2n5/1B2pQ2/4P3/8/PPP2PPP/RNB1K2R b KQkq - 3 7',
        legal: true,
        next: 'r2qkb1r/ppp1nppp/2n5/1B2pQ2/4P3/8/PPP2PPP/RNB1K2R w KQkq - 4 8',
        move: 'Ne7',
        captured: null,
        sloppy: false,

    ),

      // strict move parser should reject over disambiguation
    (
        fen: 'r2qkbnr/ppp2ppp/2n5/1B2pQ2/4P3/8/PPP2PPP/RNB1K2R b KQkq - 3 7',
        legal: false,
        next: null,
        move: 'Nge7',
        captured: null,
        sloppy: false,
    ),

    // TOOD when sloppy
      // sloppy move parser
    (
        fen: 'r2qkbnr/ppp2ppp/2n5/1B2pQ2/4P3/8/PPP2PPP/RNB1K2R b KQkq - 3 7',
        legal: true,
        sloppy: true,
        move: 'Nge7',
        next: 'r2qkb1r/ppp1nppp/2n5/1B2pQ2/4P3/8/PPP2PPP/RNB1K2R w KQkq - 4 8',
        captured: null
    ),

      // the sloppy parser should still accept correctly disambiguated moves
    (
        fen: 'r2qkbnr/ppp2ppp/2n5/1B2pQ2/4P3/8/PPP2PPP/RNB1K2R b KQkq - 3 7',
        legal: true,
        sloppy: true,
        move: 'Ne7',
        next: 'r2qkb1r/ppp1nppp/2n5/1B2pQ2/4P3/8/PPP2PPP/RNB1K2R w KQkq - 4 8',
        captured: null
    ),
    ];

    for (final ({PieceSymbol? captured, String fen, bool legal, String move, String? next, bool sloppy}) position in positions) {
      final Chess chess = Chess(fen: position.fen);
      test('${position.fen} (${position.move} ${position.legal})', () {
  final Move? result = chess.move(san: position.move, sloppy: position.sloppy);
  if (position.legal) {
    expect((result != null &&
  chess.fen() == position.next &&
    result.captured == position.captured), true);
  } else {
  expect(result, null);
  }
  });
    }
    });

  group('Make Move - Object', () {
    final List<({String fen, bool legal, ({Square from, PieceSymbol? promotion, Square to}) move, String? next})> positions =  <({String fen, bool legal, ({Square from, Square to, PieceSymbol? promotion}) move, String? next})>[
    (
        fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
        legal: true,
        move: (from: Square.e2, to: Square.e4, promotion: null),
        next: 'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1',
    ),
      // specifying the promoting piece has no effect if the move is not a
      // promotion
      (
        fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
        legal: true,
        move: (from: Square.e2, to: Square.e4, promotion: Chess.queen),
        next: 'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1',
    ),
    (
        fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
        legal: false,
        move: (from: Square.e2, to: Square.e5, promotion: null),
    next: null
    ),

      // under promotion
    (
        fen: '8/1k5P/8/8/8/8/8/1K6 w - - 0 1',
        legal: true,
        move: (from: Square.h7, to: Square.h8, promotion: null),
        next: '7N/1k6/8/8/8/8/8/1K6 b - - 0 1',
    ),
    ];

    for (final ({String fen, bool legal, ({Square from, PieceSymbol? promotion, Square to}) move, String? next}) position in positions) {
      {
    final Chess chess = Chess(fen: position.fen);
    final ({Square from, PieceSymbol? promotion, Square to}) move = position.move;
    test('${position.fen} (${move.to}${move.from} - ${position.legal})', () {
    final Move? result = chess.move(from: move.from, to: move.to, promotion: move.promotion);
    if (position.legal) {
    expect(result != null && chess.fen() == position.next, true);
    } else {
    expect(result, null);
    }
    });
  }
    }});
}