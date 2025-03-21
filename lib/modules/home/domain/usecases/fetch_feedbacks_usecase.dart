import 'package:either_dart/either.dart';

import '../../data/models/feedback_model.dart';
import '../repositories/home_repository.dart';

abstract class FetchFeedbacksUsecase {
  Future<Either<Exception, List<FeedbackModel>>> call();
}

class FetchFeedbacksUsecaseImp implements FetchFeedbacksUsecase {
  HomeRepository repository;

  FetchFeedbacksUsecaseImp({required this.repository});

  @override
  Future<Either<Exception, List<FeedbackModel>>> call() async {
    return repository.fetchFeedbacks();
  }
}
