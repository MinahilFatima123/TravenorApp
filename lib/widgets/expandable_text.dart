import 'package:flutter/material.dart';

class ExpandableTextByWords extends StatefulWidget {
  final String text;
  final int wordLimit;

  const ExpandableTextByWords({
    super.key,
    required this.text,
    this.wordLimit = 25,
  });

  @override
  State<ExpandableTextByWords> createState() => _ExpandableTextByWordsState();
}

class _ExpandableTextByWordsState extends State<ExpandableTextByWords> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final words = widget.text.trim().split(RegExp(r'\s+'));
    final bool showReadMore = words.length > widget.wordLimit;

    final baseTextStyle = Theme.of(context).textTheme.displaySmall?.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: Colors.grey,
    );

    final readMoreStyle = baseTextStyle?.copyWith(color: Colors.orange);

    String visibleText = isExpanded
        ? widget.text
        : words.take(widget.wordLimit).join(' ');

    return RichText(
      text: TextSpan(
        style: baseTextStyle,
        children: [
          TextSpan(text: visibleText),
          if (showReadMore && !isExpanded) const TextSpan(text: '... '),
          if (showReadMore)
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: GestureDetector(
                onTap: () => setState(() => isExpanded = !isExpanded),
                child: Text(
                  isExpanded ? ' Read less' : 'Read more',
                  style: readMoreStyle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
