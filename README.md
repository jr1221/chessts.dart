# chessts.dart

### This library is in an alpha state

chessts.dart is a library for legal chess state management and parsing of FEN, SAN, and PGN formats.  
It is a port of chess.js (typescript) to dart, with many changes convenience modifications and changes to enforce strict type standards and null safety.

A brief summary of changes and differences compared to the chess.dart rewrite and the original chess.js (typescript):
 - Uses `Move` and `Square` objects and enhanced enums throughout
 - Has named and optional constructors throughout
 - Changes `verbose` to `fillSan` to add the field `san` in the `Move` object through the subtype `SanMove`
 - Exposes `Ox88` and `bit` to the user through enhanced enums, but makes internal state much more readable
 - Updates internal logic ported from chess.js to match the latest rewrite
 - Uses `Record` types for increased usability and type assurance

Things to do before beta release (0.1):
 - [ ] Finish and test `loadPgn()`
 - [ ] Add a simple user and simple ai game
 - [ ] Wait for Dart 3.0 stable
 - [ ] Add benchmarking capabilities
 - [ ] Inline document all public methods
 - [ ] Reduce type specification verbosity

### Versioning
0.0.x is alpha state, testing only!
0.x.y is beta state
x.y.z is stable code, at which point breaking changes are X release increments

## Special thanks
Thank you to the chess.js and chess.dart authors for their hard work!
