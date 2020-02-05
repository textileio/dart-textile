
import 'package:textile/textile.dart' as textile;

const APP_TOKEN = '<app token>';
const DEVICE_ID = '<uuid>';

/*
 * This example is the exact same as the authenticatedThreads example.
 * However, in this example we use the included threadsClient instead 
 * of the stand-alone library.
*/
void main(List<String> args) async {
  final api = textile.API(APP_TOKEN, DEVICE_ID);
  final store = await api.threadsClient.newStore();
  print('New store $store');
}