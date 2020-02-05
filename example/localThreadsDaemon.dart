
import 'package:textile/textile.dart' as textile;
import 'package:threads_client/threads_client.dart' as threads;

const APP_TOKEN = '<app token>';
const DEVICE_ID = '<uuid>';

/*
 * Run your app against a local Threads daemon for easy testing and debugging.
*/
void main(List<String> args) async {
  final config = textile.ThreadsConfig(APP_TOKEN, DEVICE_ID, dev: true);
  final client = threads.Client(config: config);
  final store = await client.newStore();
  print('New store $store');
}