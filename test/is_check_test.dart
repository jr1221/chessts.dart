import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  test('isCheck - no, starting position', () {
    final Chess chess = Chess();
    expect(chess.isCheck(), false);
  });

  test('isCheck - yes, black giving check', () {
    final Chess chess = Chess(
        fen: 'rnb1kbnr/pppp1ppp/8/8/4Pp1q/2N5/PPPP2PP/R1BQKBNR w KQkq - 2 4');
    expect(chess.isCheck(), true);
  });

  test('isCheck - yes, checkmate is also check', () {
    final Chess chess = Chess(fen: 'R3k3/8/4K3/8/8/8/8/8 b - - 0 1');
    expect(chess.isCheck(), true);
  });

  test('isCheck - no, stalemate is not check', () {
    final Chess chess = Chess(fen: '4k3/4P3/4K3/8/8/8/8/8 b - - 0 1');
    expect(chess.isCheck(), false);
  });
}
