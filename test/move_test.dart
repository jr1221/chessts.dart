import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  test('move - works - standard algebraic notation', () {
    final String fen =
        'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';
    final String next =
        'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq - 0 1';
    final Chess chess = Chess(fen: fen);
    chess.move(san: 'e4');
    expect(chess.fen(), next);
  });

  test('move - works - standard algebraic notation (mates)', () {
    final String fen = '7k/3R4/3p2Q1/6Q1/2N1N3/8/8/3R3K w - - 0 1';
    final String next = '3R3k/8/3p2Q1/6Q1/2N1N3/8/8/3R3K b - - 1 1';
    final Chess chess = Chess(fen: fen);
    chess.move(san: 'Rd8#');
    expect(chess.fen(), next);
  });

  test('move - works - standard algebraic notation (white en passant)', () {
    final String fen =
        'rnbqkbnr/pp3ppp/2pp4/4pP2/4P3/8/PPPP2PP/RNBQKBNR w KQkq e6 0 1';
    final String next =
        'rnbqkbnr/pp3ppp/2ppP3/8/4P3/8/PPPP2PP/RNBQKBNR b KQkq - 0 1';
    final Chess chess = Chess(fen: fen);
    expect(
        chess.move(san: 'fxe6'),
        Move(
            color: Chess.white,
            from: Square.f5,
            to: Square.e6,
            san: 'fxe6',
            piece: PieceSymbol.pawn,
            captured: PieceSymbol.pawn,
            flags: [MoveTypes.epCapture],
            lan: 'f5e6',
            before: fen,
            after: next));
    expect(chess.fen(), next);
  });

  test('move - works - standard algebraic notation (black en passant)', () {
    final String fen =
        'rnbqkbnr/pppp2pp/8/4p3/4Pp2/2PP4/PP3PPP/RNBQKBNR b KQkq e3 0 1';
    final String next =
        'rnbqkbnr/pppp2pp/8/4p3/8/2PPp3/PP3PPP/RNBQKBNR w KQkq - 0 2';
    final Chess chess = Chess(fen: fen);
    expect(
        chess.move(san: 'fxe3'),
        Move(
            color: Chess.black,
            from: Square.f4,
            to: Square.e3,
            san: 'fxe3',
            piece: PieceSymbol.pawn,
            captured: PieceSymbol.pawn,
            flags: [MoveTypes.epCapture],
            lan: 'f4e3',
            before: fen,
            after: next));
  });

  test('move - works - standard algebraic notation (pin disambiguates piece)',
      () {
    final String fen =
        'r2qkbnr/ppp2ppp/2n5/1B2pQ2/4P3/8/PPP2PPP/RNB1K2R b KQkq - 3 7';
    final String next =
        'r2qkb1r/ppp1nppp/2n5/1B2pQ2/4P3/8/PPP2PPP/RNB1K2R w KQkq - 4 8';
    final Chess chess = Chess(fen: fen);
    expect(
        chess.move(san: 'Ne7'),
        Move(
            color: Chess.black,
            from: Square.g8,
            to: Square.e7,
            san: 'Ne7',
            piece: PieceSymbol.knight,
            flags: [MoveTypes.normal],
            lan: 'g8e7',
            before: fen,
            after: next));
    expect(chess.fen(), next);
  });

  test('move - works - permissive parser (accepts overly disambiguated piece)',
      () {
    final String fen =
        'r2qkbnr/ppp2ppp/2n5/1B2pQ2/4P3/8/PPP2PPP/RNB1K2R b KQkq - 3 7';
    final String next =
        'r2qkb1r/ppp1nppp/2n5/1B2pQ2/4P3/8/PPP2PPP/RNB1K2R w KQkq - 4 8';
    final Chess chess = Chess(fen: fen);

    expect(
        chess.move(san: 'Nge7'),
        Move(
            color: Chess.black,
            from: Square.g8,
            to: Square.e7,
            san: 'Ne7',
            piece: PieceSymbol.knight,
            flags: [MoveTypes.normal],
            lan: 'g8e7',
            before: fen,
            after: next));
    expect(chess.fen(), next);
  });

  test(
      'move - works - permissive parser (accepts correctly disambiguated piece)',
      () {
    final String fen =
        'r2qkbnr/ppp2ppp/2n5/1B2pQ2/4P3/8/PPP2PPP/RNB1K2R b KQkq - 3 7';
    final String next =
        'r2qkb1r/ppp1nppp/2n5/1B2pQ2/4P3/8/PPP2PPP/RNB1K2R w KQkq - 4 8';
    final Chess chess = Chess(fen: fen);

    expect(
        chess.move(san: 'Ne7'),
        Move(
            color: Chess.black,
            from: Square.g8,
            to: Square.e7,
            san: 'Ne7',
            piece: PieceSymbol.knight,
            flags: [MoveTypes.normal],
            lan: 'g8e7',
            before: fen,
            after: next));
    expect(chess.fen(), next);
  });

  test('move - strict - throws Error - overly disambiguated piece', () {
    final String fen =
        'r2qkbnr/ppp2ppp/2n5/1B2pQ2/4P3/8/PPP2PPP/RNB1K2R b KQkq - 3 7';
    final Chess chess = Chess(fen: fen);
    expect(chess.move(san: 'Nge7', strict: true), null);
  });

  test('move - throws Error - illegal move', () {
    final String fen =
        'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';
    final Chess chess = Chess(fen: fen);
    expect(chess.move(san: 'e5'), null);
  });

  test('move - works - verbose', () {
    final String fen =
        'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';
    final String next =
        'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq - 0 1';
    final Chess chess = Chess(fen: fen);
    chess.move(from: Square.e2, to: Square.e4);
    expect(chess.fen(), next);
  });

  test('move - works - verbose - promotion field ignored if not promoting', () {
    final String fen =
        'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';
    final String next =
        'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq - 0 1';
    final Chess chess = Chess(fen: fen);
    chess.move(from: Square.e2, to: Square.e4, promotion: PieceSymbol.queen);
    expect(chess.fen(), next);
  });

  test('move - works - verbose - under promotion', () {
    final String fen = '8/1k5P/8/8/8/8/8/1K6 w - - 0 1';
    final String next = '7N/1k6/8/8/8/8/8/1K6 b - - 0 1';
    final Chess chess = Chess(fen: fen);
    chess.move(from: Square.h7, to: Square.h8, promotion: PieceSymbol.knight);
    expect(chess.fen(), next);
  });

  test('move - throws Error - verbose (illegal move)', () {
    final String fen =
        'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';
    final Chess chess = Chess(fen: fen);
    expect(chess.move(from: Square.e2, to: Square.e5), null);
  });

  test('move - works - permissive parser (piece capture without x)', () { // TODO fails
    final String fen =
        'r1bqk2r/p1p2pp1/2n1pn2/1p5p/2pP4/bPNB1PN1/PB1Q2PP/R3K2R w KQkq - 0 12';
    final String next =
        'r1bqk2r/p1p2pp1/2n1pn2/1p5p/2pP4/BPNB1PN1/P2Q2PP/R3K2R b KQkq - 0 12';
    final Chess chess = Chess(fen: fen);
    expect(
        chess.move(san: 'Ba3'),
        Move(
            color: Chess.white,
            from: Square.b2,
            to: Square.a3,
            san: 'Bax3',
            piece: PieceSymbol.bishop,
            captured: PieceSymbol.bishop,
            flags: [MoveTypes.capture, MoveTypes.normal],
            lan: 'e5f4',
            before: fen,
            after: next));
    expect(chess.fen(), next);
  });

  test('move - works - permissive parser (pawn capture without x)', () {
    final String fen =
        'rnbqkbnr/pppp1ppp/8/4p3/4PP2/8/PPPP2PP/RNBQKBNR b KQkq - 0 2';
    final String next =
        'rnbqkbnr/pppp1ppp/8/8/4Pp2/8/PPPP2PP/RNBQKBNR w KQkq - 0 3';
    final Chess chess = Chess(fen: fen);

    expect(
        chess.move(san: 'ef4'),
        Move(
            color: Chess.black,
            from: Square.e5,
            to: Square.f4,
            san: 'exf4',
            piece: PieceSymbol.pawn,
            captured: PieceSymbol.pawn,
            flags: [MoveTypes.capture],
            lan: 'e5f4',
            before: fen,
            after: next));
    expect(chess.fen(), next);
  });

  test('move - works - permissive parser (en passant capture without x)', () {
    final String fen =
        'rnbqkbnr/pppp1ppp/8/8/4PpP1/8/PPPP3P/RNBQKBNR b KQkq g3 0 3';
    final String next =
        'rnbqkbnr/pppp1ppp/8/8/4P3/6p1/PPPP3P/RNBQKBNR w KQkq - 0 4';
    final Chess chess = Chess(fen: fen);
    expect(
        chess.move(san: 'fg3'),
        Move(
            color: Chess.black,
            from: Square.f4,
            to: Square.g3,
            san: 'fg3',
            piece: PieceSymbol.pawn,
            captured: PieceSymbol.pawn,
            flags: [MoveTypes.epCapture],
            lan: 'f4g3',
            before: fen,
            after: next));
    expect(chess.fen(), next);
  });
}
