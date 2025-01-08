import 'package:flutter/material.dart';

class DottedProgressCropped extends StatelessWidget {
  final int currentPage;
  final int totalDots;
  final double dotSize;
  final double spacing;
  final int visibleDots;

  const DottedProgressCropped({
    super.key,
    required this.currentPage,
    required this.totalDots,
    this.dotSize = 12.0,
    this.spacing = 8.0,
    this.visibleDots = 15,
  });

  @override
  Widget build(BuildContext context) {
    int start =
        (currentPage - visibleDots ~/ 2).clamp(0, totalDots - visibleDots);
    int end = (start + visibleDots).clamp(0, totalDots);

    if (currentPage >= 5 && currentPage < totalDots - 5) {
      start = (currentPage - 5).clamp(0, totalDots - 10);
      end = (start + 10).clamp(0, totalDots);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(end - start, (index) {
        int actualIndex = start + index;
        double adjustedDotSize = dotSize;

        if (currentPage < 5) {
          if (index == end - start - 2) {
            adjustedDotSize = dotSize * 0.85;
          } else if (index == end - start - 1) {
            adjustedDotSize = dotSize * 0.5;
          }
        } else if (currentPage >= totalDots - 5) {
          if (index == 0) {
            adjustedDotSize = dotSize * 0.5;
          } else if (index == 1) {
            adjustedDotSize = dotSize * 0.85;
          }
        } else {
          if (index == 0) {
            adjustedDotSize = dotSize * 0.5;
          } else if (index == 1) {
            adjustedDotSize = dotSize * 0.85;
          } else if (index == end - start - 2) {
            adjustedDotSize = dotSize * 0.6;
          } else if (index == end - start - 1) {
            adjustedDotSize = dotSize * 0.5;
          }
        }

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          width: adjustedDotSize,
          height: adjustedDotSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: actualIndex == currentPage
                ? Colors.white
                : Colors.white.withValues(alpha: 0.3),
          ),
        );
      }),
    );
  }
}
