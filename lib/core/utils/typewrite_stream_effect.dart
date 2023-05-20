
import 'dart:async';

Stream<String> typeWriterText(String text) async* {
  for (int i = 0; i < text.length; i++) {
    await Future.delayed(
        const Duration(milliseconds: 50)); // You can adjust the speed of typing here
    yield text.substring(0, i + 1);
  }
}
