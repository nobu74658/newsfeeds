import 'package:flutter/material.dart';
import 'package:newsfeeds/viewmodels/head_line_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../data/search_type.dart';

class HeadLinePage extends StatelessWidget {
  const HeadLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final viewModel = context.read<HeadLineViewModel>();

    if(!viewModel.isLoading && viewModel.articles.isEmpty){
      Future(()=> viewModel.getHeadLines(searchType: SearchType.HEAD_LINE));
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          child:Text("Head Line Page"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () => onRefresh(context),
        ),
      ),
    );
  }

  //TODO 更新処理
  onRefresh(BuildContext context) async{
    print("HeadLinePage.onRefresh");
    final viewModel = context.read();
    await viewModel.getHeadLines(searchType: SearchType.HEAD_LINE);
  }
}
