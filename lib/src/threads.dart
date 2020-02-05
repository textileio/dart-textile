import 'dart:async';
import 'dart:convert';
import 'package:grpc/grpc.dart';
import 'package:threads_client/src/defaults.dart';
import 'package:threads_client/threads_client.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'defaults.dart';

class TextileRpcAuthenticator extends HttpBasedAuthenticator {
  final String token;
  final String deviceID;
  final String textileAPI;
  TextileRpcAuthenticator(this.token, this.deviceID, this.textileAPI);

  Future<auth.AccessCredentials> obtainCredentialsWithClient(
          http.Client client, String uri) async {
    final response = await client.post(textileAPI, body: '{ "token": "${this.token}", "device_id": "${deviceID}" }');
    final data = json.decode(response.body);
    final expire = DateTime.now().add(Duration(days: 365)).toUtc();
    final token = auth.AccessToken(
      'Bearer',
      data['session_id'],
      expire
    );
    final result = auth.AccessCredentials(
      token,
      null,
      [
        '*'
      ]
    );
    return result;
  }
}

class TextileThreadsConfig extends ThreadsConfig {
  TextileRpcAuthenticator _authenticator;
  TextileThreadsConfig(String token, String device_id, {api = default_api, sessionPort = default_session_port, threadsPort = default_threads_port}) {
    _authenticator = TextileRpcAuthenticator(token, device_id, '${api}:${sessionPort}/register');
    callOptions = _authenticator.toCallOptions;
    host = api;
    port = threadsPort;
  }
}
