class Chess {
  static const Color white = Color.white;
  static const Color black = Color.black;

  static const PieceSymbol pawn = PieceSymbol.pawn;
  static const PieceSymbol knight = PieceSymbol.knight;
  static const PieceSymbol bishop = PieceSymbol.bishop;
  static const PieceSymbol rook = PieceSymbol.rook;
  static const PieceSymbol queen = PieceSymbol.queen;
  static const PieceSymbol king = PieceSymbol.king;

  static const String defaultPosition =
      'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';

  static const int _empty = -1;

  static const Map<Color, List<int>> _pawnOffsets = <Color, List<int>>{
    black: <int>[16, 32, 17, 15],
    white: <int>[-16, -32, -17, -15]
  };

  static const Map<PieceSymbol, List<int>> _pieceOffsets =
      <PieceSymbol, List<int>>{
    knight: <int>[-18, -33, -31, -14, 18, 33, 31, 14],
    bishop: <int>[-17, -15, 17, 15],
    rook: <int>[-16, 1, 16, -1],
    queen: <int>[-17, -16, -15, 1, 17, 16, 15, -1],
    king: <int>[-17, -16, -15, 1, 17, 16, 15, -1]
  };

  static const List<int> _attacks = <int>[
    20,
    0,
    0,
    0,
    0,
    0,
    0,
    24,
    0,
    0,
    0,
    0,
    0,
    0,
    20,
    0,
    0,
    20,
    0,
    0,
    0,
    0,
    0,
    24,
    0,
    0,
    0,
    0,
    0,
    20,
    0,
    0,
    0,
    0,
    20,
    0,
    0,
    0,
    0,
    24,
    0,
    0,
    0,
    0,
    20,
    0,
    0,
    0,
    0,
    0,
    0,
    20,
    0,
    0,
    0,
    24,
    0,
    0,
    0,
    20,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    20,
    0,
    0,
    24,
    0,
    0,
    20,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    20,
    2,
    24,
    2,
    20,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    2,
    53,
    56,
    53,
    2,
    0,
    0,
    0,
    0,
    0,
    0,
    24,
    24,
    24,
    24,
    24,
    24,
    56,
    0,
    56,
    24,
    24,
    24,
    24,
    24,
    24,
    0,
    0,
    0,
    0,
    0,
    0,
    2,
    53,
    56,
    53,
    2,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    20,
    2,
    24,
    2,
    20,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    20,
    0,
    0,
    24,
    0,
    0,
    20,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    20,
    0,
    0,
    0,
    24,
    0,
    0,
    0,
    20,
    0,
    0,
    0,
    0,
    0,
    0,
    20,
    0,
    0,
    0,
    0,
    24,
    0,
    0,
    0,
    0,
    20,
    0,
    0,
    0,
    0,
    20,
    0,
    0,
    0,
    0,
    0,
    24,
    0,
    0,
    0,
    0,
    0,
    20,
    0,
    0,
    20,
    0,
    0,
    0,
    0,
    0,
    0,
    24,
    0,
    0,
    0,
    0,
    0,
    0,
    20
  ];

  static const List<int> _rays = <int>[
    17,
    0,
    0,
    0,
    0,
    0,
    0,
    16,
    0,
    0,
    0,
    0,
    0,
    0,
    15,
    0,
    0,
    17,
    0,
    0,
    0,
    0,
    0,
    16,
    0,
    0,
    0,
    0,
    0,
    15,
    0,
    0,
    0,
    0,
    17,
    0,
    0,
    0,
    0,
    16,
    0,
    0,
    0,
    0,
    15,
    0,
    0,
    0,
    0,
    0,
    0,
    17,
    0,
    0,
    0,
    16,
    0,
    0,
    0,
    15,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    17,
    0,
    0,
    16,
    0,
    0,
    15,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    17,
    0,
    16,
    0,
    15,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    17,
    16,
    15,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    -15,
    -16,
    -17,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    -15,
    0,
    -16,
    0,
    -17,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    -15,
    0,
    0,
    -16,
    0,
    0,
    -17,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    -15,
    0,
    0,
    0,
    -16,
    0,
    0,
    0,
    -17,
    0,
    0,
    0,
    0,
    0,
    0,
    -15,
    0,
    0,
    0,
    0,
    -16,
    0,
    0,
    0,
    0,
    -17,
    0,
    0,
    0,
    0,
    -15,
    0,
    0,
    0,
    0,
    0,
    -16,
    0,
    0,
    0,
    0,
    0,
    -17,
    0,
    0,
    -15,
    0,
    0,
    0,
    0,
    0,
    0,
    -16,
    0,
    0,
    0,
    0,
    0,
    0,
    -17
  ];

  static const String _symbols = 'pnbrqkPNBRQK';

  static const List<PieceSymbol> _promotions = <PieceSymbol>[
    knight,
    bishop,
    rook,
    queen
  ];

  static const int _rank1 = 7;
  static const int _rank2 = 6;

  // static const  int _RANK_3 = 5;
  // static const  int _RANK_4 = 4;
  // static const  int _RANK_5 = 3;
  // static const int _RANK_6 = 2;
  static const int _rank7 = 1;
  static const int _rank8 = 0;

  static final Map<Color, List<({int ox88, int bit})>> _rooks =
      <Color, List<({int ox88, int bit})>>{
    white: <({int ox88, int bit})>[
      (ox88: Square.a1.ox88, bit: MoveTypes.qsideCastle.bit),
      (ox88: Square.h1.ox88, bit: MoveTypes.ksideCastle.bit)
    ],
    black: <({int ox88, int bit})>[
      (ox88: Square.a8.ox88, bit: MoveTypes.qsideCastle.bit),
      (ox88: Square.h8.ox88, bit: MoveTypes.ksideCastle.bit)
    ],
  };

  static const Map<Color, int> _secondRank = <Color, int>{
    black: _rank7,
    white: _rank2
  };

  static const List<String> _terminationMarkers = <String>[
    '1-0',
    '0-1',
    '1/2-1/2',
    '*'
  ];

  /// Extracts the zero-based rank of an 0x88 square.
  static int _rank(int square) {
    return square >> 4;
  }

  /// Extracts the zero-based file of an 0x88 square.
  static int _file(int square) {
    return square & 0xf;
  }

  static bool _isDigit(String c) {
    return '0123456789'.contains(c);
  }

  /// Converts a 0x88 square to a Square object.
  static Square _algebraic(int square) {
    final int f = _file(square);
    final int r = _rank(square);
    return Square.values.byName(
        ('abcdefgh'.substring(f, f + 1) + '87654321'.substring(r, r + 1)));
  }

  static Color _swapColor(Color color) {
    return color == white ? black : white;
  }

