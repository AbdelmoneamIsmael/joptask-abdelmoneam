import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

mixin ImageMixin {
  final ImagePicker _imagePicker = ImagePicker();
  bool isNoPhoto = true;

  Future<File> _pickImage(ImageSource source, {int quality = 80}) async {
    final result = await _imagePicker.pickImage(
      source: source,
      imageQuality: quality,
      maxHeight: 500,
      maxWidth: 500,
    );

    if (result != null) {
      isNoPhoto = false;
      return await _compressFile(File(result.path));
    } else {
      return File("assets/images/logo.png");
    }
  }

  Future<File> getGalleryImage() async {
    return await _pickImage(ImageSource.gallery);
  }

  Future<File> getCameraImage() async {
    final result = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      maxHeight: 1620,
      maxWidth: 1080,
    );

    if (result != null) {
      isNoPhoto = false;
      return await _compressFile(File(result.path), targetPath: result.path);
    } else {
      return File("assets/images/logo.png");
    }
  }

  Future<Uint8List> compressToUint(File file) async {
    final result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 2300,
      minHeight: 1500,
      quality: 94,
      rotate: 90,
    );

    if (result != null) {

      return result;
    } else {
      throw Exception('Image compression failed');
    }
  }

  Future<File> _compressFile(File file, {String? targetPath}) async {
    // Set a default targetPath if not provided
    final String finalTargetPath = targetPath ??
        '${file.parent.path}/compressed_${file.uri.pathSegments.last}';

    // Ensure the target path is different from the source path
    if (file.path == finalTargetPath) {
      throw Exception('Target path and source path cannot be the same.');
    }

    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      finalTargetPath,
      quality: 88,
    );

    if (result != null) {
      return File(result.path);
    } else {
      throw Exception('File compression failed');
    }
  }

  Future<Uint8List?> compressAsset(String assetName) async {
    return await FlutterImageCompress.compressAssetImage(
      assetName,
      minHeight: 1920,
      minWidth: 1080,
      quality: 96,
      rotate: 180,
    );
  }

  Future<Uint8List> compressList(Uint8List list) async {
    final result = await FlutterImageCompress.compressWithList(
      list,
      minHeight: 1920,
      minWidth: 1080,
      quality: 96,
      rotate: 135,
    );

    return result;
  }
}
