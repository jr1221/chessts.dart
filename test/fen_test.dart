import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  test('.load() / .fen() should be symmetric', () {
    final List<String> validPositions = <String>[
      'k7/8/8/8/8/8/8/7K w - - 0 1',
      'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
      'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq - 0 1',
      '1nbqkbn1/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/1NBQKBN1 b - - 1 2',
    ];

    final Chess chess = Chess();

    for (final String fen in validPositions) {
      expect(() => chess.load(fen: fen), returnsNormally);
      expect(chess.fen(), fen);
    }
  });

  test('fen - ep square present only if en passant is legal (legal)', () {
    final Chess chess = Chess(fen: '4k3/8/8/8/5p2/8/4P3/4K3 w - - 0 1');
    chess.move(san: 'e4');
    expect(chess.fen(), '4k3/8/8/8/4Pp2/8/8/4K3 b - e3 0 1');
  });

  test('fen - ep square only if en passant is legal (illegal - pinned) - #1)',
      () {
    final Chess chess = Chess(fen: '5k2/8/8/8/5p2/8/4P3/4KR2 w - - 0 1');
    chess.move(san: 'e4');
    expect(chess.fen(), '5k2/8/8/8/4Pp2/8/8/4KR2 b - - 0 1');
  });

  test('fen - ep square only if en passant is legal (illegal - pinned - #2)',
      () {
    // black queen pins the ep pawn, making ep illegal (submitted by @ajax333221)
    final Chess chess = Chess(
        fen:
            'rnb1kbn1/p1p1pp2/PpPp2qr/5Pp1/8/R1P4p/1PK1P1PP/1NBQ1BNR b - - 0 1');
    chess.move(san: 'e5');
    expect(chess.fen(),
        'rnb1kbn1/p1p2p2/PpPp2qr/4pPp1/8/R1P4p/1PK1P1PP/1NBQ1BNR w - - 0 2');
  });
}