  static ({bool ok, String error}) validateFen(String fen) {
    /* 1st criterion: 6 space-seperated fields? */
    final List<String> tokens = fen.split(RegExp(r'\s+'));
    if (tokens.length != 6) {
      return (
        ok: false,
        error: 'Invalid FEN: must contain six space-delimited fields'
      );
    }

    /* 2nd criterion: move number field is a integer value > 0? */
    final int? moveNumber = int.tryParse(tokens[5]);
    if (moveNumber == null || moveNumber <= 0) {
      return (
        ok: false,
        error: 'Invalid FEN: move number must be a positive integer'
      );
    }

    /* 3rd criterion: half move counter is an integer >= 0? */
    final int? halfMoves = int.tryParse(tokens[4]);
    if (halfMoves == null || halfMoves < 0) {
      return (
        ok: false,
        error:
            'Invalid FEN: half move counter number must be a non-negative integer'
      );
    }

    /* 4th criterion: 4th field is a valid e.p.-string? */
    if (!RegExp(r'^(-|[abcdefgh][36])$').hasMatch(tokens[3])) {
      return (ok: false, error: 'Invalid FEN: en-passant square is invalid');
    }

    /* 5th criterion: 3th field is a valid castle-string? */
    if (RegExp(r'[^kKqQ-]').hasMatch(tokens[2])) {
      return (
        ok: false,
        error: 'Invalid FEN: castling availability is invalid'
      );
    }

    /* 6th criterion: 2nd field is "w" (white) or "b" (black)? */
    if (!RegExp(r'^([wb])$').hasMatch(tokens[1])) {
      return (ok: false, error: 'Invalid FEN: side-to-move is invalid');
    }

    /* 7th criterion: 1st field contains 8 rows? */
    final List<String> rows = tokens[0].split('/');
    if (rows.length != 8) {
      return (
        ok: false,
        error: r"Invalid FEN: piece data does not contain 8 '/'-delimited rows"
      );
    }

    /* 8th criterion: every row is valid? */
    for (int i = 0; i < rows.length; i++) {
      /* check for right sum of fields AND not two numbers in succession */
      int sumFields = 0;
      bool previousWasNumber = false;

      for (int k = 0; k < rows[i].length; k++) {
        if (_isDigit(rows[i][k])) {
          if (previousWasNumber) {
            return (
              ok: false,
              error: 'Invalid FEN: piece data is invalid (consecutive number)'
            );
          }

          sumFields += int.parse(rows[i][k]);
          previousWasNumber = true;
        } else {
          final RegExp checkOM = RegExp(r'^[prnbqkPRNBQK]$');
          if (!checkOM.hasMatch(rows[i][k])) {
            return (
              ok: false,
              error: 'Invalid FEN: piece data is invalid (invalid piece)'
            );
          }
          sumFields += 1;
          previousWasNumber = false;
        }
      }
      if (sumFields != 8) {
        return (
          ok: false,
          error: 'Invalid FEN: piece data is invalid (too many squares in rank)'
        );
      }
    }

    if ((tokens[3].safeIsPresentAt(1, '3') && tokens[1] == 'w') ||
        (tokens[3].safeIsPresentAt(1, '6') && tokens[1] == 'b')) {
      return (ok: false, error: 'Invalid FEN: illegal en-passant square');
    }
    final List<({Color color, RegExp regex})> kings =
        <({Color color, RegExp regex})>[
      (color: white, regex: RegExp(r'K')),
      (color: black, regex: RegExp(r'k')),
    ];

    for (({Color color, RegExp regex}) king in kings) {
      if (!king.regex.hasMatch(tokens[0])) {
        return (ok: false, error: 'Invalid FEN: missing ${king.color} king');
      }

      if ((king.regex.allMatches(tokens[0])).length > 1) {
        return (ok: false, error: 'Invalid FEN: too many ${king.color} kings');
      }
    }

    return (ok: true, error: '');
  }

  /* this function is used to uniquely identify ambiguous moves */
  static String _getDisambiguator(InternalMove move, List<InternalMove> moves) {
    final int from = move.from;
    final int to = move.to;
    final PieceSymbol piece = move.piece;

    int ambiguities = 0;
    int sameRank = 0;
    int sameFile = 0;

    for (int i = 0, len = moves.length; i < len; i++) {
      final int ambigFrom = moves[i].from;
      final int ambigTo = moves[i].to;
      final PieceSymbol ambigPiece = moves[i].piece;

      /* if a move of the same piece type ends on the same to square, we'll
     * need to add a disambiguator to the algebraic notation
     */
      if (piece == ambigPiece && from != ambigFrom && to == ambigTo) {
        ambiguities++;

        if (_rank(from) == _rank(ambigFrom)) {
          sameRank++;
        }

        if (_file(from) == _file(ambigFrom)) {
          sameFile++;
        }
      }
    }

    if (ambiguities > 0) {
      /* if there exists a similar moving piece on the same rank and file
       as the move in question, use the square as the disambiguator
    */

      if (sameRank > 0 && sameFile > 0) {
        return _algebraic(from).name;
      } else if (sameFile > 0) {
        /* if the moving piece rests on the same file, use the rank symbol
         as the disambiguator
       */
        return _algebraic(from).name[1];
      } else {
        /* else use the file symbol */
        return _algebraic(from).name[0];
      }
    }

    return '';
  }

  static void _addMove(
      {required List<InternalMove> moves,
      required Color color,
      required int from,
      required int to,
      required PieceSymbol piece,
      PieceSymbol? captured,
      int? flags}) {
    flags ??= MoveTypes.normal.bit;

    final int r = _rank(to);

    if (piece == pawn && (r == _rank1 || r == _rank8)) {
      for (int i = 0; i < _promotions.length; i++) {
        final PieceSymbol promotion = _promotions[i];
        moves.add(InternalMove(color, from, to, piece, captured, promotion,
            flags | MoveTypes.promotion.bit));
      }
    } else {
      moves.add(InternalMove(color, from, to, piece, captured, null, flags));
    }
  }

  static PieceSymbol? _inferPieceType(String san) {
    String pieceType = san[0];
    if (pieceType.compareTo('a') >= 0 && pieceType.compareTo('h') <= 0) {
      final bool matches = RegExp(r'/[a-h]\d.*[a-h]\d/').hasMatch(san);
      if (matches) {
        return null;
      }
      return pawn;
    }
    pieceType = pieceType.toLowerCase();
    if (pieceType == 'o') {
      return king;
    }

    for (final PieceSymbol pieceOpt in PieceSymbol.values) {
      if (pieceOpt.letter == pieceType) {
        return pieceOpt;
      }
    }
    return null;
  }

  // parses all of the decorators out of a SAN string
  static String _strippedSan(String move) {
    return move
        .replaceAll(RegExp(r'='), '')
        .replaceAll(RegExp(r'[+#]?[?!]*$'), '');
  }

  List<Piece?> _board = <Piece?>[]..length = 128;
  Color _turn = white;
  Map<String, String> _header = <String, String>{};
  ColorMap<int> _kings = ColorMap<int>(_empty);
  int _epSquare = -1;
  int _halfMoves = 0;
  int _moveNumber = 0;
  List<History> _history = <History>[];
  Map<String, String> _comments = <String, String>{};
  ColorMap<int> _castling = ColorMap<int>(0);

  Chess({final String fen = defaultPosition}) {
    load(fen: fen);
  }

  void clear({final bool keepHeaders = false}) {
    _board = <Piece?>[]..length = 128;
    _turn = white;
    _header = keepHeaders ? _header : <String, String>{};
    _kings = ColorMap<int>(_empty);
    _epSquare = _empty;
    _halfMoves = 0;
    _moveNumber = 1;
    _history = <History>[];
    _comments = <String, String>{};
    _castling = ColorMap<int>(0);
    _updateSetup(fen());
  }

  void load({required String fen, bool keepHeaders = false}) {
    List<String> tokens = fen.split(RegExp(r'\s+'));

    // append commonly omitted fen tokens
    if (tokens.length >= 2 && tokens.length < 6) {
      final List<String> adjustments = <String>['-', '-', '0', '1'];
      adjustments.take((6 - tokens.length));
      tokens.addAll(adjustments);
      fen = tokens.join(' ');
    }

    tokens = fen.split(RegExp(r'\s+'));

    final ({String error, bool ok}) validation = validateFen(fen);
    if (!validation.ok) {
      throw Exception(validation.error);
    }

    final String position = tokens[0];
    int square = 0;

    clear(keepHeaders: keepHeaders);

    for (int i = 0; i < position.length; i++) {
      final String piece = position[i];

      if (piece == '/') {
        square += 8;
      } else if (_isDigit(piece)) {
        square += int.parse(piece);
      } else {
        final Color color = (piece.compareTo('a') < 0) ? white : black;
        put(Piece(color, PieceSymbol.fromLetter(piece)!), _algebraic(square));
        square++;
      }
    }

    _turn = Color.fromLetter(tokens[1])!;

    if (tokens[2].contains('K')) {
      _castling[white] |= MoveTypes.ksideCastle.bit;
    }
    if (tokens[2].contains('Q')) {
      _castling[white] |= MoveTypes.qsideCastle.bit;
    }
    if (tokens[2].contains('k')) {
      _castling[black] |= MoveTypes.ksideCastle.bit;
    }
    if (tokens[2].contains('q')) {
      _castling[black] |= MoveTypes.qsideCastle.bit;
    }

    _epSquare =
        tokens[3] == '-' ? _empty : (Square.values.byName(tokens[3])).ox88;
    _halfMoves = int.parse((tokens[4]));
    _moveNumber = int.parse((tokens[5]));

    _updateSetup(this.fen());
  }

