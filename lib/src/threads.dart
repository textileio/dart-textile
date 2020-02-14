import 'package:threads_client/threads_client.dart' as threads;
import 'auth.dart';
import 'defaults.dart';

class ThreadsConfig extends threads.Config {
  RpcAuthenticator _authenticator;
  ThreadsConfig(
    String token,
    String device_id,
    {
      bool dev = false,
      String scheme = default_auth_scheme,
      String authApi,
      int authPort,
      String threadsHost,
      int threadsPort,
    }
  ) {
    if (dev == true) {
      host = threadsHost ?? '${default_dev_api}';;
      port = threadsPort ?? default_dev_threads_port;
    } else {
      host = threadsHost ?? '${default_thread_api}';
      port = threadsPort ?? default_threads_port;
      _authenticator = RpcAuthenticator(token, device_id, '${scheme}://${authApi}:${authPort}/register');
      callOptions = _authenticator.toCallOptions;
    }
  }
}
