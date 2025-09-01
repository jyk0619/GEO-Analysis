import 'package:flutter/material.dart';
import 'package:geo/model/table_model.dart';


class ReportTable extends StatefulWidget {
  final List<TableItem> tableItems;
  const ReportTable({super.key, required this.tableItems});

  @override
  State<ReportTable> createState() => _ReportTableState();
}

class _ReportTableState extends State<ReportTable> {
  int? highlightedRow; // 선택된 행 index

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: const TextStyle(fontSize: 12),
      dataTextStyle: const TextStyle(fontSize: 14),
      dataRowMinHeight: 20,
      dataRowMaxHeight: 32,
      showCheckboxColumn: false,
      columns: const [
        DataColumn(label: Text('Item')),
        DataColumn(label: Text('True Count'), numeric: true),
        DataColumn(label: Text('Total'), numeric: true),
        DataColumn(label: Text('True Percentage (%)'), numeric: true),
      ],
      rows: List.generate(widget.tableItems.length, (rowIndex) {
        final item = widget.tableItems[rowIndex];
        final isHighlighted = highlightedRow == rowIndex;

        return DataRow(
          selected: isHighlighted, // DataTable에서 배경색 처리
          onSelectChanged: (selected) {
            setState(() {
              highlightedRow = rowIndex;
            });
            print('Row $rowIndex (${item.name}) clicked');
          },
          cells: [
            DataCell(Text(
              item.name,
              style: TextStyle(
                fontSize: isHighlighted ? 16 : 14,
                fontWeight: isHighlighted ? FontWeight.bold : null,
                color: isHighlighted ? Colors.blue[900] : null,
              ),
            )),
            DataCell(Text(
              item.trueCount,
              style: TextStyle(
                fontSize: isHighlighted ? 16 : 14,
                fontWeight: isHighlighted ? FontWeight.bold : null,
                color: isHighlighted ? Colors.blue[900] : null,
              ),
            )),
            DataCell(Text(
              item.total,
              style: TextStyle(
                fontSize: isHighlighted ? 16 : 14,
                fontWeight: isHighlighted ? FontWeight.bold : null,
                color: isHighlighted ? Colors.blue[900] : null,
              ),
            )),
            DataCell(Text(
              item.truePercentage,
              style: TextStyle(
                fontSize: isHighlighted ? 16 : 14,
                fontWeight: isHighlighted ? FontWeight.bold : null,
                color: isHighlighted ? Colors.blue[900] : null,
              ),
            )),
          ],
        );
      }),
    );
  }
}
