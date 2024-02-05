// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constant/common_state.dart';
import 'package:newsapp/feature/categorynews/bloc/category_news_cubit.dart';
import 'package:newsapp/feature/categorynews/ui/widgets/category_news_tiles.dart';
import 'package:newsapp/feature/shimmer/ui/pages/view_all.dart';

import 'package:newsapp/model/news.dart';

class CategoryNewsPage extends StatelessWidget {
  const CategoryNewsPage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.chevron_left),
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CategoryNewsCubit, CommonState>(
        builder: (context, state) {
          if (state is CommonSuccessState<List<News>>) {
            return ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                return CategoryNewsTile(
                  news: state.news[index],
                );
              },
            );
          } else {
            return ViewAllLoading(title: title);
          }
        },
      ),
    );
  }
}
