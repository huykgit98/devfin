import 'package:flutter/material.dart';

class AutomaticKeepAlive extends StatefulWidget {
  const AutomaticKeepAlive({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  State<AutomaticKeepAlive> createState() => AutomaticKeepAliveState();
}

class AutomaticKeepAliveState extends State<AutomaticKeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