  String fen() {
    int empty = 0;
    String fen = '';

    for (int i = Square.a8.ox88; i <= Square.h1.ox88; i++) {
      if (_board[i] != null) {
        if (empty > 0) {
          fen += empty.toString();
          empty = 0;
        }
        final Piece spot = _board[i]!;

        fen += spot.color == white
            ? spot.type.letter.toUpperCase()
            : spot.type.letter.toLowerCase();
      } else {
        empty++;
      }

      if (((i + 1) & 0x88) != 0) {
        if (empty > 0) {
          fen += empty.toString();
        }

        if (i != Square.h1.ox88) {
          fen += '/';
        }

        empty = 0;
        i += 8;
      }
    }

    String cflags = '';
    if ((_castling[white] & MoveTypes.ksideCastle.bit) != 0) {
      cflags += 'K';
    }
    if ((_castling[white] & MoveTypes.qsideCastle.bit) != 0) {
      cflags += 'Q';
    }
    if ((_castling[black] & MoveTypes.ksideCastle.bit) != 0) {
      cflags += 'k';
    }
    if ((_castling[black] & MoveTypes.qsideCastle.bit) != 0) {
      cflags += 'q';
    }

    /* do we have an empty castling flag? */
    if (cflags == '') {
      cflags = '-';
    }

    final String epflags =
        (_epSquare == _empty) ? '-' : _algebraic(_epSquare).name;

    return <Object>[
      fen,
      _turn.letter,
      cflags,
      epflags,
      _halfMoves,
      _moveNumber,
    ].join(' ');
  }

  /* Called when the initial board setup is changed with put() or remove().
   * modifies the SetUp and FEN properties of the header object.  if the FEN
   * is equal to the default position, the SetUp and FEN are deleted the setup
   * is only updated if history.length is zero, ie moves haven't been  made.
   */
  void _updateSetup(String fen) {
    if (_history.isNotEmpty) return;

    if (fen != defaultPosition) {
      _header['SetUp'] = '1';
      _header['FEN'] = fen;
    } else {
      _header.remove('SetUp');
      _header.remove('FEN');
    }
  }

  void reset() {
    load(fen: defaultPosition);
  }

  Piece? get(Square square) {
    return _board[square.ox88];
  }

  bool put(Piece piece, Square square) {
    /* check for piece */
    if (!_symbols.contains(piece.type.letter.toLowerCase())) {
      return false;
    }

    /* check for valid square */
    /*
  if (!(SQUARES.containsKey(square))) {
  return false;
  } */ // Assume obsolete bc square object

    final int sq = square.ox88;

    /* don't let the user place more than one king */
    if (piece.type == king &&
        !(_kings[piece.color] == _empty || _kings[piece.color] == sq)) {
      return false;
    }

    _board[sq] = piece;

    if (piece.type == king) {
      _kings[piece.color] = sq;
    }

    _updateSetup(fen());

    return true;
  }

  Piece? remove(Square square) {
    final Piece? piece = get(square);
    _board[square.ox88] = null;
    if (piece != null && piece.type == king) {
      _kings[piece.color] = _empty;
    }

    _updateSetup(fen());

    return piece;
  }

  bool _attacked(Color color, int square) {
    for (int i = Square.a8.ox88; i <= Square.h1.ox88; i++) {
      /* did we run off the end of the board */
      if ((i & 0x88) != 0) {
        i += 7;
        continue;
      }

      /* if empty square or wrong color */
      final Piece? piece = _board[i];
      if (piece == null || piece.color != color) {
        continue;
      }

      final int difference = i - square;
      final int index = difference + 119;

      // TODO check nullability of _PIECE_MASKS, chess.dart uses a type shift
      if ((_attacks[index] & piece.type.mask) != 0) {
        if (piece.type == pawn) {
          if (difference > 0) {
            if (piece.color == white) return true;
          } else {
            if (piece.color == black) return true;
          }
          continue;
        }

        /* if the piece is a knight or a king */
        if (piece.type == knight || piece.type == king) return true;

        final int offset = _rays[index];
        int j = i + offset;

        bool blocked = false;
        while (j != square) {
          if (_board[j] != null) {
            blocked = true;
            break;
          }
          j += offset;
        }

        if (!blocked) return true;
      }
    }

    return false;
  }

  bool _isKingAttacked(Color color) {
    return _attacked(_swapColor(color), _kings[color]);
  }

  bool isCheck() {
    return _isKingAttacked(_turn);
  }

  bool inCheck() {
    return isCheck();
  }

  bool isCheckmate() {
    return isCheck() && _moves().isEmpty;
  }

  bool isStalemate() {
    return !isCheck() && _moves().isEmpty;
  }

  bool isInsufficientMaterial() {
    // k.b. vs k.b. (of opposite colors) with mate in 1:
    // 8/8/8/8/1b6/8/B1k5/K7 b - - 0 1
    //
    // k.b. vs k.n. with mate in 1:
    // 8/8/8/8/1n6/8/B7/K1k5 b - - 2 1
    final Map<PieceSymbol, int> pieces = <PieceSymbol, int>{
      bishop: 0,
      knight: 0,
      rook: 0,
      queen: 0,
      king: 0,
      pawn: 0,
    };

    final List<int> bishops = <int>[];
    int numPieces = 0;
    int squareColor = 0;

    for (int i = Square.a8.ox88; i <= Square.h1.ox88; i++) {
      squareColor = (squareColor + 1) % 2;
      if ((i & 0x88) != 0) {
        i += 7;
        continue;
      }

      final Piece? piece = _board[i];
      if (piece != null) {
        pieces[piece.type] =
            (pieces.containsKey(piece.type)) ? pieces[piece.type]! + 1 : 1;
        if (piece.type == bishop) {
          bishops.add(squareColor);
        }
        numPieces++;
      }
    }

    // k vs. k
    if (numPieces == 2) {
      return true;
    } else if (
        // k vs. kn .... or .... k vs. kb
        numPieces == 3 && (pieces[bishop] == 1 || pieces[knight] == 1)) {
      return true;
    } else if (numPieces == pieces[bishop]! + 2) {
      // kb vs. kb where any number of bishops are all on the same color
      int sum = 0;
      final int len = bishops.length;
      for (int i = 0; i < len; i++) {
        sum += bishops[i];
      }
      if (sum == 0 || sum == len) {
        return true;
      }
    }

    return false;
  }

  bool isThreefoldRepetition() {
    /* TODO: while this function is fine for casual use, a better
      * implementation would use a Zobrist key (instead of FEN). the
      * Zobrist key would be maintained in the make_move/undo_move
      functions,
      * avoiding the costly that we do below.
      */
    final List<InternalMove> moves = <InternalMove>[];
    final Map<String, int> positions = <String, int>{};
    bool repetition = false;

    while (true) {
      final InternalMove? move = _undoMove();
      if (move == null) {
        break;
      }
      moves.add(move);
    }

    while (true) {
      /* remove the last two fields in the FEN string, they're not needed
       * when checking for draw by rep */
      final String fen = this.fen().split(' ').sublist(0, 4).join(' ');

      /* has the position occurred three or move times */
      positions[fen] = (positions.containsKey(fen)) ? positions[fen]! + 1 : 1;
      if (positions[fen]! >= 3) {
        repetition = true;
      }

      if (moves.isEmpty) {
        break;
      } else {
        final InternalMove move = moves.removeLast();
        _makeMove(move);
      }
    }

    return repetition;
  }

  bool isDraw() {
    return (_halfMoves >= 100 || // 50 moves per side = 100 half moves
        isStalemate() ||
        isInsufficientMaterial() ||
        isThreefoldRepetition());
  }

