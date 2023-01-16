import 'package:dante/src/logger.dart';
import 'package:test/test.dart';

void main() {
  Dante.info('Lorem ipsum dolor sit amet');
  Dante.debug('consectetur adipiscing elit');
  Dante.warning('sed do eiusmod tempor incididunt');
  Dante.error('ut labore et dolore magna aliqua');
  Dante.info(
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  );

  setUp(() {
    Dante.dateTime = DateTime.parse('1995-07-24 00:00:00.000');
    Dante.test = true;
  });

  test('Dante.info', () {
    final log = Dante.info('Lorem ipsum dolor sit amet');
    final l = Dante.i('Lorem ipsum dolor sit amet');
    expect(log, l);
  });

  test('Dante.debug', () {
    final log = Dante.debug('consectetur adipiscing elit');
    final l = Dante.d('consectetur adipiscing elit');
    expect(log, l);
  });

  test('Dante.warning', () {
    final log = Dante.warning('sed do eiusmod tempor incididunt');
    final l = Dante.w('sed do eiusmod tempor incididunt');

    expect(log, l);
  });

  test('Dante.error', () {
    final log = Dante.error('ut labore et dolore magna aliqua');
    final l = Dante.e('ut labore et dolore magna aliqua');
    expect(log, l);

    final errorStackTraceLog =
        Dante.e('null pointer', Error(), StackTrace.fromString('StackTrace'));
    expect(
      errorStackTraceLog,
      '''
null pointer
      Error: Instance of 'Error'
      StackTrace: StackTrace''',
    );

    final errorLog = Dante.e('null pointer', Error());
    expect(
      errorLog,
      '''
null pointer
      Error: Instance of 'Error\'''',
    );
  });

  test('Map', () {
    final log = Dante.info({'a': 'b', 'c': 'd'});

    expect(log, '{a: b, c: d}');
  });

  test('Object', () {
    final log = Dante.info(Object());

    expect(log, 'Instance of \'Object\'');
  });
  test('Long text', () {
    final log = Dante.info(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    );

    expect(
      log,
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    );
  });
}
