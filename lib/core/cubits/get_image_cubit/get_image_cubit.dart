import 'package:ecommerce_dash_board/core/cubits/get_image_cubit/get_image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class GetImageCubit extends Cubit<GetImageState> {
  GetImageCubit() : super(GetImageInitialState());
  final ImagePicker picker = ImagePicker();
  XFile? image;
  Future<void> pickImage() async {
    emit(GetImageLoadingState());
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(GetImageSuccessState(imagePath: image!.path));
    } else {
      emit(GetImageFailureState());
    }
  }

  void removeImage() {
    image = null;
    emit(GetImageInitialState());
  }
}