  bool isGameOver() {
    return isCheckmate() || isStalemate() || isDraw();
  }

  List<Move> moves({Square? square, bool generateSan = false}) {
    final List<InternalMove> moves = _moves(square: square);
    return moves
        .map<Move>(
            (InternalMove move) => _makePretty(move, generateSan: generateSan))
        .toList();
  }

  List<InternalMove> _moves(
      {PieceSymbol? piece, Square? square, bool legal = true}) {
    final List<InternalMove> moves = <InternalMove>[];
    final Color us = _turn;
    final Color them = _swapColor(us);

    int firstSquare = Square.a8.ox88;
    int lastSquare = Square.h1.ox88;
    bool singleSquare = false;

    /* are we generating moves for a single square? */
    if (square != null) {
      firstSquare = lastSquare = square.ox88;
      singleSquare = true;
    }

    for (int from = firstSquare; from <= lastSquare; from++) {
      /* did we run off the end of the board */
      if ((from & 0x88) != 0) {
        from += 7;
        continue;
      }

      // empty square or opponent, skip
      if (_board[from] == null || _board[from]?.color == them) {
        continue;
      }
      final PieceSymbol type = _board[from]!.type;

      int to = 0;
      if (type == pawn) {
        if (piece != null && piece != type) continue;

        /* single square, non-capturing */
        to = from + _pawnOffsets[us]![0];
        if (_board[to] == null) {
          _addMove(moves: moves, color: us, from: from, to: to, piece: pawn);

          /* double square */
          to = from + _pawnOffsets[us]![1];
          if (_secondRank[us] == _rank(from) && _board[to] == null) {
            _addMove(
                moves: moves,
                color: us,
                from: from,
                to: to,
                piece: pawn,
                flags: MoveTypes.bigPawn.bit);
          }
        }

        /* pawn captures */
        for (int j = 2; j < 4; j++) {
          to = from + _pawnOffsets[us]![j];
          if ((to & 0x88) != 0) continue;

          if (_board[to]?.color == them) {
            _addMove(
                moves: moves,
                color: us,
                from: from,
                to: to,
                piece: pawn,
                captured: _board[to]!.type,
                flags: MoveTypes.capture.bit);
          } else if (to == _epSquare) {
            _addMove(
                moves: moves,
                color: us,
                from: from,
                to: to,
                piece: pawn,
                captured: pawn,
                flags: MoveTypes.epCapture.bit);
          }
        }
      } else {
        if (piece != null && piece != type) continue;

        for (int j = 0, len = _pieceOffsets[type]!.length; j < len; j++) {
          final int offset = _pieceOffsets[type]![j];
          to = from;

          while (true) {
            to += offset;
            if ((to & 0x88) != 0) break;

            if (_board[to] == null) {
              _addMove(
                  moves: moves, color: us, from: from, to: to, piece: type);
            } else {
              // own color, stop loop
              if (_board[to]?.color == us) break;

              _addMove(
                  moves: moves,
                  color: us,
                  from: from,
                  to: to,
                  piece: type,
                  captured: _board[to]?.type,
                  flags: MoveTypes.capture.bit);
              break;
            }

            /* break, if knight or king */
            if (type == knight || type == king) break;
          }
        }
      }
    }

    /* check for castling if:
     * a) we're generating all moves, or
     * b) we're doing single square move generation on the king's square
     */
    if (piece == null || piece == king) {
      if (!singleSquare || lastSquare == _kings[us]) {
        /* king-side castling */
        if ((_castling[us] & MoveTypes.ksideCastle.bit) != 0) {
          final int castlingFrom = _kings[us];
          final int castlingTo = castlingFrom + 2;

          if (_board[castlingFrom + 1] == null &&
              _board[castlingTo] == null &&
              !_attacked(them, _kings[us]) &&
              !_attacked(them, castlingFrom + 1) &&
              !_attacked(them, castlingTo)) {
            _addMove(
                moves: moves,
                color: us,
                from: _kings[us],
                to: castlingTo,
                piece: king,
                flags: MoveTypes.ksideCastle.bit);
          }
        }
        /* queen-side castling */
        if ((_castling[us] & MoveTypes.qsideCastle.bit) != 0) {
          final int castlingFrom = _kings[us];
          final int castlingTo = castlingFrom - 2;

          if (_board[castlingFrom - 1] == null &&
              _board[castlingFrom - 2] == null &&
              _board[castlingFrom - 3] == null &&
              !_attacked(them, _kings[us]) &&
              !_attacked(them, castlingFrom - 1) &&
              !_attacked(them, castlingTo)) {
            _addMove(
                moves: moves,
                color: us,
                from: _kings[us],
                to: castlingTo,
                piece: king,
                flags: MoveTypes.qsideCastle.bit);
          }
        }
      }
    }

    /* return all pseudo-legal moves (this includes moves that allow the king
     * to be captured) */
    if (!legal) {
      return moves;
    }

    /* filter out illegal moves */
    final List<InternalMove> legalMoves = <InternalMove>[];

    for (int i = 0, len = moves.length; i < len; i++) {
      _makeMove(moves[i]);
      if (!_isKingAttacked(us)) {
        legalMoves.add(moves[i]);
      }
      _undoMove();
    }

    return legalMoves;
  }

  Move? move(
      {Square? from,
      Square? to,
      PieceSymbol? promotion,
      bool sloppy = false,
      String? san}) {
    /* The move function can be called with in the following parameters:
        *
        * .move('Nxb7')      <- where 'move' is a case-sensitive SAN string
        *
        * .move({ from: 'h7', <- where the 'move' is a move object
        (additional
        *         to :'h8',      fields are ignored)
        *         promotion: 'q',
        *      })
        */

    // sloppy parser allows the move parser to work around over disambiguation
    // bugs in Fritz and Chessbase

    InternalMove? moveObj;

    if (san != null) {
      moveObj = _moveFromSan(move: san, sloppy: sloppy);
    } else if (from != null && to != null) {
      final List<InternalMove> moves = _moves();

      /* convert the pretty move object to an ugly move object */
      for (int i = 0, len = moves.length; i < len; i++) {
        if (from == _algebraic(moves[i].from) &&
            to == _algebraic(moves[i].to) &&
            (!(moves[i].toString().contains('promotion')) ||
                promotion == moves[i].promotion)) {
          moveObj = moves[i];
          break;
        }
      }
    }

    /* failed to find move */
    if (moveObj == null) {
      return null;
    }

    /* need to make a copy of move because we can't generate SAN after
       the move is made */
    final Move prettyMove = _makePretty(moveObj);

    _makeMove(moveObj);

    return prettyMove;
  }

  void _push(InternalMove move) {
    _history.add(History(
      move,
      ColorMap<int>.clone(_kings),
      _turn,
      ColorMap<int>.clone(_castling),
      _epSquare,
      _halfMoves,
      _moveNumber,
    ));
  }

