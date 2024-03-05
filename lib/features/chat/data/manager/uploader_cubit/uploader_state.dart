abstract class UploaderState {}

class UploaderInitial extends UploaderState {}

class UploaderTrigger extends UploaderState {}

class UploaderProgress extends UploaderState {
  double progress;
  UploaderProgress({required this.progress});
}

class UploaderCompleted extends UploaderState {}
