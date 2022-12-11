import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  test('load - default position', () {
    final Chess chess = Chess();
    expect(chess.fen(), Chess.defaultPosition);
  });

  // see fen_test.dart for more testcases involving .load()

  test('load - invalid fen', () {
    final Chess chess = Chess();
    expect(() => chess.load(fen: ''), throwsException);
  });

  test('load - incomplete FEN string', () {
    final Chess chess = Chess();
    // the 8th rank (nbqkbnr) is missing a piece or square digit
    final String fen =
        'nbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';
    expect(() => chess.load(fen: fen), throwsException);
  });

  test('load - bad empty squares digit (9)', () {
    final Chess chess = Chess();
    final String fen =
        'rnbqkbnr/pppppppp/9/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';
    expect(() => chess.load(fen: fen), throwsException);
  });

  test('load - bad piece (X)', () {
    final Chess chess = Chess();
    final String fen =
        '1nbqkbn1/pppp1ppX/8/4p3/4P3/8/PPPP1PPP/1NBQKBN1 b - - 1 2';
    expect(() => chess.load(fen: fen), throwsException);
  });

  test('load - bad ep square (e9)', () {
    final Chess chess = Chess();
    final String fen =
        'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e9 0 1';
    expect(() => chess.load(fen: fen), throwsException);
  });

  test(
      'load - missing FEN tokens (no castling rights, ep square, or move numbers)',
      () {
    final Chess chess = Chess();
    final String fen = 'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b';
    expect(() => chess.load(fen: fen), returnsNormally);
  });
}
