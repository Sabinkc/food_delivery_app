import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SaladPage extends StatefulWidget {
  const SaladPage({super.key});

  @override
  State<SaladPage> createState() => _SaladPageState();
}

class _SaladPageState extends State<SaladPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("SaladPage"),
      ),
    );
  }
}
