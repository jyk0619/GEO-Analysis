import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';

class WordCloudWidget extends StatelessWidget {
  final List<WordItem> words;
  final double? width;
  final double? height;
  final bool fillGaps;
  final ScatterDelegate? delegate;  // nullable

  const WordCloudWidget({
    super.key,
    required this.words,
    this.width,
    this.height,
    this.fillGaps = true,
    this.delegate,
  });

  @override
  Widget build(BuildContext context) {
    final widgets = words.map((item) {
      return Text(
        item.word,
        style: TextStyle(
          fontSize: item.size,
          color: item.color,
          fontWeight: FontWeight.bold,
        ),
      );
    }).toList();

    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: Scatter(
          delegate: delegate ?? ArchimedeanSpiralScatterDelegate(ratio: 1),
          fillGaps: fillGaps,
          children: widgets,
        ),
      ),
    );
  }
}

class WordItem {
  final String word;
  final double size;
  final Color color;

  WordItem(this.word, {this.size = 16, this.color = Colors.black});
}
