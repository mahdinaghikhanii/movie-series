import 'package:flutter/material.dart';
import 'package:movie_series/ui/widgets/custom_appbar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        iconBack: true,
        title: "Detail",
      ),
    );
  }
}
