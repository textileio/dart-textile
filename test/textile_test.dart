import 'package:textile/textile.dart' as textile;
import 'package:test/test.dart';

void main() async {
  textile.API api;

  setUpAll(() {
    // Create a new threads client
    api = textile.API('<app token>', '<user id>', dev: true, api: '127.0.0.1');
  });
  tearDownAll(() async {
    // Shutdown the threads client.
    await api.shutdown();
  });
  test('Create & start a new data store', () async {
    final storeId = await api.threadsClient.newStore();
    expect(storeId.length, 36);
  });
}
