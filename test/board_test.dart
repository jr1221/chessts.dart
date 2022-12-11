import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  group('Board Tests', () {
    final List<({String fen, List<List<({Square square, Piece? piece})>> board})> tests = <({String fen, List<List<({Square square, Piece? piece})>> board})>[
  (fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
    board: <List<({Square square, Piece? piece})>>[
    <({Square square, Piece? piece})>[
    (square: Square.a8, piece: Piece(Color.BLACK, Chess.ROOK)),
    (square: Square.b8,piece: Piece(Color.BLACK, Chess.KNIGHT)),
    ( square: Square.c8, piece: Piece(Color.BLACK, Chess.BISHOP)),
    (square: Square.d8, piece: Piece(Color.BLACK, Chess.QUEEN) ),
    (square:  Square.e8,piece:  Piece(Color.BLACK, Chess.KING)),
    (square:  Square.f8,piece: Piece(Color.BLACK, Chess.BISHOP)),
    (square:  Square.g8, piece: Piece(Color.BLACK, Chess.KNIGHT)),
    ( square: Square.h8, piece: Piece(Color.BLACK, Chess.ROOK)),
    ],
    <({Square square, Piece? piece})>[
    (  square: Square.a7, piece: Piece(Color.BLACK, Chess.PAWN)),
    (  square: Square.b7, piece: Piece(Color.BLACK, Chess.PAWN)),
    ( square:  Square.c7, piece: Piece(Color.BLACK, Chess.PAWN) ),
    (  square: Square.d7, piece: Piece(Color.BLACK, Chess.PAWN)),
    (  square: Square.e7, piece: Piece(Color.BLACK, Chess.PAWN)),
    (  square: Square.f7, piece: Piece(Color.BLACK, Chess.PAWN)),
    (  square: Square.g7,piece: Piece(Color.BLACK, Chess.PAWN)),
    (  square: Square.h7, piece: Piece(Color.BLACK, Chess.PAWN)),
    ],
    <({Square square, Piece? piece})>[
    (  square: Square.a6, piece: null),
    (  square: Square.b6, piece: null),
    (  square: Square.c6, piece: null),
    (  square: Square.d6, piece: null),
    (  square: Square.e6, piece: null),
    (  square: Square.f6, piece: null),
    (  square: Square.g6,piece: null),
    ( square:  Square.h6,piece:  null),
    ],
    <({Square square, Piece? piece})>[
    (  square: Square.a5,piece:  null),
    (  square: Square.b5, piece: null),
    (  square: Square.c5, piece: null),
    (  square: Square.d5, piece: null),
    ( square:  Square.e5, piece: null),
    ( square:  Square.f5,piece:  null),
    (  square: Square.g5,piece: null),
    ( square:  Square.h5,piece:  null),
    ],
    <({Square square, Piece? piece})> [
    ( square:  Square.a4, piece: null),
    ( square:  Square.b4, piece: null),
    ( square:  Square.c4,piece:  null),
    ( square:  Square.d4,piece:  null),
    ( square:  Square.e4,piece:  null),
    ( square:  Square.f4,piece:  null),
    ( square:  Square.g4,piece: null),
    ( square:  Square.h4,piece:  null),
    ],
    <({Square square, Piece? piece})>[
    ( square:  Square.a3, piece: null),
    (  square: Square.b3,piece:  null),
    (  square: Square.c3,piece:  null),
    (  square: Square.d3,piece:  null),
    (  square: Square.e3,piece:  null),
    (  square: Square.f3,piece:  null),
    ( square:  Square.g3,piece: null),
    ( square:  Square.h3,piece:  null),
    ],
    <({Square square, Piece? piece})>[
    ( square:  Square.a2, piece: Piece(Color.WHITE, Chess.PAWN)),
    (  square: Square.b2, piece: Piece(Color.WHITE, Chess.PAWN)),
    ( square:  Square.c2, piece: Piece(Color.WHITE, Chess.PAWN) ),
    ( square:  Square.d2, piece: Piece(Color.WHITE, Chess.PAWN)),
    (  square: Square.e2, piece: Piece(Color.WHITE, Chess.PAWN)),
    ( square:  Square.f2, piece: Piece(Color.WHITE, Chess.PAWN)),
    (  square: Square.g2,piece: Piece(Color.WHITE, Chess.PAWN)),
    (  square: Square.h2,piece:  Piece(Color.WHITE, Chess.PAWN)),
    ],
    <({Square square, Piece? piece})>[
    ( square: Square.a1, piece: Piece(Color.WHITE, Chess.ROOK)),
    ( square: Square.b1,piece: Piece(Color.WHITE, Chess.KNIGHT)),
    ( square:  Square.c1,piece:  Piece(Color.WHITE, Chess.BISHOP)),
    ( square: Square.d1, piece: Piece(Color.WHITE, Chess.QUEEN) ),
    (  square: Square.e1,piece:  Piece(Color.WHITE, Chess.KING)),
    (  square: Square.f1,piece: Piece(Color.WHITE, Chess.BISHOP)),
    (  square: Square.g1,piece:  Piece(Color.WHITE, Chess.KNIGHT)),
    (  square: Square.h1,piece:  Piece(Color.WHITE, Chess.ROOK)),
    ],
    ]
  ), // checkmate
    (fen: 'r3k2r/ppp2p1p/2n1p1p1/8/2B2P1q/2NPb1n1/PP4PP/R2Q3K w kq - 0 8',
    board: <List<({Square square, Piece? piece})>>[
    <({Square square, Piece? piece})>[
    (square: Square.a8, piece: Piece(Color.BLACK, Chess.ROOK)),
    (square: Square.b8,piece: null),
    ( square: Square.c8, piece: null),
    (square: Square.d8, piece: null ),
    (square:  Square.e8,piece:  Piece(Color.BLACK, Chess.KING)),
    (square:  Square.f8,piece: null),
    (square:  Square.g8, piece: null),
    ( square: Square.h8, piece: Piece(Color.BLACK, Chess.ROOK)),
    ],
    <({Square square, Piece? piece})>[
    (  square: Square.a7, piece: Piece(Color.BLACK, Chess.PAWN)),
    (  square: Square.b7, piece: Piece(Color.BLACK, Chess.PAWN)),
    ( square:  Square.c7, piece: Piece(Color.BLACK, Chess.PAWN) ),
    (  square: Square.d7, piece: null),
    (  square: Square.e7, piece: null),
    (  square: Square.f7, piece: Piece(Color.BLACK, Chess.PAWN)),
    (  square: Square.g7,piece: null),
    (  square: Square.h7, piece: Piece(Color.BLACK, Chess.PAWN)),
    ],
    <({Square square, Piece? piece})>[
    (  square: Square.a6, piece: null),
    (  square: Square.b6, piece: null),
    (  square: Square.c6, piece: Piece(Color.BLACK, Chess.KNIGHT)),
    (  square: Square.d6, piece: null),
    (  square: Square.e6, piece: Piece(Color.BLACK, Chess.PAWN)),
    (  square: Square.f6, piece: null),
    (  square: Square.g6,piece: Piece(Color.BLACK, Chess.PAWN)),
    ( square:  Square.h6,piece:  null),
    ],
    <({Square square, Piece? piece})>[
    (  square: Square.a5,piece:  null),
    (  square: Square.b5, piece: null),
    (  square: Square.c5, piece: null),
    (  square: Square.d5, piece: null),
    ( square:  Square.e5, piece: null),
    ( square:  Square.f5,piece:  null),
    (  square: Square.g5,piece: null),
    ( square:  Square.h5,piece:  null),
    ],
    <({Square square, Piece? piece})> [
    ( square:  Square.a4, piece: null),
    ( square:  Square.b4, piece: null),
    ( square:  Square.c4,piece:  Piece(Color.WHITE, Chess.BISHOP)),
    ( square:  Square.d4,piece:  null),
    ( square:  Square.e4,piece:  null),
    ( square:  Square.f4,piece:  Piece(Color.WHITE, Chess.PAWN)),
    ( square:  Square.g4,piece: null),
    ( square:  Square.h4,piece:  Piece(Color.BLACK, Chess.QUEEN)),
    ],
    <({Square square, Piece? piece})>[
    ( square:  Square.a3, piece: null),
    (  square: Square.b3,piece:  null),
    (  square: Square.c3,piece:  Piece(Color.WHITE, Chess.KNIGHT)),
    (  square: Square.d3,piece:  Piece(Color.WHITE, Chess.PAWN)),
    (  square: Square.e3,piece:  Piece(Color.BLACK, Chess.BISHOP)),
    (  square: Square.f3,piece:  null),
    ( square:  Square.g3,piece: Piece(Color.BLACK, Chess.KNIGHT)),
    ( square:  Square.h3,piece:  null),
    ],
    <({Square square, Piece? piece})>[
    ( square:  Square.a2, piece: Piece(Color.WHITE, Chess.PAWN)),
    (  square: Square.b2, piece: Piece(Color.WHITE, Chess.PAWN)),
    ( square:  Square.c2, piece: null),
    ( square:  Square.d2, piece: null),
    (  square: Square.e2, piece: null),
    ( square:  Square.f2, piece: null),
    (  square: Square.g2,piece: Piece(Color.WHITE, Chess.PAWN)),
    (  square: Square.h2,piece:  Piece(Color.WHITE, Chess.PAWN)),
    ],
    <({Square square, Piece? piece})>[
    ( square: Square.a1, piece: Piece(Color.WHITE, Chess.ROOK)),
    ( square: Square.b1,piece: null),
    ( square:  Square.c1,piece:  null),
    ( square: Square.d1, piece: Piece(Color.WHITE, Chess.QUEEN) ),
    (  square: Square.e1,piece:  null),
    (  square: Square.f1,piece: null),
    (  square: Square.g1,piece:  null),
    (  square: Square.h1,piece:  Piece(Color.WHITE, Chess.KING)),
    ],
    ]
    )
    ];

    for (final  ({String fen, List<List<({Square square, Piece? piece})>> board}) setup in tests) {
        test('Board - ${setup.fen}', () {
    final Chess chess = Chess(fen: setup.fen);
    expect(chess.board(), equals(setup.board));
    });
    }
  }
  );
}

