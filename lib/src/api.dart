library textile;

import 'package:threads_client/threads_client.dart' as threads;
import 'defaults.dart';
import 'threads.dart';

class API {
  ThreadsConfig _threadsConfig;
  threads.Client _client;
  API(
    String token,
    String device_id,
    {
      bool dev = false,
      String scheme,
      String authApi,
      int authPort,
      String threadApiScheme,
      String threadsApi,
      int threadsPort,
    }
  ) {
    if ( dev == false ) {
      final threadScheme = threadApiScheme != null ? '${threadApiScheme}://' : '';
      final threadApi = threadsApi ?? default_thread_api;
      _threadsConfig = ThreadsConfig(
        token,
        device_id,
        dev: false,
        scheme: scheme ?? default_auth_scheme,
        authApi: authApi ?? default_auth_api,
        authPort: authPort ?? default_auth_port,
        threadsHost: '${threadScheme}${threadApi}',
        threadsPort: threadsPort ?? default_threads_port
      );
    } else {
      final threadScheme = threadApiScheme != null ? '${threadApiScheme}://' : '';
      final threadApi = threadsApi ?? default_dev_api;
      _threadsConfig = ThreadsConfig(
        token,
        device_id,
        dev: true,
        scheme: scheme ?? default_dev_api_scheme,
        authApi: authApi ?? default_dev_api,
        authPort: authPort ?? default_dev_auths_port,
        threadsHost: '${threadScheme}${threadApi}',
        threadsPort: threadsPort ?? default_dev_threads_port
      );
    }
  }
  // threadsClient is the same client as you get from running the threads_client library
  threads.Client get threadsClient {
    if (_client != null) {
      return _client;
    }
    _client = threads.Client(config: _threadsConfig);
    return _client;
  }
  // Provides a config you can provide to the threads_client lib on startup
  threads.Config get threadsConfig {
    return _threadsConfig;
  }
  Future<void> shutdown() {
    if (_client != null) {
      return _client.shutdown();
    }
    return Future.value();
  }
}