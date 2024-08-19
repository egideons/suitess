import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../controllers/others/api_processor_controller.dart';

String contentType = "application/json";

final dio = Dio();

class ClientService {
  static Future<Response?> postRequest(String url, Object data) async {
    Response? response;
    try {
      response = await dio.postUri(
        Uri.parse(url),
        data: data,
        options: Options(
          contentType: contentType,
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
          persistentConnection: true,
          receiveDataWhenStatusError: true,
        ),
      );
    } on SocketException catch (_) {
      ApiProcessorController.errorSnack("Please connect to the internet");
      return null;
    } on DioException catch (e) {
      // Handle Dio exceptions

      // The request was made, but there was no internet connection on the device
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        log("Dio Timeout Error: ${e.requestOptions}");
        ApiProcessorController.errorSnack(
            "Request timed out. Please try again.");
      } else if (e.type == DioExceptionType.unknown &&
          e.message!.contains("Failed host lookup")) {
        log("Dio Request Options Error: ${e.requestOptions}");
        log("Dio Error Message: ${e.message}");
        ApiProcessorController.errorSnack("Please connect to the internet");
      } else {
        ApiProcessorController.errorSnack("An error occured");
        log("Dio Error: ${e.message}");
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
    return response; // Return the response in the try block
  }

  static Future<Response?> getRequest(String url) async {
    Response? response;
    try {
      response = await dio.getUri(
        Uri.parse(url),
        options: Options(
          contentType: contentType,
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
          persistentConnection: true,
          receiveDataWhenStatusError: true,
        ),
      );
    } on SocketException catch (_) {
      ApiProcessorController.errorSnack("Please connect to the internet");
      return null;
    } on DioException catch (e) {
      // Handle Dio exceptions

      // The request was made, but there was no internet connection on the device
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        log("Dio Timeout Error: ${e.requestOptions}");
        ApiProcessorController.errorSnack(
            "Request timed out. Please try again.");
      } else if (e.type == DioExceptionType.unknown &&
          e.message!.contains("Failed host lookup")) {
        log("Dio Request Options Error: ${e.requestOptions}");
        log("Dio Error Message: ${e.message}");
        ApiProcessorController.errorSnack("Please connect to the internet");
      } else {
        log("Dio Error: ${e.message}");
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
    return response; // Return the response in the try block
  }
}
