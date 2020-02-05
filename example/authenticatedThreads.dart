
import 'package:textile/textile.dart' as textile;
import 'package:threads_client/threads_client.dart' as threads;

const APP_TOKEN = '<app token>';
const DEVICE_ID = '<uuid>';

void main(List<String> args) async {
  final config = textile.ThreadsConfig(APP_TOKEN, DEVICE_ID);
  final client = threads.Client(config: config);
  final store = await client.newStore();
  print('New store $store');
}