import 'package:astro_guide_astro/models/review/ReviewResponseModel.dart';
import 'package:astro_guide_astro/models/review/ReviewListModel.dart';
import 'package:astro_guide_astro/repositories/ReviewRepository.dart';

class ReviewProvider {
  final ReviewRepository reviewRepository;

  ReviewProvider(this.reviewRepository);

  Future<ReviewListModel> fetch(String token, String endpoint) async {
    var reviewListResponse = await reviewRepository.fetch(token, endpoint);

    return ReviewListModel.fromJson(reviewListResponse);
  }

  Future<ReviewResponseModel> fetchByID(String token, String endpoint) async {
    var reviewResponse = await reviewRepository.fetch(token, endpoint);

    return ReviewResponseModel.fromJson(reviewResponse);
  }
}
