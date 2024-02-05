import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constant/common_state.dart';
import 'package:newsapp/resources/news_repository.dart';

import 'package:newsapp/model/news.dart';

class BreakingNewsCubit extends Cubit<CommonState> {
  final NewsRepository newsRepository;
  BreakingNewsCubit({required this.newsRepository})
      : super(CommonInitialState());

  fetchBreakingNews() async {
    emit(CommonInitialState());
    final result = await newsRepository.fetchBreakingNews();
    result.fold(
      (error) => emit(
        CommonErrorState(errorMsg: error),
      ),
      (data) => emit(
        CommonSuccessState<List<News>>(news: data),
      ),
    );
  }
}
