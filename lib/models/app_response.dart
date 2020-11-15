class AppResponse<T> {
  final T data;
  final String error;

  AppResponse(this.data, this.error);

  AppResponse.named({this.data, this.error});

  bool get isSuccess => data != null;
}