  void _makeMove(InternalMove move) {
    final Color us = _turn;
    final Color them = _swapColor(us);
    _push(move);

    _board[move.to] = _board[move.from];
    _board[move.from] = null;

    /* if ep capture, remove the captured pawn */
    if ((move.flags & MoveTypes.epCapture.bit) != 0) {
      if (_turn == black) {
        _board[move.to - 16] = null;
      } else {
        _board[move.to + 16] = null;
      }
    }

    /* if pawn promotion, replace with new piece */
    if (move.promotion != null) {
      _board[move.to] = Piece(us, move.promotion!);
    }

    /* if we moved the king */
    if (_board[move.to]?.type == king) {
      _kings[us] = move.to;

      /* if we castled, move the rook next to the king */
      if ((move.flags & MoveTypes.ksideCastle.bit) != 0) {
        final int castlingTo = move.to - 1;
        final int castlingFrom = move.to + 1;
        _board[castlingTo] = _board[castlingFrom];
        _board[castlingFrom] = null;
      } else if ((move.flags & MoveTypes.qsideCastle.bit) != 0) {
        final int castlingTo = move.to + 1;
        final int castlingFrom = move.to - 2;
        _board[castlingTo] = _board[castlingFrom];
        _board[castlingFrom] = null;
      }

      /* turn off castling */
      _castling[us] = 0;
    }

    /* turn off castling if we move a rook */
    if (_castling[us] != 0) {
      for (int i = 0, len = _rooks[us]!.length; i < len; i++) {
        if (move.from == _rooks[us]![i].ox88 &&
            ((_castling[us] & _rooks[us]![i].bit) != 0)) {
          _castling[us] ^= _rooks[us]![i].bit;
          break;
        }
      }
    }

    /* turn off castling if we capture a rook */
    if (_castling[them] != 0) {
      for (int i = 0, len = _rooks[them]!.length; i < len; i++) {
        if (move.to == _rooks[them]![i].ox88 &&
            ((_castling[them] & _rooks[them]![i].bit) != 0)) {
          _castling[them] ^= _rooks[them]![i].bit;
          break;
        }
      }
    }

    /* if big pawn move, update the en passant square */
    if ((move.flags & MoveTypes.bigPawn.bit) != 0) {
      if (us == black) {
        _epSquare = move.to - 16;
      } else {
        _epSquare = move.to + 16;
      }
    } else {
      _epSquare = _empty;
    }

    /* reset the 50 move counter if a pawn is moved or a piece is captured */
    if (move.piece == pawn) {
      _halfMoves = 0;
    } else if ((move.flags &
            (MoveTypes.capture.bit | MoveTypes.epCapture.bit)) !=
        0) {
      _halfMoves = 0;
    } else {
      _halfMoves++;
    }

    if (us == black) {
      _moveNumber++;
    }

    _turn = them;
  }

  Move? undo() {
    final InternalMove? move = _undoMove();
    return move != null ? _makePretty(move) : null;
  }

  InternalMove? _undoMove() {
    if (_history.isEmpty) {
      return null;
    }
    final History old = _history.removeLast();

    final InternalMove move = old.move;

    _kings = old.kings;
    _turn = old.turn;
    _castling = old.castling;
    _epSquare = old.epSquare;
    _halfMoves = old.halfMoves;
    _moveNumber = old.moveNumber;

    final Color us = _turn;
    final Color them = _swapColor(us);

    _board[move.from] = _board[move.to];
    _board[move.from] = Piece(us, move.piece); // to undo any promotions
    _board[move.to] = null;

    if (move.captured != null) {
      if ((move.flags & MoveTypes.epCapture.bit) != 0) {
        // en passant capture
        int index;
        if (us == black) {
          index = move.to - 16;
        } else {
          index = move.to + 16;
        }
        _board[index] = Piece(them, pawn);
      } else {
        // regular capture
        _board[move.to] = Piece(them, move.captured!);
      }
    }

    if ((move.flags &
            (MoveTypes.ksideCastle.bit | MoveTypes.qsideCastle.bit)) !=
        0) {
      int castlingTo;
      int castlingFrom;
      if ((move.flags & MoveTypes.ksideCastle.bit) != 0) {
        castlingTo = move.to + 1;
        castlingFrom = move.to - 1;
      } else {
        castlingTo = move.to - 2;
        castlingFrom = move.to + 1;
      }

      _board[castlingTo] = _board[castlingFrom];
      _board[castlingFrom] = null;
    }

    return move;
  }

  String pgn({
    String newline = '\n',
    int maxWidth = 0,
  }) {
    /* using the specification from http://www.chessclub.com/help/PGN-spec
     * example for html usage: .pgn({ max_width: 72, newline_char: "<br />" })
     */
    final List<String> result = <String>[];
    bool headerExists = false;

    /* add the PGN header information */
    for (final String i in _header.values) {
      /* TODO: order of enumerated properties in header object is not
       * guaranteed, see ECMA-262 spec (section 12.6.4)
       */
      result.add('[$i "${_header[i]!}"]$newline');
      headerExists = true;
    }

    if (headerExists && _history.isNotEmpty) {
      result.add(newline);
    }

    String? appendComment(String? moveString) {
      final String? comment = _comments[fen()];
      if (comment != null) {
        final String delimiter =
            (moveString != null && moveString.isNotEmpty) ? ' ' : '';
        moveString = '$moveString$delimiter{$comment}';
      }
      return moveString;
    }

    /* pop all of history onto reversed_history */
    final List<InternalMove> reversedHistory = <InternalMove>[];
    while (_history.isNotEmpty) {
      reversedHistory.add(_undoMove()!);
    }

    final List<String?> moves = <String>[];
    String? moveString = '';

    /* special case of a commented starting position with no moves */
    if (reversedHistory.isEmpty) {
      moves.add(appendComment(''));
    }

    /* build the list of moves.  a move_string looks like: "3. e3 e6" */
    while (reversedHistory.isNotEmpty) {
      moveString = appendComment(moveString);
      final InternalMove move = reversedHistory.removeLast();

      /* // make TypeScript stop complaining about move being undefined
  if (!move) {
  break;
  } */

      /* if the position started with black to move, start PGN with #. ... */
      if (_history.isEmpty && move.color == Color.black) {
        final String prefix = '$_moveNumber. ...';
        /* is there a comment preceding the first move? */
        moveString = moveString != null ? '$moveString $prefix' : prefix;
      } else if (move.color == Color.white) {
        /* store the previous generated move_string if we have one */
        if (moveString != null && moveString.isNotEmpty) {
          moves.add(moveString);
        }
        moveString = '$_moveNumber.';
      }

      moveString = '$moveString ${_moveToSan(move, _moves(legal: true))}';
      _makeMove(move);
    }

    /* are there any other leftover moves? */
    if (moveString != null && moveString.isNotEmpty) {
      moves.add(appendComment(moveString));
    }

    /* is there a result? */
    if (_header['Result'] != null) {
      moves.add(_header['Result']!);
    }

    /* history should be back to what it was before we started generating PGN,
     * so join together moves
     */
    if (maxWidth == 0) {
      return result.join('') + moves.join(' ');
    }

    // JAH: huh?
    bool strip() {
      if (result.isNotEmpty && result[result.length - 1] == ' ') {
        result.removeLast();
        return true;
      }
      return false;
    }

    /* NB: this does not preserve comment whitespace. */
    int wrapComment(int width, String move) {
      for (final String token in move.split(' ')) {
        if (token.isEmpty) {
          continue;
        }
        if (width + token.length > maxWidth) {
          while (strip()) {
            width--;
          }
          result.add(newline);
          width = 0;
        }
        result.add(token);
        width += token.length;
        result.add(' ');
        width++;
      }
      if (strip()) {
        width--;
      }
      return width;
    }

    /* wrap the PGN output at max_width */
    int currentWidth = 0;
    for (int i = 0; i < moves.length; i++) {
      if (currentWidth + moves[i]!.length > maxWidth) {
        if (moves[i]!.contains('{')) {
          currentWidth = wrapComment(currentWidth, moves[i]!);
          continue;
        }
      }
      /* if the current move will push past max_width */
      if (currentWidth + moves[i]!.length > maxWidth && i != 0) {
        /* don't end the line with whitespace */
        if (result[result.length - 1] == ' ') {
          result.removeLast();
        }

        result.add(newline);
        currentWidth = 0;
      } else if (i != 0) {
        result.add(' ');
        currentWidth++;
      }
      result.add(moves[i]!);
      currentWidth += moves[i]!.length;
    }

    return result.join('');
  }

  Map<String, String> header(List<String> args) {
    for (int i = 0; i < args.length; i += 2) {
      // TODO wants to check out of bounds
      _header[args[i]] = args[i + 1];
    }
    return _header;
  }

