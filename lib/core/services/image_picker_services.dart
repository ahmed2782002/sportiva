// Dart imports:
import 'dart:io';

// Package imports:
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

class ImagePickerHelper {
  Future<File> compressImage(File file) async {
    try {
      Uuid uuid = const Uuid();
      String randomStrng = uuid.v4();

      Directory directory = await getTemporaryDirectory();

      String targetPath = "${directory.path}/$randomStrng.jpg";
      XFile? result = await FlutterImageCompress.compressAndGetFile(
        file.path,
        targetPath,
        quality: 30,
      );
      return File(result!.path);
    } catch (e) {
      return file;
    }
  }

  Future<bool> galleryStatus() async {
    if (Platform.isIOS) {
      return true;
    } else {
      DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      final androidInfo = await deviceInfoPlugin.androidInfo;
      if (Platform.isAndroid && androidInfo.version.sdkInt >= 33) {
        return true;
      } else {
        var status = await Permission.storage.status;
        if (status == PermissionStatus.granted ||
            status == PermissionStatus.limited) {
          return true;
        } else {
          status = await Permission.storage.request();
          if (status == PermissionStatus.granted ||
              status == PermissionStatus.limited) {
            return true;
          } else {
            return false;
          }
        }
      }
    }
  }

  Future<bool> cameraStatus() async {
    if (Platform.isIOS) {
      return true;
    }
    var status = await Permission.camera.status;
    if (status == PermissionStatus.granted ||
        status == PermissionStatus.limited) {
      return true;
    } else {
      status = await Permission.camera.request();
      if (status == PermissionStatus.granted ||
          status == PermissionStatus.limited) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<File?> checkAndPickImage({required ImageSource imageSource}) async {
    if (imageSource == ImageSource.gallery) {
      var status = await galleryStatus();
      if (status == true) {
        return pickImage(imageSource: imageSource);
      } else {
        return null;
      }
    } else {
      var status = await cameraStatus();
      if (status == true) {
        return pickImage(imageSource: imageSource);
      } else {
        return null;
      }
    }
  }

  Future<File?> checkAndPickVideo({required ImageSource imageSource}) async {
    if (imageSource == ImageSource.gallery) {
      var status = await galleryStatus();
      if (status == true) {
        return pickVideo(imageSource: imageSource);
      } else {
        return null;
      }
    } else {
      var status = await cameraStatus();
      if (status == true) {
        return pickVideo(imageSource: imageSource);
      } else {
        return null;
      }
    }
  }

  Future<List<File>?> checkAndPickImageMultipleImages() async {
    var status = await galleryStatus();
    if (status == true) {
      return pickMultipleImages();
    } else {
      return null;
    }
  }

  Future<List<File>?> checkAndPickImageMultipleVideo() async {
    var status = await galleryStatus();
    if (status == true) {
      return pickMultipleVideo();
    } else {
      return null;
    }
  }

  Future<List<File>?> pickMultipleImages() async {
    final List<File> filesImages = [];
    try {
      final images = await ImagePicker().pickMultiImage(limit: 10);
      if (images.isNotEmpty) {
        for (var image in images) {
          // final compressedImage = await compressImage(File(image.path));
          filesImages.add(File(image.path));
        }
        return filesImages;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }

    // log("HERE");

    // final selectedImages = await ImagePicker().pickMultiImage();
    // for (var imageAsset in selectedImages) {
    //   final ByteData byteData = await imageAsset.getByteData();
    //   final List<int> imageData = byteData.buffer.asUint8List();
    //   final File file =
    //       File("${(await getTemporaryDirectory()).path}/${imageAsset.name}");
    //   await file.writeAsBytes(imageData);
    //   filesImages.add(file);
    //   print(file);
    // }

    // final List<XFile> imagesXFiles = await ImagePicker().pickMultiImage(
    //   limit: 1000,
    //   imageQuality: 70,
    // );
    // for (var xfile in imagesXFiles) {
    //   filesImages.add(File(xfile.path));
    // }

    // return filesImages;
  }

  Future<List<File>?> pickMultipleVideo() async {
    final List<File> filesImages = [];
    try {
      final images = await ImagePicker().pickMultiVideo(limit: 10);
      if (images.isNotEmpty) {
        for (var image in images) {
          // final compressedImage = await compressImage(File(image.path));
          filesImages.add(File(image.path));
        }
        return filesImages;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<File?> pickImage({required ImageSource imageSource}) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        final imageTemporary = File(image.path);
        // final compressedImage = compressImage(imageTemporary);
        return imageTemporary;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<File?> pickVideo({required ImageSource imageSource}) async {
    try {
      final image = await ImagePicker().pickVideo(source: imageSource);
      if (image != null) {
        final imageTemporary = File(image.path);
        //final compressedImage = compressImage(imageTemporary);
        return imageTemporary;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<File?> pickPDF() async {
    try {
      final file = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (file != null) {
        File compressedImage = File(file.files.single.path!);
        return compressedImage;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
