import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  group('Regression Tests', () {
    test('Issue #32 - castling flag reappearing from OG chess.dart)', () {
      final Chess chess =
          Chess(fen: 'b3k2r/5p2/4p3/1p5p/6p1/2PR2P1/BP3qNP/6QK b k - 2 28');
      chess.move(from: Square.a8, to: Square.g2);
      expect(chess.fen(),
          equals('4k2r/5p2/4p3/1p5p/6p1/2PR2P1/BP3qbP/6QK w k - 0 29'));
    });
  });
}