  /*
  bool loadPgn({required String pgn,
  bool sloppy = false,
  String newlineChar = '\r?\n',
  }) {
  // option sloppy=true
  // allow the user to specify the sloppy move parser to work around over
  // disambiguation bugs in Fritz and Chessbase

  String mask(String str) {
  return str.replaceAll(RegExp(r'\\g'), '\\');
  }

  Map<String, String> parsePgnHeader(String header) {
  final Map<String, String> headerObj = <String, String>{};
  final List<String> headers = header.split(RegExp(mask(newlineChar)));
  String key = '';
  String value = '';

  for (int i = 0; i < headers.length; i++) {
  final RegExp regex = RegExp(r'^\s*\[([A-Za-z]+)\s*"(.*)"\s*\]\s*$');
  key = headers[i].replaceAll(regex, r'$1');
  value = headers[i].replaceAll(regex, r'$2');
  if (key.trim().isNotEmpty) {
  headerObj[key] = value;
  }
  }

  return headerObj;
  }

  // strip whitespace from head/tail of PGN block
  pgn = pgn.trim();

  // RegExp to split header. Takes advantage of the fact that header and movetext
  // will always have a blank line between them (ie, two newline_char's).
  // With default newline_char, will equal: /^(\[((?:\r?\n)|.)*\])(?:\s*\r?\n){2}/
  final RegExp headerRegex = RegExp(
  r'^(\\[((?:' +
  mask(newlineChar) +
  r')|.)*\\])' +
  r'(?:\\s*' +
  mask(newlineChar) +
  r'){2}'
  );

  // If no header given, begin with moves.
  final List<String> headerRegexResults = headerRegex.allMatches(pgn).map((RegExpMatch e) => e.toString()).toList();
  final String headerString = headerRegexResults.isNotEmpty
  ? headerRegexResults.length >= 2
  ? headerRegexResults[1]
      : ''
      : '';

  // Put the board in the starting position
  reset();

  /* parse PGN header */
  final Map<String, String> headers = parsePgnHeader(headerString);
  String fen = '';

  for (final String key in headers.keys) {
  // check to see user is including fen (possibly with wrong tag case)
  if (key.toLowerCase() == 'fen') {
  fen = headers[key]!;
  }

  header(<String>[key, headers[key]!]);
  }

  /* sloppy parser should attempt to load a fen tag, even if it's
     * the wrong case and doesn't include a corresponding [SetUp "1"] tag */
  if (sloppy) {
  if (fen.isNotEmpty) {
  load(fen: fen, keepHeaders: true);
  }
  } else {
  /* strict parser - load the starting position indicated by [Setup '1']
       * and [FEN position] */
  if (headers['SetUp'] == '1') {
  if (!(headers.containsKey('FEN'))) {
  throw Exception(
  'Invalid PGN: FEN tag must be supplied with SetUp tag'
  );
  }
  // second argument to load: don't clear the headers
  load(fen: headers['FEN']!, keepHeaders: true);
  }
  }

  /* NB: the regexes below that delete move numbers, recursive
     * annotations, and numeric annotation glyphs may also match
     * text in comments. To prevent this, we transform comments
     * by hex-encoding them in place and decoding them again after
     * the other tokens have been deleted.
     *
     * While the spec states that PGN files should be ASCII encoded,
     * we use {en,de}codeURIComponent here to support arbitrary UTF8
     * as a convenience for modern users */

  String toHex(String s) {
  return s.split('')
      .map((String c) {
  /* encodeURI doesn't transform most ASCII characters,
           * so we handle these ourselves */
  return c.codeUnits.first < 128
  ? c.codeUnits.first.toRadixString(16)
      : Uri.encodeComponent(c).toString().replaceAll(RegExp(r'%g'), '').toLowerCase();
  })
      .join('');
  }

  String fromHex(String s) {
  /* return s.isEmpty
  ? ''
      : Uri.decodeComponent('%' + (RegExp(r'/.{1,2}/g)').hasMatch(s) ?  RegExp(r'/.{1,2}/g)').allMatches(s) : []).join('%')); */
  if (s.isEmpty) {
  return '';
  } else {
  // TODO fix regex
  final Iterable<RegExpMatch> regex = RegExp(r'({1,2}g)').allMatches(s);
  return '%${regex.join('%')}';
  }

  }

  String encodeComment(String s) {
  s = s.replaceAll(RegExp(mask(newlineChar)), ' ');
  return '{${toHex(s.substring(1, s.length - 1))}}';
  }

  String? decodeComment(String s) {
  if (s.startsWith('{') && s.endsWith('}')) {
  return fromHex(s.substring(1, s.length - 1));
  } else {
    return null;
  }
  }


