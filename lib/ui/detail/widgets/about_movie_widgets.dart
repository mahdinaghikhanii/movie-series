import 'package:flutter/material.dart';

import '../../../common/dimensions.dart';
import '../../../data/entity/resultItem_movie.dart';

class AboutMovieWidgets extends StatelessWidget {
  final ResultItemMovieEntity itemEntity;
  const AboutMovieWidgets({super.key, required this.itemEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: Dimensions.padingdefultSize),
        child: Text(
          itemEntity.overview,
          style: Theme.of(context).textTheme.bodyMedium,
        ));
  }
}
