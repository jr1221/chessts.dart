import 'package:test/test.dart';
import 'package:chessts/chessts.dart';

void main() {
  group('Manipulate Comments', () {
    test('no comments', () {
      final Chess chess = Chess();
      expect(chess.getComment(), null);
      expect(chess.getComments(), isEmpty);
      chess.move(san: 'e4');
      expect(chess.getComment(), null);
      expect(chess.getComments(), isEmpty);
      expect(chess.pgn(), '1. e4');
    });

    test('comment for initial position', () {
      final Chess chess = Chess();
      chess.setComment('starting position');
      expect(chess.getComment(), 'starting position');
      expect(
        chess.getComments(),
        <String, String>{chess.fen(): 'starting position'},
      );
      expect(chess.pgn(), '{starting position}');
    });

    test('comment for first move', () {
      final Chess chess = Chess();
      chess.move(san: 'e4');
      final String e4 = chess.fen();
      chess.setComment('good move');
      expect(chess.getComment(), 'good move');
      expect(chess.getComments(), <String, String>{e4: 'good move'});
      chess.move(san: 'e5');
      expect(chess.getComment(), null);
      expect(chess.getComments(), <String, String>{e4: 'good move'});
      expect(chess.pgn(), '1. e4 {good move} e5');
    });

    test('comment for last move', () {
      final Chess chess = Chess();
      chess.move(san: 'e4');
      chess.move(san: 'e6');
      chess.setComment('dubious move');
      expect(chess.getComment(), 'dubious move');
      expect(
        chess.getComments(),
        <String, String>{chess.fen(): 'dubious move'},
      );
      expect(chess.pgn(), '1. e4 e6 {dubious move}');
    });

    test('comment with brackets', () {
      final Chess chess = Chess();
      chess.setComment('{starting position}');
      expect(chess.getComment(), '[starting position]');
    });

    test('comments for everything', () {
      final Chess chess = Chess();

      final String initial = chess.fen();
      chess.setComment('starting position');
      expect(chess.getComment(), 'starting position');
      expect(
          chess.getComments(), <String, String>{initial: 'starting position'});
      expect(chess.pgn(), '{starting position}');

      chess.move(san: 'e4');
      final String e4 = chess.fen();
      chess.setComment('good move');
      expect(chess.getComment(), 'good move');
      expect(chess.getComments(), <String, String>{
        initial: 'starting position',
        e4: 'good move',
      });
      expect(chess.pgn(), '{starting position} 1. e4 {good move}');

      chess.move(san: 'e6');
      final String e6 = chess.fen();
      chess.setComment('dubious move');
      expect(chess.getComment(), 'dubious move');
      expect(
        chess.getComments(),
        <String, String>{
          initial: 'starting position',
          e4: 'good move',
          e6: 'dubious move'
        },
      );
      expect(chess.pgn(),
          '{starting position} 1. e4 {good move} e6 {dubious move}');
    });

    test('delete comments', () {
      final Chess chess = Chess();
      expect(chess.deleteComment(), null);
      expect(chess.getComments(), <String, String>{});
      chess.deleteComments();
      final String initial = chess.fen();
      chess.setComment('starting position');
      chess.move(san: 'e4');
      final String e4 = chess.fen();
      chess.setComment('good move');
      chess.move(san: 'e6');
      final String e6 = chess.fen();
      chess.setComment('dubious move');
      expect(
        chess.getComments(),
        <String, String>{
          initial: 'starting position',
          e4: 'good move',
          e6: 'dubious move'
        },
      );
      expect(chess.deleteComment(), 'dubious move');
      expect(chess.pgn(), '{starting position} 1. e4 {good move} e6');
      expect(chess.deleteComment(), null);
      expect(
        chess.getComments(),
        <String, String>{initial: 'starting position', e4: 'good move'},
      );
      chess.deleteComments();
      expect(chess.pgn(), '1. e4 e6');
    });

    test('prune comments', () {
      final Chess chess = Chess();
      chess.move(san: 'e4');
      chess.setComment('tactical');
      chess.undo();
      chess.move(san: 'd4');
      chess.setComment('positional');
      expect(
        chess.getComments(),
        <String, String>{chess.fen(): 'positional'},
      );
      expect(chess.pgn(), '1. d4 {positional}');
    });

    // TODO once loadPgn done
    /*
    test('clear comments', () {
    const test = (fn: (chess: Chess) => void) => {
      const chess = new Chess()
      chess.move('e4')
      chess.setComment('good move')
      expect(chess.getComments()).toEqual([
        { fen: chess.fen(), comment: 'good move' },
      ])
      fn(chess)
      expect(chess.getComments()).toEqual([])
    }
    test((chess: Chess) => {
    chess.reset()
    })
    test((chess: Chess) => {
    chess.clear()
    })
    test((chess: Chess) => {
    chess.load(chess.fen())
    })
    test((chess: Chess) => {
    chess.loadPgn('1. e4')
    })
  });
   */
  });

  group('Format Comments', () {
    test('wrap comments', () {
      final Chess chess = Chess();
      chess.move(san: 'e4');
      chess.setComment('good   move');
      chess.move(san: 'e5');
      chess.setComment('classical response');
      expect(chess.pgn(), '1. e4 {good   move} e5 {classical response}');
      expect(
          chess.pgn(maxWidth: 16),
          <String>['1. e4 {good', 'move} e5', '{classical', 'response}']
              .join('\n'));
      expect(
          chess.pgn(maxWidth: 2),
          <String>[
            '1.',
            'e4',
            '{good',
            'move}',
            'e5',
            '{classical',
            'response}'
          ].join('\n'));
    });
  });

  // TOODO when loadPgn works
  /*
  group('Load Comments', () {
  const tests = [
  {
    name: 'bracket comments',
    input: '1. e4 {good move} e5 {classical response}',
    output: '1. e4 {good move} e5 {classical response}',
  },
      {
        name: 'semicolon comments',
        input: '1. e4 e5; romantic era\n 2. Nf3 Nc6; common continuation',
        output: '1. e4 e5 {romantic era} 2. Nf3 Nc6 {common continuation}',
      },
      {
        name: 'bracket and semicolon comments',
        input: '1. e4 {good!} e5; standard response\n 2. Nf3 Nc6 {common}',
        output: '1. e4 {good!} e5 {standard response} 2. Nf3 Nc6 {common}',
      },
      {
        name: 'bracket comments with newlines',
        input: '1. e4 {good\nmove} e5 {classical\nresponse}',
        output: '1. e4 {good move} e5 {classical response}',
      },
      {
        name: 'initial comment',
        input: '{ great game }\n1. e4 e5',
        output: '{ great game } 1. e4 e5',
      },
      {
        name: 'empty bracket comment',
        input: '1. e4 {}',
        output: '1. e4 {}',
      },
      {
        name: 'empty semicolon comment',
        input: '1. e4;\ne5',
        output: '1. e4 {} e5',
      },
      {
        name: 'unicode comment',
        input: '1. e4 {Δ, Й, ק ,م, ๗, あ, 叶, 葉, and 말}',
        output: '1. e4 {Δ, Й, ק ,م, ๗, あ, 叶, 葉, and 말}',
      },
      {
        name: 'semicolon in bracket comment',
        input: '1. e4 { a classic; well-studied } e5',
        output: '1. e4 { a classic; well-studied } e5',
      },
      {
        name: 'bracket in semicolon comment',
        input: '1. e4 e5 ; a classic {well-studied}',
        output: '1. e4 e5 {a classic {well-studied}}',
      },
      {
        name: 'markers in bracket comment',
        input: '1. e4 e5 {($1) 1. e4 is good}',
        output: '1. e4 e5 {($1) 1. e4 is good}',
      },
      {
        name: 'markers in semicolon comment',
        input: '1. e4 e5; ($1) 1. e4 is good',
        output: '1. e4 e5 {($1) 1. e4 is good}',
      },
      {
      name: 'comment before black to move',
      input: `
      [SetUp "1"]
      [FEN "r4rk1/p1nq1pp1/1p1pp2p/8/P2PR3/1QP2N2/1P3PPP/R5K1 b - - 0 16"]
      {test comment} 16...Rfb8`,
      output: `[SetUp "1"]
      [FEN "r4rk1/p1nq1pp1/1p1pp2p/8/P2PR3/1QP2N2/1P3PPP/R5K1 b - - 0 16"]
      {test comment} 16. ... Rfb8`,
      },
      ]

      tests.forEach((test) => {
    test('load ${test.name}', () {
      final Chess chess = Chess();
      chess.loadPgn(test.input);
      expect(chess.pgn()).toEqual(test.output)
    });
});
});
   */
}
