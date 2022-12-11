import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  test('.load() / .fen() should be symmetric', () {
    final List<String> validPositions = <String>[
      'k7/8/8/8/8/8/8/7K w - - 0 1',
      'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
      'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1',
      '1nbqkbn1/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/1NBQKBN1 b - - 1 2',
    ];

    final Chess chess = Chess();

    for (final String fen in validPositions) {
      expect(() => chess.load(fen: fen), returnsNormally);
      expect(chess.fen(), fen);
    }
  });
}
