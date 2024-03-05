abstract class UploaderState {}

class UploaderInitial extends UploaderState {}

class UploaderProgress extends UploaderState {
  double progress;
  UploaderProgress({required this.progress});
}
