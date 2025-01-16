import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/data/months.dart';
import '../core/data/years.dart';
import '../core/styles/Colors.dart';

class DatePickerWidget extends StatefulWidget {
  final int selectedMonthIndex;
  final int selectedDay;
  final int selectedYear;
  final Function(int selectedMonthIndex, int selectedDay, int selectedYear)
      onChanged;
  const DatePickerWidget(
      {super.key,
      required this.selectedMonthIndex,
      required this.selectedDay,
      required this.selectedYear,
      required this.onChanged});

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  
  
  List<int> days = List.generate(31, (index) => index + 1);
  int selectedMonthIndex = 0;
  int selectedDay = 1;
  int selectedYear = 2025;
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedMonthIndex = widget.selectedMonthIndex;
      selectedDay = widget.selectedDay;
      selectedYear = widget.selectedYear;
    });
  }

  void _onValueChanged() {
    widget.onChanged(selectedMonthIndex, selectedDay, selectedYear);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      decoration: BoxDecoration(
        color: primaryColor.withValues(alpha: .04),
        borderRadius: BorderRadius.circular(60),
      ),
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
                width: 120,
                child: CupertinoPicker(
                  itemExtent: 40,
                  diameterRatio: 1.4,
                  squeeze: 1.4,
                  selectionOverlay: Container(),
                  scrollController: FixedExtentScrollController(
                      initialItem: selectedMonthIndex),
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      selectedMonthIndex = index;
                      _updateDaysInMonth();
                    });
                    _onValueChanged();
                  },
                  children: months.map((month) {
                    final isSelected = months[selectedMonthIndex] == month;
                    return Center(
                      child: Text(
                        month,
                        style: TextStyle(
                          fontSize: isSelected ? 23 : 20,
                          fontWeight: FontWeight.w400,
                          wordSpacing: 0,
                          letterSpacing: 0,
                          height: 1.3,
                          color: isSelected
                              ? primaryColor
                              : primaryColor.withValues(alpha: .5),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 60,
                child: CupertinoPicker(
                  itemExtent: 40,
                  diameterRatio: 1.5,
                  squeeze: 1.4,
                  selectionOverlay: Container(),
                  scrollController:
                      FixedExtentScrollController(initialItem: selectedDay - 1),
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      selectedDay = index + 1;
                    });
                    _onValueChanged();
                  },
                  children: days.map((day) {
                    final isSelected = selectedDay == day;
                    return Center(
                      child: Text(
                        day.toString(),
                        style: TextStyle(
                          fontSize: isSelected ? 23 : 20,
                          fontWeight: FontWeight.w400,
                          wordSpacing: 0,
                          letterSpacing: 0,
                          height: 1.3,
                          color: isSelected
                              ? primaryColor
                              : primaryColor.withValues(alpha: .5),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 80,
                child: CupertinoPicker(
                  itemExtent: 40,
                  diameterRatio: 1.5,
                  squeeze: 1.4,
                  selectionOverlay: Container(),
                  scrollController: FixedExtentScrollController(
                      initialItem: years.indexOf(selectedYear)),
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      selectedYear = years[index];
                      _updateDaysInMonth();
                    });
                    _onValueChanged();
                  },
                  children: years.map((year) {
                    final isSelected = selectedYear == year;
                    return Center(
                      child: Text(
                        year.toString(),
                        style: TextStyle(
                          fontSize: isSelected ? 23 : 20,
                          fontWeight: FontWeight.w400,
                          wordSpacing: 0,
                          letterSpacing: 0,
                          height: 1.3,
                          color: isSelected
                              ? primaryColor
                              : primaryColor.withValues(alpha: .5),
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
    );
  }

  void _updateDaysInMonth() {
    final month = selectedMonthIndex + 1;
    final isLeapYear = (selectedYear % 4 == 0 && selectedYear % 100 != 0) ||
        (selectedYear % 400 == 0);
    int daysInMonth;

    if ([4, 6, 9, 11].contains(month)) {
      daysInMonth = 30;
    } else if (month == 2) {
      daysInMonth = isLeapYear ? 29 : 28;
    } else {
      daysInMonth = 31;
    }

    setState(() {
      days = List.generate(daysInMonth, (index) => index + 1);
      if (selectedDay > daysInMonth) {
        selectedDay = daysInMonth;
      }
    });
  }
}
