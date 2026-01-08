abstract class AddProductStates {}

final class InitialAddProductState extends AddProductStates {}

final class SuccessAddProductState extends AddProductStates {}

final class LoadingAddProductState extends AddProductStates {}

final class FailureAddProductState extends AddProductStates {
  final String errorMessage;
  FailureAddProductState({required this.errorMessage});
}
