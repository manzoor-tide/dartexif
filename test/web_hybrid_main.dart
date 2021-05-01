import 'dart:convert';

import "package:stream_channel/stream_channel.dart";

import 'test_util.dart';

Future hybridMain(StreamChannel channel) async {
  await for (final file in readSamples()) {
    channel.sink.add(const JsonEncoder().convert(file));
  }

  channel.sink.close();
}
