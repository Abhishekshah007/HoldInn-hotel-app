import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:calendar_builder/calendar_builder.dart';
import 'package:hotel_booking_app/Screens/selectRoomsScreen.dart';

import 'CustomTextWidget.dart';

class CalenderSheet extends StatefulWidget {
  const CalenderSheet({super.key});

  @override
  State<CalenderSheet> createState() => _CalenderSheetState();
}

class _CalenderSheetState extends State<CalenderSheet> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CbMonthBuilder(
          cbConfig: CbConfig(
              startDate: DateTime(2020),
              endDate: DateTime(2123),
              selectedDate: DateTime(2023, 04, 10),
              selectedYear: DateTime(2023),
              weekStartsFrom: WeekStartsFrom.wednesday,
              disabledDates: [
                DateTime(2022, 1, 7),
                DateTime(2022, 1, 9),
              ],
              eventDates: [
                DateTime(2022, 1, 2),
                DateTime(2022, 1, 2),
                DateTime(2022, 1, 3)
              ],
              highlightedDates: [
                DateTime(2022, 1, 6),
                DateTime(2022, 1, 3)
              ]),
          monthCustomizer: MonthCustomizer(
              padding: const EdgeInsets.all(20),
              monthHeaderCustomizer: MonthHeaderCustomizer(
                textStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              monthButtonCustomizer: MonthButtonCustomizer(
                  currentDayColor: Colors.orange,
                  borderStrokeWidth: 2,
                  textStyleOnDisabled: const TextStyle(color: Colors.red),
                  highlightedColor: const Color.fromARGB(255, 255, 174, 0)),
              monthWeekCustomizer: MonthWeekCustomizer(
                  textStyle:
                      const TextStyle(color: Color.fromARGB(255, 255, 174, 0)))
              // monthWidth: 500,
              // monthHeight: 200
              ),
          yearDropDownCustomizer: YearDropDownCustomizer(
              yearButtonCustomizer: YearButtonCustomizer(
                borderColorOnSelected: Colors.red,
              ),
              yearHeaderCustomizer: YearHeaderCustomizer(
                  titleTextStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 174, 0)))),
          onYearHeaderExpanded: (isExpanded) {
            if (kDebugMode) {
              print('isExpanded $isExpanded');
            }
          },
          onDateClicked: (onDateClicked) {
            if (kDebugMode) {
              print(
                  'selected date${onDateClicked.selectedDate}\nisSelected ${onDateClicked.isSelected}\nisHighlighted ${onDateClicked.isHighlighted}\nhasEvent ${onDateClicked.hasEvent}\nisCurrentDate ${onDateClicked.isCurrentDate}\nisDisabled ${onDateClicked.isDisabled}');
            }
          },
          onYearButtonClicked: (year, isSelected) {
            if (kDebugMode) {
              print('selected year $year\nisSelected $isSelected');
            }
          },
        ),
        Positioned(
          child: ElevatedButton(
            autofocus: true,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: const Color(0xFF232F3F),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              animationDuration: const Duration(seconds: 3),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const SelectRooms();
                },
              ));
            },
            child: const SizedBox(
              width: double.infinity,
              child: Center(
                child: CustomText(
                  'Next',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
