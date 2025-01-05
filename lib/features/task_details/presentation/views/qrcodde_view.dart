import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class TaskQrcodeSliver extends StatelessWidget {
  const TaskQrcodeSliver({
    super.key,
    required this.qrCode,
  });
  final String qrCode;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        bottom: 30.h,
        right: 22.w,
        left: 22.w,
      ),
      sliver: SliverToBoxAdapter(
        child: AspectRatio(
          aspectRatio: 1,
          child: SfBarcodeGenerator(
            value: qrCode,
            symbology: QRCode(),
            showValue: false,
          ),
        ),
      ),
    );
  }
}
