
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
  bool isfavorite = false;
  int likesCounter = 0;
  bool isFollowed = false;
  bool isOffline = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 223, 247),

        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 218, 223, 247),

          leading: Icon(
            Icons.arrow_back_rounded,
            color: const Color.fromARGB(255, 35, 44, 51),
          ),

          title: Text(
            "alexhunt",
            style: GoogleFonts.inter(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
              color: const Color.fromARGB(255, 35, 44, 51),
            ),
          ),

          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Icon(
                Icons.menu_rounded,
                size: 26,
                color: const Color.fromARGB(255, 35, 44, 51),
              ),
            ),
          ],
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PROFILE HEADER

            Padding(
              padding: const EdgeInsets.only(
                left: 22,
                right: 18,
                top: 20,
              ),

              child: Row(
                children: [
                  // PROFILE ICON

                  Container(
                    height: 88,
                    width: 88,

                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.55),
                      borderRadius: BorderRadius.circular(30),

                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.8),
                        width: 1.5,
                      ),
                    ),

                    child: Icon(
                      Icons.flight_takeoff_rounded,
                      size: 43,
                      color: const Color.fromARGB(255, 90, 125, 124),
                    ),
                  ),

                  const SizedBox(width: 20),

                  // NAME, LIKES AND STATUS

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Alex Huntman",
                        style: GoogleFonts.inter(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 35, 44, 51),
                        ),
                      ),

                      const SizedBox(height: 14),

                      Row(
                        children: [
                          // LIKES COUNT

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$likesCounter",
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromARGB(
                                    255, 35, 44, 51,
                                  ),
                                ),
                              ),

                              Text(
                                "Likes",
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(
                                    255, 181, 178, 194,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 22),

                          // ONLINE / OFFLINE

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isOffline
                                  ? const Color.fromARGB(
                                      255, 181, 178, 194,
                                    )
                                  : const Color.fromARGB(
                                      255, 90, 125, 124,
                                    ),

                              foregroundColor: const Color.fromARGB(
                                255, 218, 223, 247,
                              ),

                              elevation: 0,

                              padding: const EdgeInsets.symmetric(
                                horizontal: 13,
                                vertical: 9,
                              ),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),

                            onPressed: () {
                              setState(() {
                                isOffline = !isOffline;
                              });
                            },

                            child: Text(
                              isOffline ? "Offline" : "Online",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // TAGLINE

            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "Hell of a Life!",
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                  color: const Color.fromARGB(255, 90, 125, 124),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // FOLLOW AND LIKE ACTIONS

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),

              child: Row(
                children: [
                  // LIKE BUTTON

                  Container(
                    height: 48,
                    width: 54,

                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.55),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isfavorite = !isfavorite;

                          if (isfavorite) {
                            likesCounter++;
                          } else {
                            if (likesCounter > 0) {
                              likesCounter--;
                            }
                          }
                        });
                      },

                      icon: Icon(
                        isfavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,

                        size: 25,

                        color: isfavorite
                            ? const Color.fromARGB(255, 90, 125, 124)
                            : const Color.fromARGB(255, 181, 178, 194),
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  // FOLLOW BUTTON

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isFollowed
                            ? const Color.fromARGB(255, 160, 193, 209)
                            : const Color.fromARGB(255, 35, 44, 51),

                        foregroundColor: const Color.fromARGB(
                          255, 218, 223, 247,
                        ),

                        elevation: 0,

                        padding: const EdgeInsets.symmetric(vertical: 15),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      onPressed: () {
                        setState(() {
                          isFollowed = !isFollowed;
                        });
                      },

                      child: Text(
                        isFollowed ? "Following" : "Follow",

                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // FEED CONTAINER

            Center(
              child: Container(
                height: 420,
                width: 350,

                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.5),

                  border: Border.all(
                    width: 1,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),

                  borderRadius: BorderRadius.circular(25),
                ),

                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.grid_view_rounded,
                        size: 38,
                        color: const Color.fromARGB(255, 160, 193, 209),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        "Your Feed",
                        style: GoogleFonts.inter(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 35, 44, 51),
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Your world, your moments.",
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          color: const Color.fromARGB(255, 181, 178, 194),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
