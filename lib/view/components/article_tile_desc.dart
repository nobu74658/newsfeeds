import 'package:flutter/material.dart';
import 'package:newsfeeds/style/style.dart';

import '../../models/model/news_model.dart';

class ArticleTileDesc extends StatelessWidget {
  final Article article;

  const ArticleTileDesc({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(article.title ?? "", style: textTheme.subtitle1?.copyWith(
          fontWeight: FontWeight.bold,
        ),),
        const SizedBox(height: 2.0,),
        Text(article.publishDate ?? "", style: textTheme.overline?.copyWith(
          fontStyle: FontStyle.italic,
        ),),
        const SizedBox(height: 2.0,),
        Text(article.description ?? "", style: textTheme.bodyText2?.copyWith(
          fontFamily: RegularFont,
        ),),
      ],
    );
  }
}
