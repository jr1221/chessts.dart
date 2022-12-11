import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  test('insufficient material - k vs k', () {
    final Chess chess = Chess(fen: '8/8/8/8/8/8/8/k6K w - - 0 1');
    expect(chess.isInsufficientMaterial(), true);
  });

  test('insufficient material - kn vs k', () {
    final Chess chess = Chess(fen: '8/2N5/8/8/8/8/8/k6K w - - 0 1');
    expect(chess.isInsufficientMaterial(), true);
  });

  test('insufficient material - kb vs k', () {
    final Chess chess = Chess(fen: '8/2b5/8/8/8/8/8/k6K w - - 0 1');
    expect(chess.isInsufficientMaterial(), true);
  });

  test('insufficient material - kb vs kb (same color bishops)', () {
    final Chess chess = Chess(fen: '8/b7/3B4/8/8/8/8/k6K w - - 0 1');
    expect(chess.isInsufficientMaterial(), true);
  });

  test('insufficient material - kb vs kb (many same color bishops)', () {
    final Chess chess =
        Chess(fen: '8/b1B1b1B1/1b1B1b1B/8/8/8/8/1k5K w - - 0 1');
    expect(chess.isInsufficientMaterial(), true);
  });

  test('not insufficient material - starting position', () {
    final Chess chess = Chess();
    expect(chess.isInsufficientMaterial(), false);
  });

  test('not insufficient material - kp v k', () {
    final Chess chess = Chess(fen: '8/2p5/8/8/8/8/8/k6K w - - 0 1');
    expect(chess.isInsufficientMaterial(), false);
  });

  test('not insufficient material - kb v kb (opposite color bishops)', () {
    final Chess chess = Chess(fen: '5k1K/7B/8/6b1/8/8/8/8 b - - 0 1');
    expect(chess.isInsufficientMaterial(), false);
  });

  test('not insufficient material - kn v kb', () {
    final Chess chess = Chess(fen: '7K/5k1N/8/6b1/8/8/8/8 b - - 0 1');
    expect(chess.isInsufficientMaterial(), false);
  });

  test('not insufficient material - kn v kn', () {
    final Chess chess = Chess(fen: '7K/5k1N/8/4n3/8/8/8/8 b - - 0 1');
    expect(chess.isInsufficientMaterial(), false);
  });
}
