import 'package:flutter/material.dart';

/// Colors
/// D8D8F6 Background
/// B18FCF Purple
/// 494850 Charcoal
/// 2C2C34 Dark / Shadow

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
  TextEditingController passwordController = TextEditingController();

  bool showText = false;
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 216, 216, 246),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 44, 44, 52), width: 0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 95,
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        showText ? "Username: ${nameController.text}" : "",
                        style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 73, 72, 80)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        showText ? "Password: ${passwordController.text}" : "",
                        style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 73, 72, 80)),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),

              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                  color: Color.fromARGB(255, 73, 72, 80),
                ),
              ),

              SizedBox(height: 8),

              Text(
                "Login to continue",
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 0.2,
                  color: Color.fromARGB(255, 44, 44, 52),
                ),
              ),

              SizedBox(height: 30),

              Container(
                height: 530,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .45),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.7), width: 1),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 26, right: 26, top: 26, bottom: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 72,
                        width: 72,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 44, 44, 52),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Icon(
                          Icons.person_rounded,
                          size: 38,
                          color: Color.fromARGB(255, 216, 216, 246),
                        ),
                      ),

                      SizedBox(height: 28),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Username",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 73, 72, 80),
                            ),
                          ),

                          SizedBox(height: 8),

                          TextField(
                            controller: nameController,
                            style: TextStyle(color: Color.fromARGB(255, 44, 44, 52), fontSize: 15),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.alternate_email_rounded,
                                size: 20,
                                color: Color.fromARGB(255, 177, 143, 207),
                              ),
                              filled: true,
                              fillColor: Colors.white.withValues(alpha: 0.55),
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 44, 44, 52),
                                  width: 0.2,
                                ),
                              ),
                              hintText: "@example.com",
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 167, 167, 201),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 73, 72, 80),
                            ),
                          ),

                          SizedBox(height: 8),

                          TextField(
                            controller: passwordController,
                            obscureText: showPassword,
                            style: TextStyle(color: Color.fromARGB(255, 44, 44, 52), fontSize: 15),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                size: 20,
                                color: Color.fromARGB(255, 177, 143, 207),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                icon: Icon(
                                  showPassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  size: 21,
                                  color: Color.fromARGB(255, 83, 66, 100),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white.withValues(alpha: 0.55),
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 44, 44, 52),
                                  width: 0.2,
                                ),
                              ),
                              hintText: "Enter your password",
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 167, 167, 201),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.only(top: 10, bottom: 4),
                            ),
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Color.fromARGB(255, 177, 143, 207),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 44, 44, 52),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          onPressed: () {
                            setState(() {
                              print("Username: ${nameController.text}");
                              print("Password: ${passwordController.text}");
                              showText = !showText;
                            });
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Color.fromARGB(255, 234, 211, 255),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 24),

                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Color.fromARGB(255, 73, 72, 80).withValues(alpha: 0.2),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                color: Color.fromARGB(255, 73, 72, 80).withValues(alpha: 0.55),
                              ),
                            ),
                          ),

                          Expanded(
                            child: Divider(
                              color: Color.fromARGB(255, 73, 72, 80).withValues(alpha: 0.2),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 22),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 46,
                            width: 46,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.5),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color.fromARGB(255, 73, 72, 80).withValues(alpha: 0.15),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.g_mobiledata,
                                size: 22,
                                color: Color.fromARGB(255, 44, 44, 52),
                              ),
                            ),
                          ),

                          SizedBox(width: 14),

                          Container(
                            height: 46,
                            width: 46,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.5),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color.fromARGB(255, 73, 72, 80).withValues(alpha: 0.15),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.apple,
                                size: 22,
                                color: Color.fromARGB(255, 44, 44, 52),
                              ),
                            ),
                          ),

                          SizedBox(width: 14),

                          Container(
                            height: 46,
                            width: 46,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.5),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color.fromARGB(255, 73, 72, 80).withValues(alpha: 0.15),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.window_rounded,
                                size: 22,
                                color: Color.fromARGB(255, 44, 44, 52),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
