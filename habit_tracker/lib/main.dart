// Background: 255, 255, 250, 250
// Headings: Black
// Text: 255, 45, 55, 72
// Accent: 255, 56, 161, 105

import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

TextEditingController habitController = TextEditingController();
List<String> habitList = [];
List<bool> completedList = [];

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 250, 250),
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 56, 161, 105)),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 250, 250),
          elevation: 0,
          leading: Icon(FluentIcons.home_12_regular, color: Color.fromARGB(255, 56, 161, 105)),
          title: Text(
            "Habit Tracker",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 56, 161, 105),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(FluentIcons.target_24_regular, color: Colors.white, size: 32),
                    SizedBox(height: 16),
                    Text(
                      "Build Better Habits",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Small steps every day lead to big changes.",
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28),
              Text(
                "Add a new habit",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: habitController,
                style: GoogleFonts.poppins(color: Color.fromARGB(255, 45, 55, 72), fontSize: 14),
                decoration: InputDecoration(
                  hintText: "e.g. Read for 20 minutes",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 13),
                  prefixIcon: Icon(
                    FluentIcons.edit_20_regular,
                    color: Color.fromARGB(255, 56, 161, 105),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Color.fromARGB(255, 230, 235, 230)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Color.fromARGB(255, 230, 235, 230)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Color.fromARGB(255, 56, 161, 105), width: 1.5),
                  ),
                ),
              ),
              SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      String name = habitController.text.trim();

                      if (name.isNotEmpty) {
                        habitList.add(name);
                        completedList.add(false);
                      }

                      habitController.clear();
                    });
                  },
                  icon: Icon(FluentIcons.add_20_regular),
                  label: Text(
                    "Add Habit",
                    style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 56, 161, 105),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ),
              SizedBox(height: 28),
              Row(
                children: [
                  Text(
                    "Your Habits",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "${habitList.length} total",
                    style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 45, 55, 72),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Expanded(
                child: ListView(
                  children: [
                    if (habitList.isEmpty)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Color.fromARGB(255, 230, 235, 230)),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              FluentIcons.clipboard_task_24_regular,
                              size: 38,
                              color: Color.fromARGB(255, 56, 161, 105),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "No habits yet",
                              style: GoogleFonts.poppins(
                                color: Color.fromARGB(255, 45, 55, 72),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Add your first habit to get started.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    for (var i = 0; i < habitList.length; i++)
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: completedList[i]
                                ? Color.fromARGB(100, 56, 161, 105)
                                : Color.fromARGB(255, 230, 235, 230),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              completedList[i]
                                  ? FluentIcons.checkmark_circle_24_filled
                                  : FluentIcons.circle_24_regular,
                              color: completedList[i]
                                  ? Color.fromARGB(255, 56, 161, 105)
                                  : Colors.grey,
                              size: 24,
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                habitList[i],
                                style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 45, 55, 72),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  decoration: completedList[i]
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  completedList[i] = !completedList[i];
                                });
                              },
                              icon: Icon(
                                completedList[i]
                                    ? FluentIcons.checkmark_square_20_filled
                                    : FluentIcons.checkmark_square_20_regular,
                                color: Color.fromARGB(255, 56, 161, 105),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
