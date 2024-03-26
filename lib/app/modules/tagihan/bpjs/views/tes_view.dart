import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class tesview extends StatefulWidget {
  @override
  _tesviewState createState() => _tesviewState();
}

class _tesviewState extends State<tesview> {
  List<String> months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  List<String> generateYears() {
    int currentYear = int.parse(DateFormat('yyyy').format(DateTime.now()));
    List<String> years = [];
    for (int i = 0; i < 10; i++) {
      years.add((currentYear + i).toString());
    }
    return years;
  }

  List<String> generateDays(int month, int year) {
    List<String> days = [];
    int daysInMonth = DateTime(year, month + 1, 0).day;
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(i.toString());
    }
    return days;
  }

  String selectedMonth = DateFormat('MMMM').format(DateTime.now());
  String selectedYear = DateFormat('yyyy').format(DateTime.now());
  String selectedDay = '1'; // Default day

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Bulan dan Tahun'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pilih Bulan dan Tahun:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            DropdownButton<String>(
              value: selectedMonth,
              onChanged: (String? newValue) {
                setState(() {
                  selectedMonth = newValue!;
                  selectedDay = '1'; // Reset selected day when month changes
                });
              },
              items: months.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            DropdownButton<String>(
              value: selectedYear,
              onChanged: (String? newValue) {
                setState(() {
                  selectedYear = newValue!;
                  selectedDay = '1'; // Reset selected day when year changes
                });
              },
              items:
                  generateYears().map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            DropdownButton<String>(
              value: selectedDay,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDay = newValue!;
                });
              },
              items: generateDays(months.indexOf(selectedMonth) + 1,
                      int.parse(selectedYear))
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
