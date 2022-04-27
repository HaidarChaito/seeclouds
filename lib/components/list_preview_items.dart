import 'package:flutter/material.dart';
import 'package:seeclouds/constants.dart';

class ListPreviewItems extends StatelessWidget {
  const ListPreviewItems({
    Key? key,
    required this.listPreviewImage1,
    required this.listPreviewTexts,
  }) : super(key: key);

  final String listPreviewImage1;
  final Map<String, String> listPreviewTexts;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryCardColor,
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            listPreviewImage1,
            width: 70,
          ),
          Text(
            listPreviewTexts['listPreviewTextDay']!,
            style: kListPreviewText,
          ),
          Text(
            listPreviewTexts['listPreviewTextTempHigh']!,
            style: kListPreviewTextpink,
          ),
          Text(
            listPreviewTexts['listPreviewTextTempLow']!,
            style: kListPreviewTextblue,
          ),
          Text(
            listPreviewTexts['listPreviewTextPrec']!,
            style: kListPreviewText,
          ),
        ],
      ),
    );
  }
}
