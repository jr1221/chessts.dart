import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  test('Draws an ASCII board', () {
    final List<String> output = <String>[
      '   +------------------------+',
      ' 8 | r  .  .  .  .  r  k  . |',
      ' 7 | .  .  .  .  n  q  p  p |',
      ' 6 | .  p  .  p  .  .  .  . |',
      ' 5 | .  .  p  P  p  p  .  . |',
      ' 4 | b  P  P  .  P  .  .  . |',
      ' 3 | R  .  B  .  N  Q  .  . |',
      ' 2 | P  .  .  .  .  P  P  P |',
      ' 1 | .  R  .  .  .  .  K  . |',
      '   +------------------------+',
      '     a  b  c  d  e  f  g  h',
    ];

    final Chess chess = Chess(
        fen: 'r4rk1/4nqpp/1p1p4/2pPpp2/bPP1P3/R1B1NQ2/P4PPP/1R4K1 w - - 0 28');

    expect(chess.ascii(), output.join('\n'));
  });
}
