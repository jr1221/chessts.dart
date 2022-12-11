import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  test('isThreefoldRepetition', () {
    /* Fischer - Petrosian, Buenos Aires, 1971 */
    final String fen = '8/pp3p1k/2p2q1p/3r1P2/5R2/7P/P1P1QP2/7K b - - 2 30';
    final List<String> moves = 'Qe5 Qh5 Qf6 Qe2 Re5 Qd3 Rd5 Qe2'.split(' ');

    final Chess chess = Chess(fen: fen);
    for (final String move in moves) {
      {
        expect(chess.isThreefoldRepetition(), false);
        expect(chess.move(san: move), isNotNull);
      }
    }
    expect(chess.isThreefoldRepetition(), true);
  });

  test('isThreefoldRepetition - 2', () {
    final List<String> moves = 'Nf3 Nf6 Ng1 Ng8 Nf3 Nf6 Ng1 Ng8'.split(' ');
    final Chess chess = Chess();
    for (String move in moves) {
      {
        expect(chess.isThreefoldRepetition(), false);
        expect(chess.move(san: move), isNotNull);
      }
    }
    expect(chess.isThreefoldRepetition(), true);
  });
}