  /* delete header to get the moves */
  // TODO finish loadPgn
  /*
  return bracket != null
  ? encodeComment(bracket)
      : ' ${encodeComment('{${semicolon.slice(1)}}')}';
  }; */ /*
  String ms = pgn
      .replaceAll(headerString, '')
      .replaceAll(
  /* encode comments so they don't get deleted below */
  RegExp('({[^}]*})+?|;([^${mask(newlineChar)}]*)'))
      .replaceAll(RegExp(mask(newlineChar)), ' ');

  /* delete recursive annotation variations */
  const ravRegex = /(\([^()]+\))+?/g
  while (ravRegex.test(ms)) {
  ms = ms.replace(ravRegex, '')
  }

  /* delete move numbers */
  ms = ms.replace(/\d+\.(\.\.)?/g, '')

  /* delete ... indicating black to move */
  ms = ms.replace(/\.\.\./g, '')

  /* delete numeric annotation glyphs */
  ms = ms.replace(/\$\d+/g, '')

  /* trim and get array of moves */
  let moves = ms.trim().split(new RegExp(/\s+/))

  /* delete empty entries */
  moves = moves.join(',').replace(/,,+/g, ',').split(',')

  let result = ''

  for (let halfMove = 0; halfMove < moves.length; halfMove++) {
  const comment = decodeComment(moves[halfMove])
  if (comment !== undefined) {
  this._comments[this.fen()] = comment
  continue
  }

  const move = this._moveFromSan(moves[halfMove], sloppy)

  /* invalid move */
  if (move == null) {
  /* was the move an end of game marker */
  if (TERMINATION_MARKERS.indexOf(moves[halfMove]) > -1) {
  result = moves[halfMove]
  } else {
  return false
  }
  } else {
  /* reset the end of game marker if making a valid move */
  result = ''
  this._makeMove(move)
  }
  }

  /* Per section 8.2.6 of the PGN spec, the Result tag pair must match
* match the termination marker. Only do this when headers are
        present,
        * but the result tag is missing
        */
  if (result && Object.keys(this._header).length && !this._header['Result']) {
  this.header('Result', result)
  }

  return true
} */

  return true;
  } */

  /* convert a move from 0x88 coordinates to Standard Algebraic Notation
    * (SAN)
    *
    * @param {boolean} sloppy Use the sloppy SAN generator to work around
    over
    * disambiguation bugs in Fritz and Chessbase.  See below:
    *
    * r1bqkbnr/ppp2ppp/2n5/1B1pP3/4P3/8/PPPP2PP/RNBQK1NR b KQkq - 2 4
    * 4. ... Nge7 is overly disambiguated because the knight on c6 is pinned
    * 4. ... Ne7 is technically the valid SAN
    */
  String _moveToSan(InternalMove move, List<InternalMove> moves) {
    String output = '';

    if ((move.flags & MoveTypes.ksideCastle.bit) != 0) {
      output = 'O-O';
    } else if ((move.flags & MoveTypes.qsideCastle.bit) != 0) {
      output = 'O-O-O';
    } else {
      if (move.piece != pawn) {
        final String disambiguator = _getDisambiguator(move, moves);
        output += move.piece.letter.toUpperCase() + disambiguator;
      }

      if ((move.flags & (MoveTypes.capture.bit | MoveTypes.epCapture.bit)) !=
          0) {
        if (move.piece == pawn) {
          output += _algebraic(move.from).name[0];
        }
        output += 'x';
      }

      output += _algebraic(move.to).name;

      if (move.promotion != null) {
        output += '=${move.promotion!.letter.toUpperCase()}';
      }
    }

    _makeMove(move);
    if (isCheck()) {
      if (isCheckmate()) {
        output += '#';
      } else {
        output += '+';
      }
    }
    _undoMove();

    return output;
  }

  // convert a move from Standard Algebraic Notation (SAN) to 0x88
  // coordinates
  InternalMove? _moveFromSan({required String move, bool sloppy = false}) {
    // strip off any move decorations: e.g Nf3+?! becomes Nf3
    final String cleanMove = _strippedSan(move);

    PieceSymbol? pieceType = _inferPieceType(cleanMove)!;
    List<InternalMove> moves = _moves(piece: pieceType, legal: true);

    // strict parser
    for (int i = 0, len = moves.length; i < len; i++) {
      if (cleanMove == _strippedSan(_moveToSan(moves[i], moves))) {
        return moves[i];
      }
    }

    // strict parser failed and the sloppy parser wasn't used, return null
    if (!sloppy) {
      return null;
    }

    String? piece;
    String? from;
    Square? to;
    String? promotion;

    // The sloppy parser allows the user to parse non-standard chess
    // notations. This parser is opt-in (by specifying the
    // '{ sloppy: true }' setting) and is only run after the Standard
    // Algebraic Notation (SAN) parser has failed.
    //
    // When running the sloppy parser, we'll run a regex to grab the piece,
    // the to/from square, and an optional promotion piece. This regex will
    // parse common non-standard notation like: Pe2-e4, Rc1c4, Qf3xf7,
    // f7f8q, b1c3

    // NOTE: Some positions and moves may be ambiguous when using the
    // sloppy parser. For example, in this position:
    // 6k1/8/8/B7/8/8/8/BN4K1 w - - 0 1, the move b1c3 may be interpreted
    // as Nc3 or B1c3 (a disambiguated bishop move). In these cases, the
    // sloppy parser will default to the most most basic interpretation
    // (which is b1c3 parsing to Nc3).

    // FIXME: these var's are hoisted into function scope, this will need
    // to change when switching to const/let

    bool overlyDisambiguated = false;

    //     piece         from              to       promotion
    RegExpMatch? matches =
        RegExp(r'([pnbrqkPNBRQK])?([a-h][1-8])x?-?([a-h][1-8])([qrbnQRBN])?')
            .firstMatch(cleanMove);

    if (matches != null) {
      piece = matches.group(1);
      from = matches.group(2);
      to = Square.values.byName(matches.group(3)!);
      promotion = matches.group(4);

      if (from!.length == 1) {
        overlyDisambiguated = true;
      }
    } else {
      // The [a-h]?[1-8]? portion of the regex below handles moves that may
      // be overly disambiguated (e.g. Nge7 is unnecessary and non-standard
      // when there is one legal knight move to e7). In this case, the value
      // of 'from' variable will be a rank or file, not a square.
      matches = RegExp(
              r'([pnbrqkPNBRQK])?([a-h]?[1-8]?)x?-?([a-h][1-8])([qrbnQRBN])?')
          .firstMatch(cleanMove);

      if (matches != null) {
        piece = matches.group(1);
        from = matches.group(2);
        to = Square.values.byName(matches.group(3)!);
        promotion = matches.group(4);

        if (from!.length == 1) {
          overlyDisambiguated = true;
        }
      }
    }

    pieceType = _inferPieceType(cleanMove);
    moves = _moves(
      legal: true,
      piece: piece != null ? (PieceSymbol.fromLetter(piece)) : pieceType,
    );

    for (int i = 0, len = moves.length; i < len; i++) {
      if (from != null && to != null) {
        // hand-compare move properties with the results from our sloppy
        // regex
        if (Square.values.map((Square e) => e.name).contains(from) &&
            (piece == null || piece.toLowerCase() == moves[i].piece.letter) &&
            Square.values.byName(from).ox88 == moves[i].from &&
            Square.values.byName(from).ox88 == moves[i].to &&
            (promotion == null ||
                promotion.toLowerCase() == moves[i].promotion?.letter)) {
          return moves[i];
        } else if (overlyDisambiguated) {
          // SPECIAL CASE: we parsed a move string that may have an
          // unneeded rank/file disambiguator (e.g. Nge7).  The 'from'
          // variable will

          final Square square = _algebraic(moves[i].from);
          if ((piece == null || piece.toLowerCase() == moves[i].piece.letter) &&
              to.ox88 == moves[i].to &&
              (from == square.name[0] || from == square.name[1]) &&
              (promotion == null ||
                  promotion.toLowerCase() == moves[i].promotion?.letter)) {
            return moves[i];
          }
        }
      }
    }
    return null;
  }

  String ascii() {
    String s = '   +------------------------+\n';
    for (int i = Square.a8.ox88; i <= Square.h1.ox88; i++) {
      /* display the rank */
      if (_file(i) == 0) {
        s += ' ${'87654321'[_rank(i)]} |';
      }

      if (_board[i] != null) {
        final PieceSymbol piece = _board[i]!.type;
        final Color color = _board[i]!.color;
        final String symbol = color == white
            ? piece.letter.toUpperCase()
            : piece.letter.toLowerCase();
        s += ' $symbol ';
      } else {
        s += ' . ';
      }

      if (((i + 1) & 0x88) != 0) {
        s += '|\n';
        i += 8;
      }
    }
    s += '   +------------------------+\n';
    s += '     a  b  c  d  e  f  g  h';

    return s;
  }

  int perft(int depth) {
    final List<InternalMove> moves = _moves(legal: false);
    int nodes = 0;
    final Color color = _turn;

    for (int i = 0, len = moves.length; i < len; i++) {
      _makeMove(moves[i]);
      if (!_isKingAttacked(color)) {
        if (depth - 1 > 0) {
          nodes += perft(depth - 1);
        } else {
          nodes++;
        }
      }
      _undoMove();
    }

    return nodes;
  }

  Move _makePretty(InternalMove uglyMove, {bool generateSan = false}) {
    List<MoveTypes> prettyFlags = <MoveTypes>[];

    for (final MoveTypes flag in MoveTypes.values) {
      if ((flag.bit & uglyMove.flags) != 0) {
        prettyFlags.add(flag);
      }
    }

    final Move move;
    if (generateSan) {
      move = SanMove(
          piece: uglyMove.piece,
          color: uglyMove.color,
          from: _algebraic(uglyMove.from),
          to: _algebraic(uglyMove.to),
          captured: uglyMove.captured,
          promotion: uglyMove.promotion,
          san: _moveToSan(uglyMove, _moves(legal: true)),
          flags: prettyFlags);
    } else {
      move = Move(
          piece: uglyMove.piece,
          color: uglyMove.color,
          from: _algebraic(uglyMove.from),
          to: _algebraic(uglyMove.to),
          captured: uglyMove.captured,
          promotion: uglyMove.promotion,
          flags: prettyFlags);
    }

    return move;
  }

  Color turn() {
    return _turn;
  }

  List<List<({Square square, Piece? piece})>> board() {
    final List<List<({Square square, Piece? piece})>> output =
        <List<({Square square, Piece? piece})>>[];
    List<({Square square, Piece? piece})> row =
        <({Square square, Piece? piece})>[];

    for (int i = Square.a8.ox88; i <= Square.h1.ox88; i++) {
      if (_board[i] == null) {
        row.add((square: _algebraic(i), piece: null));
      } else {
        row.add(((square: _algebraic(i), piece: _board[i])));
      }
      if (((i + 1) & 0x88) != 0) {
        output.add(row);
        row = <({Square square, Piece? piece})>[];
        i += 8;
      }
    }

    return output;
  }

  Color? squareColor(Square square) {
    if (Square.values.contains(square)) {
      final int sq = square.ox88;
      return (((_rank(sq) + _file(sq)) % 2) == 0 ? Color.white : Color.black);
    }

    return null;
  }

  List<Move> history({bool generateSan = false}) {
    final List<InternalMove> reversedHistory = <InternalMove>[];
    final List<Move> moveHistory = <Move>[];

    while (_history.isNotEmpty) {
      reversedHistory.add(_undoMove()!);
    }

    while (true) {
      if (reversedHistory.isEmpty) {
        break;
      }
      final InternalMove move = reversedHistory.removeLast();

      moveHistory.add(_makePretty(move, generateSan: generateSan));
      _makeMove(move);
    }

    return moveHistory;
  }

  void _pruneComments() {
    final List<InternalMove> reversedHistory = <InternalMove>[];
    final Map<String, String> currentComments = <String, String>{};

    void copyComment(String fen) {
      if (_comments.containsKey(fen)) {
        currentComments[fen] = _comments[fen]!;
      }
    }

    while (_history.isNotEmpty) {
      reversedHistory.add(_undoMove()!);
    }

    copyComment(fen());

    while (true) {
      if (reversedHistory.isEmpty) {
        break;
      }
      final InternalMove move = reversedHistory.removeLast();

      _makeMove(move);
      copyComment(fen());
    }
    _comments = currentComments;
  }

  String? getComment() {
    return _comments[fen()];
  }

  void setComment(String comment) {
    _comments[fen()] = comment.replaceAll('{', '[').replaceAll('}', ']');
  }

  String? deleteComment() {
    final String? comment = _comments[fen()];
    _comments.remove(fen());
    return comment;
  }

  Map<String, String> getComments() {
    _pruneComments();
    return _comments;
  }

  void deleteComments() {
    _pruneComments();
    _comments.clear();
  }
}

