import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/core/utils/firebase_ref.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

/// on App's user login
void onUserLogin() {
  /// 1.2.1. initialized ZegoUIKitPrebuiltCallInvitationService
  /// when app's user is logged in or re-logged in
  /// We recommend calling this method as soon as the user logs in to your app.
  currentUser ??
      ZegoUIKitPrebuiltCallInvitationService().init(
        appID: appId /*input your AppID*/,
        appSign: appSign /*input your AppSign*/,
        userID: currentUser!.uid,
        userName: currentUser!.displayName!,
        plugins: [ZegoUIKitSignalingPlugin()],
      );
}

/// on App's user logout
void onUserLogout() {
  /// 1.2.2. de-initialization ZegoUIKitPrebuiltCallInvitationService
  /// when app's user is logged out
  ZegoUIKitPrebuiltCallInvitationService().uninit();
}
