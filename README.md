# dart-textile

[![Made by Textile](https://img.shields.io/badge/made%20by-Textile-informational.svg?style=popout-square)](https://textile.io)
[![Chat on Slack](https://img.shields.io/badge/slack-slack.textile.io-informational.svg?style=popout-square)](https://slack.textile.io)
[![GitHub license](https://img.shields.io/github/license/textileio/dart-textile.svg?style=popout-square)](./LICENSE)
[![Pub](https://img.shields.io/pub/v/textile.svg?style=popout-square)](https://pub.dartlang.org/packages/textile)
[![Threads version](https://img.shields.io/badge/dynamic/yaml?style=popout-square&color=3527ff&label=go-threads&prefix=v&query=packages.threads_client_grpc.version&url=https%3A%2F%2Fgithub.com%2Ftextileio%2Fdart-textile%2Fblob%2Fmaster%2Fpubspec.lock)](https://github.com/textileio/go-threads)
[![Build status](https://img.shields.io/github/workflow/status/textileio/dart-textile/test/master.svg?style=popout-square)](https://github.com/textileio/dart-textile/actions?query=branch%3Amaster)

> Textile's Dart client for interacting with remote Threads

Join us on our [public Slack channel](https://slack.textile.io/) for news, discussions, and status updates. [Check out our blog](https://medium.com/textileio) for the latest posts and announcements.

## Table of Contents

-   [Getting Started](#getting_started)
-   [Contributing](#contributing)
-   [Changelog](#changelog)
-   [License](#license)

## Getting Started

You can use this library to access and use Textile's hosted APIs.

### Examples

Examples require the use of the [threads-client](https://github.com/textileio/dart-threads-client/).

#### Run Threads on Textile APIs

```dart
import 'package:textile/textile.dart' as textile;
import 'package:threads_client/threads_client.dart' as threads;

const APP_TOKEN = '<app token>';
const DEVICE_ID = '<uuid>';

void main(List<String> args) async {
  final config = textile.ThreadsConfig(APP_TOKEN, DEVICE_ID);
  final client = threads.Client(config: config);
  final store = await client.newStore();
  print('New store $store');
}
```

#### Run Threads in Debug mode with local Threads daemon

```dart
import 'package:textile/textile.dart' as textile;
import 'package:threads_client/threads_client.dart' as threads;

const APP_TOKEN = '<app token>';
const DEVICE_ID = '<uuid>';

/*
 * Run your app against a local Threads daemon for easy testing and debugging.
*/
void main(List<String> args) async {
  final config = textile.ThreadsConfig(APP_TOKEN, DEVICE_ID, dev: true);
  final client = threads.Client(config: config);
  final store = await client.newStore();
  print('New store $store');
}
```

#### Run Threads on Textile APIs

```dart

import 'package:textile/textile.dart' as textile;
import 'package:threads_client/threads_client.dart' as threads;

const APP_TOKEN = '<app token>';
const DEVICE_ID = '<uuid>';

void main(List<String> args) async {
  final config = textile.ThreadsConfig(APP_TOKEN, DEVICE_ID);
  final client = threads.Client(config: config);
  final store = await client.newStore();
  print('New store $store');
}
```

## Contributing

This project is a work in progress. As such, there's a few things you can do right now to help out:

-   **Ask questions**! We'll try to help. Be sure to drop a note (on the above issue) if there is anything you'd like to work on and we'll update the issue to let others know. Also [get in touch](https://slack.textile.io) on Slack.
-   **Open issues**, [file issues](https://github.com/textileio/dart-textile/issues), submit pull requests!
-   **Perform code reviews**. More eyes will help a) speed the project along b) ensure quality and c) reduce possible future bugs.
-   **Take a look at the code**. Contributions here that would be most helpful are **top-level comments** about how it should look based on your understanding. Again, the more eyes the better.
-   **Add tests**. There can never be enough tests.

Before you get started, be sure to read our [contributors guide](./CONTRIBUTING.md) and our [contributor covenant code of conduct](./CODE_OF_CONDUCT.md).

## Changelog

[Changelog is published to Releases.](https://github.com/textileio/dart-textile/releases)

## License

[MIT](LICENSE)
