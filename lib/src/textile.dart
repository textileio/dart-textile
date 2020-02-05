library textile;

import 'package:threads_client/threads_client.dart';
import 'threads.dart';
import 'defaults.dart';

class Textile {
  TextileThreadsConfig _threadsConfig;
  Textile(String token, String device_id, {String api = default_api, int sessionPort = default_session_port, int threadsPort = default_threads_port}) {
    _threadsConfig = TextileThreadsConfig(
      token,
      device_id,
      api: api,
      sessionPort: sessionPort,
      threadsPort: threadsPort
    );
  }
  ThreadsClient getThreadsClient() {
    return ThreadsClient(config: _threadsConfig);
  }
}