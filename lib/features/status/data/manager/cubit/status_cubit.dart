import 'package:chatbox/core/utils/firebase_ref.dart';
import 'package:chatbox/features/status/data/manager/cubit/status_state.dart';
import 'package:chatbox/features/status/data/models/status_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusCubit extends Cubit<StatusState> {
  StatusCubit() : super(StatusInitial());
  static StatusCubit get(context) => BlocProvider.of(context);
  List<List<StatusModel>> status = [];
  Future<List<StatusModel>> fetchStatus(String otherId) async {
    emit(StatusLoading());
    final friend = await userRf.doc(otherId).collection('status').get();
    List<StatusModel> data = [];
    for (var e in friend.docs) {
      data.add(StatusModel.fromDocument(e));
    }
    status.add(data);
    emit(StatusSuccess(statusList: status));
    return data;
    // final result = await firestore.collectionGroup('status').where('').get();
  }
}
