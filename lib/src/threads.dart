import 'package:threads_client/threads_client.dart' as threads;
import 'auth.dart';
import 'defaults.dart';

class ThreadsConfig extends threads.Config {
  RpcAuthenticator _authenticator;
  ThreadsConfig(String token, String device_id, {bool dev = false, api = default_api, sessionPort = default_session_port, threadsPort = default_threads_port}) {
    if (dev == false) {
      _authenticator = RpcAuthenticator(token, device_id, '${api}:${sessionPort}/register');
      callOptions = _authenticator.toCallOptions;
    }
    host = api;
    port = threadsPort;
  }
}
