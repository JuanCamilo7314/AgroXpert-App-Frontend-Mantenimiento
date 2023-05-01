import 'package:agroxpert/models/final_production_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../utils/calculate_percent.dart';

class PieGraphFinalReport extends StatefulWidget {
  final FinalProductionModel finalProduction;
  const PieGraphFinalReport({super.key, required this.finalProduction});

  @override
  State<StatefulWidget> createState() => PieGraphFinalReportState();
}

class PieGraphFinalReportState extends State<PieGraphFinalReport> {
  int touchedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 0,
                  sections: showingSections(widget.finalProduction),
                ),
              ),
            ),
          ),
          _indicators(),
        ],
    );
  }

  List<PieChartSectionData> showingSections(FinalProductionModel finalProduction) {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 3)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color.fromRGBO(126, 217, 87, 1),
            value: finalProduction.exportMarket,
            title: '${percent(finalProduction.exportMarket, finalProduction.totalProduction)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color.fromRGBO(255, 186, 33, 1),
            value: finalProduction.nationalMarket,
            title: '${percent(finalProduction.nationalMarket, finalProduction.totalProduction)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color.fromRGBO(101, 178, 162, 1),
            value: finalProduction.waste,
            title: '${percent(finalProduction.waste, finalProduction.totalProduction)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
          );
        default:
          throw Exception('Oh no');
      }
    });
  }

  Widget _indicators() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              color: const Color.fromRGBO(126, 217, 87, 1),
            ),
            const SizedBox(width: 10),
            const Text('Exportación'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              color: const Color.fromRGBO(255, 186, 33, 1),
            ),
            const SizedBox(width: 10),
            const Text('Nacional'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              color: const Color.fromRGBO(101, 178, 162, 1),
            ),
            const SizedBox(width: 10),
            const Text('Desecho'),
          ],
        ),
      ],
    );
  }
}
