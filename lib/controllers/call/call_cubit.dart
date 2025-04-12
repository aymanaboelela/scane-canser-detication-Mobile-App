import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';
part 'call_state.dart';


class CallCubit extends Cubit<CallState> {
  CallCubit() : super(CallInitial());
  final CallUseCase callUseCase = CallUseCase();

  void makePhoneCall({required String phoneNumber}) async {
    await callUseCase.makePhoneCall(phoneNumber: phoneNumber);
  }

  void whatsApp({required String phoneNumber, required String massege}) async {
    await callUseCase.whatsApp(phoneNumber: phoneNumber, massege: massege);
  }
  void openGooglemap( {required String url}) async {
    await callUseCase.openMapWithUrl(  url: url);
  }
}


class CallUseCase {
  Future<void> makePhoneCall({required phoneNumber}) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> whatsApp(
      {required String phoneNumber, required String massege}) async {
    String urls = "https://wa.me/+2$phoneNumber/?text=$massege";
    final Uri url = Uri.parse(urls);
    await launchUrl(url);
  }

  Future<void> openMapWithUrl({required String url}) async {
    try {
      print(url);
      final Uri uri = Uri.parse(url);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      // Handle the error if the URL cannot be launched
      print("Could not launch $url");
    }
  }
}
