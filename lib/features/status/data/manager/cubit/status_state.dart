import 'package:chatbox/features/status/data/models/status_model.dart';

abstract class StatusState {}

class StatusInitial extends StatusState {}

class StatusLoading extends StatusState {}

class StatusSuccess extends StatusState {
  final List<List<StatusModel>> statusList;
  StatusSuccess({required this.statusList});
}
