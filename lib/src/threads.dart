import 'package:threads_client/threads_client.dart' as threads;
import 'auth.dart';
import 'defaults.dart';

class ThreadsConfig extends threads.Config {
  RpcAuthenticator _authenticator;
  ThreadsConfig(String token, String device_id, {bool dev = false, String apiScheme = default_api_scheme, api, sessionPort, threadsPort}) {
    if (dev == true) {
      host = api ?? default_dev_api;
      port = threadsPort ?? default_dev_threads_port;
    } else {
      final registerPort = sessionPort ?? default_session_port;
      host = api ?? default_api;
      port = threadsPort ?? default_threads_port;
      _authenticator = RpcAuthenticator(token, device_id, '${apiScheme}://${host}:${registerPort}/register');
      callOptions = _authenticator.toCallOptions;
    }
  }
}
