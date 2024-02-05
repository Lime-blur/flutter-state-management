import 'package:flutter/cupertino.dart';

class Widget2 extends InheritedWidget {

  const Widget2({
    super.key,
    required Widget child,
  }) : super(child: child);

  static Widget2? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Widget2>();
  }

  static Widget2 of(BuildContext context) {
    final Widget2? result = context.dependOnInheritedWidgetOfExactType<Widget2>();
    assert(result != null, 'No Widget2 found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Widget2 old) {
    return true;
  }
}

class DummyWidget1 extends StatelessWidget {
  final String text;

  const DummyWidget1({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

class DummyWidget extends StatefulWidget {
  final String text;

  const DummyWidget({
    required this.text,
    super.key,
  });

  @override
  State<DummyWidget> createState() => _DummyWidgetState();
}

class _DummyWidgetState extends State<DummyWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text);
  }
}