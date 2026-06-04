class GetImageState {
  final bool isLoading;
  final String image;
  GetImageState({required this.image, required this.isLoading});

  GetImageState copyWith({String? image, bool? isLoading}) {
    return GetImageState(
      isLoading: isLoading ?? this.isLoading,
      image: image ?? this.image,
    );
  }

  @override
  String toString() {
    return "ImageState: isLoading:$isLoading, image:$image";
  }
}
