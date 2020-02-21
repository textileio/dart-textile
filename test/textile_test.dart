import 'dart:io';
import 'package:textile/textile.dart' as textile;
import 'package:test/test.dart';

void main() async {
  textile.API api;
  final env = Platform.environment;
  setUpAll(() {
    final token = env.containsKey('TXLT_TEST_TOKEN') && env['TXLT_TEST_TOKEN'] != '' ? env['TXLT_TEST_TOKEN'] : '';
    final dev = false; //token == '' ? true : false;
    api = textile.API(
      token,
      '7b2058ea-4f63-11ea-b77f-2e728ce88125',
      dev: dev,
    );
  });
  tearDownAll(() async {
    await api.shutdown();
  });
  test('Create & start a new data store', () async {
    final storeId = await api.threadsClient.newStore();
    expect(storeId.length, 36);
  });
}
