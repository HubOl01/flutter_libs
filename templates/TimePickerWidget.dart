import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internal/core/styles/Colors.dart';

class TimePickerWidget extends StatefulWidget {
  final int selectedHour;
  final int selectedMinute;
  final String selectedPeriod;
  final Function(int hour, int minute, String period) onChanged;
  const TimePickerWidget({
    super.key,
    required this.selectedHour,
    required this.selectedMinute,
    required this.selectedPeriod,
    required this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  final List<String> periods = ['AM', 'PM'];

  int selectedHour = 12;
  int selectedMinute = 0;
  String selectedPeriod = 'AM';
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedHour = widget.selectedHour;
      selectedMinute = widget.selectedMinute;
      selectedPeriod = widget.selectedPeriod;
    });
  }

  void _onValueChanged() {
    widget.onChanged(selectedHour, selectedMinute, selectedPeriod);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      decoration: BoxDecoration(
        color: primaryColor.withValues(alpha: .04),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 98,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: primaryColor.withValues(alpha: .08),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                      child: CupertinoPicker(
                        itemExtent: 42,
                        diameterRatio: 1.4,
                        squeeze: 1.4,
                        selectionOverlay: Container(),
                        scrollController: FixedExtentScrollController(
                            initialItem: selectedHour - 1),
                        onSelectedItemChanged: (int index) {
                          setState(() {
                            selectedHour = index + 1;
                          });
                          _onValueChanged();
                        },
                        children: List<Widget>.generate(12, (int index) {
                          return Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: selectedHour == index + 1 ? 23 : 20,
                                fontWeight: FontWeight.w400,
                                wordSpacing: 0,
                                letterSpacing: 0,
                                height: 1.3,
                                color: selectedHour == index + 1
                                    ? primaryColor
                                    : primaryColor.withValues(alpha: .7),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(width: 24),
                    SizedBox(
                      width: 30,
                      child: CupertinoPicker(
                        itemExtent: 42,
                        diameterRatio: 1.4,
                        squeeze: 1.4,
                        selectionOverlay: Container(),
                        looping: true,
                        scrollController: FixedExtentScrollController(
                            initialItem: selectedMinute),
                        onSelectedItemChanged: (int index) {
                          setState(() {
                            selectedMinute = index;
                          });
                          _onValueChanged();
                        },
                        children: List<Widget>.generate(60, (int index) {
                          return Center(
                            child: Text(
                              '$index'.padLeft(2, '0'),
                              style: TextStyle(
                                fontSize: selectedMinute == index ? 23 : 20,
                                fontWeight: FontWeight.w400,
                                wordSpacing: 0,
                                letterSpacing: 0,
                                height: 1.3,
                                color: selectedMinute == index
                                    ? primaryColor
                                    : primaryColor.withValues(alpha: .7),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(width: 24),
                    SizedBox(
                      width: 40,
                      child: CupertinoPicker(
                        itemExtent: 42,
                        diameterRatio: 1.4,
                        squeeze: 1.4,
                        selectionOverlay: Container(),
                        scrollController: FixedExtentScrollController(
                            initialItem: periods.indexOf(selectedPeriod)),
                        onSelectedItemChanged: (int index) {
                          setState(() {
                            selectedPeriod = periods[index];
                          });
                          _onValueChanged();
                        },
                        children: periods.map((String period) {
                          return Center(
                            child: Text(
                              period,
                              style: TextStyle(
                                fontSize: selectedPeriod == period ? 23 : 20,
                                fontWeight: FontWeight.w400,
                                wordSpacing: 0,
                                letterSpacing: 0,
                                height: 1.3,
                                color: selectedPeriod == period
                                    ? primaryColor
                                    : primaryColor.withValues(alpha: .7),
                              ),
                            ),
                          );
                        }).toList(),
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
