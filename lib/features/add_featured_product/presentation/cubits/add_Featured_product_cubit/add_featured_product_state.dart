abstract class AddFeaturedProductState {}

final class InitialAddFeaturedProductState extends AddFeaturedProductState {}

final class SuccessAddFeaturedProductState extends AddFeaturedProductState {}

final class LoadingAddFeaturedProductState extends AddFeaturedProductState {}

final class FailureAddFeaturedProductState extends AddFeaturedProductState {
  final String errorMessage;

  FailureAddFeaturedProductState({required this.errorMessage});
}
