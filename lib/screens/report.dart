import 'package:expenditure_basic/models/expenditurePerGroup.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Report extends StatefulWidget {
  List<ExpenditurePerGroup> chartData;
  Report({Key? key, required this.chartData}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  late List<ExpenditurePerGroup> chartData;
  @override
  void initState() {
    super.initState();
    chartData = widget.chartData;
  }

  @override
  void dispose() {
    super.dispose();
    ExpenditurePerGroup.totalExpense = 0;
  }

  @override
  Widget build(BuildContext context) {
    print(ExpenditurePerGroup.totalExpense);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SfCircularChart(
            series: <CircularSeries<ExpenditurePerGroup, String>>[
              PieSeries<ExpenditurePerGroup, String>(
                dataSource: chartData,
                xValueMapper: (ExpenditurePerGroup data, _) => data.group,
                yValueMapper: (ExpenditurePerGroup data, _) => data.expenditure,
                dataLabelMapper: (ExpenditurePerGroup data, _) =>
                    "${data.group}(${((data.expenditure * 100) / ExpenditurePerGroup.totalExpense).toStringAsFixed(1)}%)",
                pointColorMapper: (ExpenditurePerGroup data, _) => data.color,
                radius: '60%',
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  textStyle: TextStyle(fontSize: 14),
                  // Avoid labels intersection
                  labelIntersectAction: LabelIntersectAction.shift,
                  labelPosition: ChartDataLabelPosition.outside,
                  connectorLineSettings: ConnectorLineSettings(
                    type: ConnectorType.line,
                    length: '25%',
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 30, right: 30, bottom: 10),
            child: Row(
              children: const [
                Text(
                  "Report",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Table(
              columnWidths: const {
                0: FixedColumnWidth(30),
                1: FixedColumnWidth(110),
                3: FixedColumnWidth(50),
              },
              border: TableBorder.all(color: Colors.black),
              children: [
                const TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: SizedBox(
                        height: 30,
                        child: Center(
                          child: Text(
                            "",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: SizedBox(
                        height: 30,
                        child: Center(
                          child: Text(
                            "Type",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: SizedBox(
                        height: 30,
                        child: Center(
                          child: Text(
                            "Expenditure",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: SizedBox(
                        height: 30,
                        child: Center(
                          child: Text(
                            "%",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ...chartData.map(
                  (e) => TableRow(
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: SizedBox(
                          height: 30,
                          child: Center(
                            child: Container(
                              width: 20,
                              height: 20,
                              color: e.color,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: SizedBox(
                          height: 20,
                          child: Center(
                            child: Text(
                              "${e.group}",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: SizedBox(
                          height: 20,
                          child: Center(
                            child: Text(
                              "₹${e.expenditure}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: SizedBox(
                          height: 30,
                          child: Center(
                            child: Text(
                              "${((e.expenditure * 100) / ExpenditurePerGroup.totalExpense).toStringAsFixed(1)}%",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TableRow(
                  children: [
                    const TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: SizedBox(
                        height: 20,
                        child: Center(
                          child: Text(
                            "",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    const TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: SizedBox(
                        height: 20,
                        child: Center(
                          child: Text(
                            "Total",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: SizedBox(
                        height: 20,
                        child: Center(
                          child: Text(
                            "₹" + ExpenditurePerGroup.totalExpense.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    const TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: SizedBox(
                        height: 20,
                        child: Center(
                          child: Text(
                            "",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
