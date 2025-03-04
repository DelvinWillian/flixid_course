import 'package:flixid_course/data/repositories/movie_repository.dart';
import 'package:flixid_course/domain/entities/movie.dart';
import 'package:flixid_course/domain/entities/result.dart';
import 'package:flixid_course/domain/usecases/get_movie_list/get_movie_list_param.dart';
import 'package:flixid_course/domain/usecases/usecase.dart';

class GetMovieList implements UseCase<Result<List<Movie>>, GetMovieListParam> {
  final MovieRepository _movieRepository;

  GetMovieList({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<List<Movie>>> call(GetMovieListParam params) async {
    var movieResult = switch (params.category) {
      MovieListCategories.nowPlaying =>
        await _movieRepository.getNowPlaying(page: params.page),
      MovieListCategories.upcoming =>
        await _movieRepository.getUpcoming(page: params.page)
    };

    return switch (movieResult) {
      Success(value: final movie) => Result.success(movie),
      Failed(:final message) => Result.failed(message)
    };
  }
}
