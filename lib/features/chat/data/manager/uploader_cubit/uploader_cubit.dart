import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/core/colored/print_colored_text_in_flutter.dart';
import 'package:scholarchat_app/core/colored/print_manager.dart';
import 'package:scholarchat_app/core/helper/chat_room.dart';
import 'package:scholarchat_app/core/utils/firebase_ref.dart';
import 'package:scholarchat_app/features/chat/data/manager/uploader_cubit/uploader_state.dart';
// ignore_for_file: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class UploaderCubit extends Cubit<UploaderState> {
  UploaderCubit() : super(UploaderInitial());

  final String? currentUEmail = currentUser!.email;

  //Send an Image
  Future<void> sendImage(String otherUserId, String docName) async {
    String chatRoomId = ChatRoom.getChatRoomId(otherUserId);
    try {
      emit(UploaderTrigger());
      await messagesRf(chatRoomId).doc(docName).set({
        'message': '',
        'type': 'photo',
        'sentAt': DateTime.now().toString(),
        'id': currentUEmail!,
      });
      await chatRoomsRF.doc(chatRoomId).update({
        'lastMessage': 'photo',
        'lastTime': DateTime.now().toString(),
      });
    } catch (e) {
      printColoredText('$e', ConsoleColor.red);
    }
  }

  String getFileName(File imageFile) {
    Random random = Random();
    String randomNumber = '${random.nextInt(1000)}';
    String fileName = '$randomNumber${path.basename(imageFile.path)}';
    return fileName;
  }

  Future<String> uploadImageToFirebase(
      File imageFile, String otherUserId) async {
    String chatRoomId = ChatRoom.getChatRoomId(otherUserId);
    try {
      String fileName = getFileName(imageFile);
      Reference storageReference = storageRef.child('chat_images/$fileName');
      await sendImage(otherUserId, fileName);
      UploadTask uploadTask = storageReference.putFile(imageFile)
        ..snapshotEvents.listen((event) {
          double progress =
              event.bytesTransferred.toDouble() / event.totalBytes.toDouble();
          if (event.state == TaskState.success) {
            progress = 0;
            emit(UploaderCompleted());
          }
          if (event.state == TaskState.error) {
            printColoredText(
              '******** error uploading image',
              ConsoleColor.brightRed,
            );
          }
          emit(UploaderProgress(progress: progress));
        });
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String imageUrl = await taskSnapshot.ref.getDownloadURL().then((message) {
        chatRoomsRF
            .doc(chatRoomId)
            .collection('messages')
            .doc(fileName)
            .update({
          'message': message,
        });
        return message;
      });
      return imageUrl;
    } catch (error) {
      // Handle the error here, e.g. log it or display an error message
      printColoredText(
          'Error uploading image: $error', ConsoleColor.brightCyan);
      return 'Error uploading image: $error';
    }
  }
}
