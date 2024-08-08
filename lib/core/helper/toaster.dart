import 'package:bot_toast/bot_toast.dart';

class Toaster {
  Toaster._();
  static void showLoading() {
    BotToast.showLoading();
  }

  static void closeLoading() {
    BotToast.closeAllLoading();
  }

  static void showToast(String text) {
    BotToast.showText(text: text);
  }
}
