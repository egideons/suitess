import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCropperController extends GetxController {
  static ImagePickerCropperController get instance {
    return Get.find<ImagePickerCropperController>();
  }

  static ImagePicker? imagePicker;
  static ImageCropper? imageCropper;

  Future<List<XFile>> pickImage({
    ImageSource source = ImageSource.gallery,
    int imageQuality = 100,
    bool multiple = false,
  }) async {
    if (multiple) {
      return await imagePicker!.pickMultiImage(imageQuality: imageQuality);
    }
    final file = await imagePicker!
        .pickImage(source: source, imageQuality: imageQuality);
    if (file != null) {
      return [file];
    } else {
      return [];
    }
  }

  Future<void> cropImage({
    required XFile file,
    CropStyle cropStyle = CropStyle.rectangle,
    ImageCompressFormat compressFormat = ImageCompressFormat.png,
  }) async =>
      await imageCropper!.cropImage(
        cropStyle: cropStyle,
        sourcePath: file.path,
        compressQuality: 100,
        iosUiSettings: const IOSUiSettings(),
        androidUiSettings: const AndroidUiSettings(),
        compressFormat: compressFormat,
      );
}
