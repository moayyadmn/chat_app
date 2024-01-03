import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
//app routes
const String kLoginRoute = '/loginScreen';
const String kSignUpRoute = 'signUpScreen';
const String kChatRoute = '/chatScreen';
const String kUserChatRoute = '/userChatScreen';
const String kChatListRoute = '/chatListScreen';
//firebase
User? currentUser = FirebaseAuth.instance.currentUser;
//firebase storage 
final storageRef = FirebaseStorage.instance.ref();
//app icons
const String kStickerIcon = 'assets/svg/sticker.svg';
const String kSendIcon = 'assets/svg/send_icon.svg';
const String kCameraIcon = 'assets/svg/camera.svg';
const String kMicrophoneIcon = 'assets/svg/microphone.svg';
const String kClipChatIcon = 'assets/svg/clip_chat.svg';
