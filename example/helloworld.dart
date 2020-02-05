
import 'package:textile/textile.dart';
import 'package:threads_client/threads_client.dart';

const APP_TOKEN = '<app token>';
const DEVICE_ID = '<uuid>';

void main(List<String> args) async {
  final config = RemoteConfig(APP_TOKEN, DEVICE_ID);
  final client = ThreadsClient(config);
  final store = await client.newStore();
  print('New store $store');
}