import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  test('stalemate 1', () {
    final Chess chess = Chess(fen: '1R6/8/8/8/8/8/7R/k6K b - - 0 1');
    expect(chess.isStalemate(), true);
  });

  test('stalemate 2', () {
    final Chess chess = Chess(fen: '8/8/5k2/p4p1p/P4K1P/1r6/8/8 w - - 0 2');
    expect(chess.isStalemate(), true);
  });

  test('stalemate - starting position is not stalemate', () {
    final Chess chess = Chess();
    expect(chess.isStalemate(), false);
  });

  test('stalemate - checkmate is not stalemate', () {
    final Chess chess = Chess(fen: 'R3k3/8/4K3/8/8/8/8/8 b - - 0 1');
    expect(chess.isStalemate(), false);
  });
}
