

class DonutChartItem {
  final String title;  // '목록형', '통계값', '인용'
  final double value;     // 퍼센트 값 (0~100)
  final int current;   // 현재 값 예: 720
  final int total;     // 총 값 예: 1200

  DonutChartItem({
    required this.title,
    required this.value,
    required this.current,
    required this.total,
  });
}
