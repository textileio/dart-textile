import 'package:textile/textile.dart' as textile;
import 'package:test/test.dart';

void main() async {
  textile.API api;

  setUpAll(() {
    // Create a new threads client
    api = textile.API('tests', 'tests', dev: true);
  });
  tearDownAll(() async {
    // Shutdown the threads client.
    await api.shutdown();
  });
  test('Create & start a new data store', () async {
    final storeId = await api.threadsClient.newStore();
    await api.threadsClient.start(storeId);
    expect(storeId.length, 36);
  });
}
