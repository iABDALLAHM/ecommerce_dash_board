abstract class GetImageState {}

final class GetImageInitialState extends GetImageState {}

final class GetImageSuccessState extends GetImageState {
  final String imagePath;

  GetImageSuccessState({required this.imagePath});
}

final class GetImageLoadingState extends GetImageState {}

final class GetImageFailureState extends GetImageState {}
