# DANTE

[![style: ficcanaso](https://img.shields.io/badge/style-ficcanaso-yellow)](https://github.com/dbbd59/ficcanaso)

## Introduction

> Dante is a logging utility for Dart and Flutter projects. It includes methods for logging errors, warnings, debug messages, and information messages. It also supports color-coding of log messages based on the log level, inspired by the best poetry: Dante

## Install

```yaml
dependencies:
    dante:
```

## Usage

```dart
import 'package:dante/dante.dart';

Dante.info('Lorem ipsum dolor sit amet');
📜 🖋  🍀 Dante.I  ⏰ 2021-09-21 21:01:56.302863
      Lorem ipsum dolor sit amet

Dante.debug('consectetur adipiscing elit');
📜 🖋  🍀 Dante.D  ⏰ 2021-09-21 21:01:56.317250
      consectetur adipiscing elit

Dante.warning('sed do eiusmod tempor incididunt');
📜 🖋  🍀 Dante.W  ⏰ 2021-09-21 21:01:56.317566
      sed do eiusmod tempor incididunt

Dante.error('ut labore et dolore magna aliqua');
📜 🖋  🍀 Dante.E  ⏰ 2021-09-21 21:01:56.317876
      ut labore et dolore magna aliqua
```

## Methods
The following methods are provided for logging various levels of messages:
- `Dante.e(message, [error, stackTrace])` or `Dante.error(message, [error, stackTrace])` for logging errors
- `Dante.w(message)` or `Dante.warning(message)` for logging warnings
- `Dante.i(message)` or `Dante.info(message)` for logging informational messages
- `Dante.d(message)` or `Dante.debug(message)` for logging debug messages

### Color-Coding
Dante supports color-coding of log messages based on the log level. This feature is only enabled on Android platforms.

### Testing
Dante includes a `test` variable that can be set to `true` to prevent the log messages from being printed to the console. This can be useful when writing test cases for your application.


