library textile;

import 'package:threads_client/threads_client.dart' as threads;
import 'defaults.dart';
import 'threads.dart';

class Textile {
  ThreadsConfig _threadsConfig;
  Textile(String token, String device_id, {String api = default_api, int sessionPort = default_session_port, int threadsPort = default_threads_port}) {
    _threadsConfig = ThreadsConfig(
      token,
      device_id,
      api: api,
      sessionPort: sessionPort,
      threadsPort: threadsPort
    );
  }
  threads.Client getThreadsClient() {
    return threads.Client(config: _threadsConfig);
  }
}