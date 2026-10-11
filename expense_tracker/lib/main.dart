import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  List<String> expenses = [];
  List<int> amount = [];

  @override
  Widget build(BuildContext context) {
    int total = 0;

    for (int am in amount) {
      total += am;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 202, 240, 248),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 2, 62, 138),
          elevation: 0,
          leading: Icon(
            CupertinoIcons.ellipsis_vertical,
            color: Color.fromARGB(255, 202, 240, 248),
          ),
          title: Text(
            "Expense Tracker",
            style: GoogleFonts.inter(
              color: Color.fromARGB(255, 202, 240, 248),
              fontSize: 23,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          centerTitle: true,
        ),

        body: Center(
          child: Container(
            height: 600,
            width: 450,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.5, color: Color.fromARGB(255, 72, 202, 228)),
              borderRadius: BorderRadius.circular(25),
            ),

            child: Padding(
              padding: EdgeInsets.all(28),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Track Your Expenses",
                      style: GoogleFonts.inter(
                        color: Color.fromARGB(255, 3, 4, 94),
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),

                  SizedBox(height: 28),

                  Text(
                    "Expense Name",
                    style: GoogleFonts.inter(
                      color: Color.fromARGB(255, 3, 4, 94),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 8),

                  TextField(
                    controller: nameController,
                    cursorColor: Color.fromARGB(255, 2, 62, 138),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 202, 240, 248).withValues(alpha: 0.25),
                      hintText: "e.g. Groceries",
                      hintStyle: GoogleFonts.lato(
                        color: Color.fromARGB(255, 3, 4, 94).withValues(alpha: 0.45),
                        fontSize: 14,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 72, 202, 228)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 72, 202, 228)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 2, 62, 138), width: 1.5),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Amount",
                    style: GoogleFonts.inter(
                      color: Color.fromARGB(255, 3, 4, 94),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 8),

                  TextField(
                    controller: amountController,
                    cursorColor: Color.fromARGB(255, 2, 62, 138),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 202, 240, 248).withValues(alpha: 0.25),
                      hintText: "Enter amount",
                      hintStyle: GoogleFonts.lato(
                        color: Color.fromARGB(255, 3, 4, 94).withValues(alpha: 0.45),
                        fontSize: 14,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 72, 202, 228)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 72, 202, 228)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 2, 62, 138), width: 1.5),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 2, 62, 138),
                        foregroundColor: Color.fromARGB(255, 202, 240, 248),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),

                      onPressed: () {
                        String name = nameController.text.trim();
                        int? amountEntered = int.tryParse(amountController.text);

                        if (name.isNotEmpty && amountEntered != null && amountEntered > 0) {
                          setState(() {
                            expenses.add(name);
                            amount.add(amountEntered);
                          });

                          nameController.clear();
                          amountController.clear();
                        }
                      },

                      child: Text(
                        "Add Expense",
                        style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),

                  SizedBox(height: 28),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Expenses",
                            style: GoogleFonts.inter(
                              color: Color.fromARGB(255, 2, 62, 138),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          SizedBox(height: 10),

                          for (var expense in expenses)
                            Text(
                              expense,
                              style: GoogleFonts.lato(
                                color: Color.fromARGB(255, 3, 4, 94),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amount",
                            style: GoogleFonts.inter(
                              color: Color.fromARGB(255, 2, 62, 138),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          SizedBox(height: 10),

                          for (var num in amount)
                            Text(
                              num.toString(),
                              style: GoogleFonts.lato(
                                color: Color.fromARGB(255, 3, 4, 94),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.inter(
                              color: Color.fromARGB(255, 2, 62, 138),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          SizedBox(height: 10),

                          Text(
                            total.toString(),
                            style: GoogleFonts.inter(
                              color: Color.fromARGB(255, 3, 4, 94),
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
