
import '../../repositories/tv_show_repository.dart';

class GetTvWatchListStatus {
  final TvShowRepository repository;

  GetTvWatchListStatus(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlistTvShow(id);
  }
}
