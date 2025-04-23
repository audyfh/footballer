import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Utils {
  static String formatToLocalTime(String utcDate) {
    final dateTimeUtc = DateTime.parse(utcDate);
    final localTime = dateTimeUtc.toLocal();
    return DateFormat.Hm().format(localTime);
  }

  static Widget loadImage(String? url, {double height = 35}) {
    if (url == null || url.isEmpty) {
      return const Icon(Icons.broken_image); // fallback jika kosong
    }

    if (url.toLowerCase().endsWith(".svg")) {
      return SvgPicture.network(
        url,
        height: height,
        placeholderBuilder: (context) => const CircularProgressIndicator(),
      );
    } else {
      return Image.network(
        url,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image),
      );
    }
  }
}