// PUBLIC -->
enum Color {
  white('w'),
  black('b');

  const Color(this.letter);
  final String letter;

  @override
  String toString() => name;

  static Color? fromLetter(String letter) {
    if (letter == 'w') {
      return Color.white;
    } else if (letter == 'b') {
      return Color.black;
    }
    return null;
  }
}

enum PieceSymbol {
  pawn('p', 0x1),
  knight('n', 0x2),
  bishop('b', 0x4),
  rook('r', 0x8),
  queen('q', 0x10),
  king('k', 0x20);

  const PieceSymbol(this.letter, this.mask);
  final String letter;
  final int mask;

  @override
  String toString() => name;

  static PieceSymbol? fromLetter(String letter) {
    for (final PieceSymbol pieceOpt in PieceSymbol.values) {
      if (pieceOpt.letter == letter.toLowerCase()) return pieceOpt;
    }
    return null;
  }
}

class Piece {
  final Color color;
  final PieceSymbol type;

  const Piece(this.color, this.type);

  @override
  int get hashCode => color.hashCode ^ type.hashCode;

  @override
  bool operator ==(Object other) =>
      other is Piece && (color == other.color && type == other.type);
}

class Move {
  final Color color;
  final Square from;
  final Square to;
  final PieceSymbol piece;
  final PieceSymbol? captured;
  final PieceSymbol? promotion;
  final List<MoveTypes> flags;

  const Move(
      {required this.color,
      required this.from,
      required this.to,
      required this.piece,
      this.captured,
      this.promotion,
      required this.flags});

  @override
  String toString() =>
      '$color $piece from $from to $to ${captured != null ? 'capturing $captured' : ''} ${promotion != null ? 'promoting to $promotion' : ''}';

  @override
  int get hashCode =>
      color.hashCode ^
      from.hashCode ^
      to.hashCode ^
      piece.hashCode ^
      captured.hashCode ^
      promotion.hashCode ^
      flags.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is Move) {
      final String otherFlags = other.flags.fold<String>(
          '',
          (String previousValue, MoveTypes element) =>
              previousValue += element.flag);
      final String thisFlags = flags.fold<String>(
          '',
          (String previousValue, MoveTypes element) =>
              previousValue += element.flag);

      return otherFlags == thisFlags &&
          color == other.color &&
          from == other.from &&
          to == other.to &&
          piece == other.piece &&
          captured == other.captured &&
          promotion == other.promotion;
    } else {
      return false;
    }
  }
}

class SanMove extends Move {
  final String san;

  const SanMove(
      {required super.color,
      required super.from,
      required super.to,
      required super.piece,
      super.captured,
      super.promotion,
      required super.flags,
      required this.san});

  @override
  int get hashCode =>
      color.hashCode ^
      from.hashCode ^
      to.hashCode ^
      piece.hashCode ^
      captured.hashCode ^
      promotion.hashCode ^
      flags.hashCode ^
      san.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is SanMove) {
      final String otherFlags = other.flags.fold<String>(
          '',
          (String previousValue, MoveTypes element) =>
              previousValue += element.flag);
      final String thisFlags = flags.fold<String>(
          '',
          (String previousValue, MoveTypes element) =>
              previousValue += element.flag);

      return otherFlags == thisFlags &&
          color == other.color &&
          from == other.from &&
          to == other.to &&
          piece == other.piece &&
          captured == other.captured &&
          promotion == other.promotion &&
          san == other.san;
    } else {
      return false;
    }
  }
}

// includes static const Map<Square, int> _Ox88
enum Square {
  a8(0),
  a7(16),
  a6(32),
  a5(48),
  a4(64),
  a3(80),
  a2(96),
  a1(112),
  b8(1),
  b7(17),
  b6(33),
  b5(49),
  b4(65),
  b3(81),
  b2(97),
  b1(113),
  c8(2),
  c7(18),
  c6(34),
  c5(50),
  c4(66),
  c3(82),
  c2(98),
  c1(114),
  d8(3),
  d7(19),
  d6(35),
  d5(51),
  d4(67),
  d3(83),
  d2(99),
  d1(115),
  e8(4),
  e7(20),
  e6(36),
  e5(52),
  e4(68),
  e3(84),
  e2(100),
  e1(116),
  f8(5),
  f7(21),
  f6(37),
  f5(53),
  f4(69),
  f3(85),
  f2(101),
  f1(117),
  g8(6),
  g7(22),
  g6(38),
  g5(54),
  g4(70),
  g3(86),
  g2(102),
  g1(118),
  h8(7),
  h7(23),
  h6(39),
  h5(55),
  h4(71),
  h3(87),
  h2(103),
  h1(119);

  const Square(this.ox88);
  final int ox88;

  @override
  String toString() => name;
}

enum MoveTypes {
  normal('n', 1),
  capture('c', 2),
  bigPawn('b', 4),
  epCapture('e', 8),
  promotion('p', 16),
  ksideCastle('k', 32),
  qsideCastle('q', 64);

  const MoveTypes(this.flag, this.bit);
  final String flag;
  final int bit;

  @override
  String toString() => name;
}

// PRIVATE -->
class ColorMap<T> {
  T _white;
  T _black;
  ColorMap(T value)
      : _white = value,
        _black = value;
  ColorMap.clone(ColorMap<T> other)
      : _white = other._white,
        _black = other._black;

  T operator [](Color color) {
    return (color == Color.white) ? _white : _black;
  }

  void operator []=(Color color, T value) {
    if (color == Color.white) {
      _white = value;
    } else {
      _black = value;
    }
  }
}

class InternalMove {
  final Color color;
  final int from;
  final int to;
  final PieceSymbol piece;
  final PieceSymbol? captured;
  final PieceSymbol? promotion;
  final int flags;

  const InternalMove(this.color, this.from, this.to, this.piece, this.captured,
      this.promotion, this.flags);
}

class History {
  final InternalMove move;
  final ColorMap<int> kings;
  final Color turn;
  final ColorMap<int> castling;
  final int epSquare;
  final int halfMoves;
  final int moveNumber;

  const History(this.move, this.kings, this.turn, this.castling, this.epSquare,
      this.halfMoves, this.moveNumber);
}

extension Safety on String {
  bool safeIsPresentAt(int indexOf, String whatPresent) {
    try {
      return whatPresent == substring(indexOf, indexOf + 1);
    } catch (_) {
      return false;
    }
  }
}

extension ListAt<T> on List<T> {
  T? at(int index) {
    if (index < 0 || index >= length) return null;
    return this[index];
  }
}
