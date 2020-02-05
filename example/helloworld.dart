
import 'package:textile/textile.dart';
import 'package:threads_client/threads_client.dart';

const APP_TOKEN = '<app token>';
const DEVICE_ID = '<uuid>';

void main(List<String> args) async {
  final config = ThreadsConfig(APP_TOKEN, DEVICE_ID);
  final client = ThreadsClient(config: config);
  final store = await client.newStore();
  print('New store $store');
}