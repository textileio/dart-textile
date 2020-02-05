import 'dart:async';
import 'dart:convert';
import 'package:grpc/grpc.dart';
import 'package:threads_client/threads_client.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

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

class RemoteConfig extends ThreadsConfig {
  TextileRpcAuthenticator _authenticator;
  RemoteConfig(String token, String device_id, {api = '127.0.0.1', sessionPort = 8006, threadsPort = 6006}) {
    _authenticator = TextileRpcAuthenticator(token, device_id, '${api}:${sessionPort}/register');
    callOptions = _authenticator.toCallOptions;
    host = api;
    port = threadsPort;
  }
}
