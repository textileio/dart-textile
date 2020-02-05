import 'dart:io';
import 'package:textile/textile.dart' as textile;
import 'package:test/test.dart';

void main() async {
  textile.API api;
  final env = Platform.environment;
  setUpAll(() {
    final host = env.containsKey('THREADS_HOST') && env['THREADS_HOST'] != '' ? env['THREADS_HOST'] : '127.0.0.1';
    final port = env.containsKey('THREADS_PORT') && env['THREADS_PORT'] != '' ? int.parse(env['THREADS_PORT']) : 6006;
    api = textile.API('<app token>', '<user id>', dev: true, api: host, threadsPort: port);
  });
  tearDownAll(() async {
    await api.shutdown();
  });
  test('Create & start a new data store', () async {
    final storeId = await api.threadsClient.newStore();
    expect(storeId.length, 36);
  });
}
