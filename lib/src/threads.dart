import 'dart:async';
import 'dart:convert';
import 'package:grpc/grpc.dart';
import 'package:threads_client/threads_client.dart' as threads;
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'auth.dart';
import 'defaults.dart';

class ThreadsConfig extends threads.Config {
  RpcAuthenticator _authenticator;
  ThreadsConfig(String token, String device_id, {api = default_api, sessionPort = default_session_port, threadsPort = default_threads_port}) {
    _authenticator = RpcAuthenticator(token, device_id, '${api}:${sessionPort}/register');
    callOptions = _authenticator.toCallOptions;
    host = api;
    port = threadsPort;
  }
}
