import 'package:flutter/material.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_appbar.dart';

class ProTraderDetailScreen extends StatelessWidget {
  const ProTraderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(titleText: 'Trading details'),
      body: ListView(padding: EdgeInsets.zero),
    );
  }
}
