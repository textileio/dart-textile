library textile;

import 'package:threads_client/threads_client.dart' as threads;
import 'defaults.dart';
import 'threads.dart';

class API {
  ThreadsConfig _threadsConfig;
  threads.Client _client;
  API(String token, String device_id, {bool dev = false, String apiScheme, String api, int sessionPort, int threadsPort}) {
    _threadsConfig = dev == false ? ThreadsConfig(
      token,
      device_id,
      apiScheme: apiScheme ?? default_api_scheme,
      api: api ?? default_api,
      sessionPort: sessionPort ?? default_session_port,
      threadsPort: threadsPort ?? default_threads_port
    ) : ThreadsConfig(
      token,
      device_id,
      dev: dev,
      apiScheme: apiScheme ?? default_dev_api_scheme,
      api: api ?? default_dev_api,
      sessionPort: sessionPort ?? default_dev_session_port,
      threadsPort: threadsPort ?? default_dev_threads_port
    );
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