import 'dart:async';

void test() {
  try {
    throwableFunc().onError((error, stackTrace) => print(error));
  } catch (e) {
    print(e);
  }
  countDownFrom(15).forEach((element) { print(element); });
}

void testInWidget() {
  Future<String> future = Future.delayed(
      const Duration(seconds: 1), () {
        print("Выполняется Future");
        throw "Непредвиденная ошибка";
      }
  );
  future
      .then((value) => print("Из Future получено значение: $value"))
      .catchError((err) => print("Ошибка: $err"));
}

Future<void> throwableFunc() async {
  throw Exception("Hello");
}

Stream<int> timedCounter(Duration interval, [int? maxCount]) {
  var controller = StreamController<int>();
  int counter = 0;
  void tick(Timer timer) {
    counter++;
    controller.add(counter); // Ask stream to send counter values as event.
    if (maxCount != null && counter >= maxCount) {
      timer.cancel();
      controller.close(); // Ask stream to shut down and tell listeners.
    }
  }

  Timer.periodic(interval, tick); // BAD: Starts before it has subscribers.
  return controller.stream;
}

void listenAfterDelay() async {
  var counterStream = timedCounter(const Duration(seconds: 1), 15);
  // await Future.delayed(const Duration(seconds: 5));

  // After 5 seconds, add a listener.
  await for (final n in counterStream) {
    print(n); // Print an integer every second, 15 times.
  }
}

Stream<int> countDownFrom(int n) async* {
  if (n > 0) {
    yield n;
    yield* countDownFrom(n - 1);
  }
}