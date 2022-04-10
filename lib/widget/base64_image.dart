import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../util/image_utils.dart';
import 'load_image.dart';

/// 加载Base64资源，避免避免多次解码图像
class Base64Image extends StatefulWidget {
  /// 未处理的base64资源
  final String base64;

  /// 图像宽度
  final double? width;

  /// 图像高度
  final double? height;

  /// 缩放比例
  final double scale;

  final String holderImg;

  const Base64Image(
      {Key? key,
      this.base64 = '',
      this.width,
      this.height,
      this.scale = 1.0,
      this.holderImg = 'none'})
      : super(key: key);

  @override
  _Base64ImageState createState() => _Base64ImageState();
}

class _Base64ImageState extends State<Base64Image> {
  late Uint8List _source = Uint8List(0);

  @override
  void initState() {
    if (widget.base64.isNotEmpty) {
      _source = const Base64Decoder().convert(widget.base64.split(',')[1]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_source.isNotEmpty) {
      return Image.memory(
        _source,
        width: widget.width,
        scale: widget.scale,
      );
    } else {
      return LoadAssetImage(
        widget.holderImg,
        height: widget.height,
        width: widget.width,
        fit: BoxFit.cover,
        format: ImageFormat.png,
      );
    }
  }
}
