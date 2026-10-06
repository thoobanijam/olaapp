
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController phoneController =
      TextEditingController();

  final TextEditingController otpController =
      TextEditingController();

  bool isVerify = false;
  bool isLoading = false;

  String verificationId = "";

  // =========================================================
  // SEND OTP
  // =========================================================

Future<void> sendOtp() async {
  setState(() {
    isLoading = true;
  });

  try {
    String phoneNumber =
        "+91${phoneController.text.trim()}";

    print("===============================");
    print("SENDING TEST OTP");
    print("Phone: $phoneNumber");
    print("CALLING FIREBASE VERIFY PHONE");
    print("===============================");

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,

      // Firebase can automatically verify the phone
      // on Android. We DON'T login automatically here
      // because we want to show the OTP page.
      verificationCompleted:
          (PhoneAuthCredential credential) async {
        print("===============================");
        print("VERIFICATION COMPLETED");
        print("===============================");

        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      },

      // Firebase verification failed
      verificationFailed:
          (FirebaseAuthException e) {
        print("===============================");
        print("VERIFICATION FAILED");
        print("ERROR CODE: ${e.code}");
        print("ERROR MESSAGE: ${e.message}");
        print("===============================");

        if (mounted) {
          setState(() {
            isLoading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "${e.code}: ${e.message ?? 'Verification failed'}",
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },

      // Firebase successfully sent the OTP
      codeSent: (
        String verificationId,
        int? resendToken,
      ) {
        print("===============================");
        print("CODE SENT");
        print("Verification ID: $verificationId");
        print("===============================");

        if (mounted) {
          setState(() {
            this.verificationId =
                verificationId;

            isVerify = true;
            isLoading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("OTP sent successfully"),
              backgroundColor: Colors.green,
            ),
          );
        }
      },

      // Automatic SMS retrieval timed out
      codeAutoRetrievalTimeout:
          (String verificationId) {
        print("===============================");
        print("AUTO RETRIEVAL TIMEOUT");
        print("===============================");

        this.verificationId =
            verificationId;
      },
    );
  } catch (e) {
    print("===============================");
    print("SEND OTP ERROR");
    print(e);
    print("===============================");

    if (mounted) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}


  // =========================================================
  // VERIFY OTP
  // =========================================================

  Future<void> verifyOtp() async {
    String otp = otpController.text.trim();

    // Check OTP
    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter the 6-digit OTP"),
        ),
      );
      return;
    }

    // Check verification ID
    if (verificationId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Verification ID is missing"),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      print("================================");
      print("VERIFYING OTP");
      print("OTP: $otp");
      print("Verification ID exists: true");
      print("================================");

      // Create Firebase credential
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      // Login to Firebase
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      // Login successful
      print("================================");
      print("LOGIN SUCCESSFUL");
      print("UID: ${userCredential.user?.uid}");
      print("PHONE: ${userCredential.user?.phoneNumber}");
      print("================================");

      if (mounted) {
        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login successful"),
            backgroundColor: Colors.green,
          ),
        );

        // We will navigate to Bookanolacab here later.
      }
    } on FirebaseAuthException catch (e) {
      print("================================");
      print("OTP VERIFICATION FAILED");
      print("ERROR CODE: ${e.code}");
      print("ERROR MESSAGE: ${e.message}");
      print("================================");

      if (mounted) {
        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "${e.code}: ${e.message ?? 'OTP verification failed'}",
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print("================================");
      print("UNKNOWN ERROR");
      print(e);
      print("================================");

      if (mounted) {
        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: $e"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // =========================================================
  // RESEND OTP
  // =========================================================

  Future<void> resendOtp() async {
    otpController.clear();

    await sendOtp();
  }

  // =========================================================
  // DISPOSE
  // =========================================================

  @override
  void dispose() {
    phoneController.dispose();
    otpController.dispose();

    super.dispose();
  }

  // =========================================================
  // UI
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          color: Color.fromARGB(
            255,
            232,
            234,
            235,
          ),
        ),

        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 30,
              ),

              width: 400,

              height: 500,

              color: Colors.white,

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  // =================================================
                  // PHONE NUMBER SCREEN
                  // =================================================

                  if (!isVerify) ...[
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },

                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.grey,
                          ),
                        ),

                        Container(
                          margin:
                              const EdgeInsets.only(
                            left: 90,
                          ),

                          child: Image.asset(
                            'assets/img/bookolaimg.webp',

                            width: 90,

                            height: 100,
                          ),
                        ),
                      ],
                    ),

                    const Center(
                      child: Text(
                        "Enter your mobile number",

                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.w600,
                          letterSpacing: -1,
                        ),
                      ),
                    ),

                    const Center(
                      child: Padding(
                        padding:
                            EdgeInsets.only(
                          top: 10,
                        ),

                        child: Text(
                          "A 6-digit OTP will be sent on SMS",

                          style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ),

                    // =================================================
                    // PHONE INPUT
                    // =================================================

                    Container(
                      margin:
                          const EdgeInsets.all(
                        20,
                      ),

                      decoration:
                          BoxDecoration(
                        border: Border.all(
                          color:
                              const Color.fromARGB(
                            255,
                            239,
                            234,
                            234,
                          ),
                        ),
                      ),

                      child: Row(
                        children: [
                          // INDIA FLAG
                          Padding(
                            padding:
                                const EdgeInsets
                                    .symmetric(
                              horizontal: 10,
                            ),

                            child: Image.asset(
                              'assets/img/ind.jpg',

                              width: 50,

                              height: 50,

                              fit: BoxFit.contain,
                            ),
                          ),

                          // COUNTRY CODE
                          const Text(
                            "+91",

                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(
                            width: 10,
                          ),

                          // PHONE NUMBER
                          Expanded(
                            child: TextField(
                              controller:
                                  phoneController,

                              keyboardType:
                                  TextInputType.phone,

                              maxLength: 10,

                              onChanged: (value) {
                                setState(() {});
                              },

                              decoration:
                                  const InputDecoration(
                                hintText:
                                    "Mobile number",

                                border:
                                    InputBorder.none,

                                counterText: "",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // =================================================
                    // NEXT BUTTON
                    // =================================================

                    GestureDetector(
                      onTap:
                          phoneController
                                      .text
                                      .length ==
                                  10 &&
                              !isLoading
                          ? sendOtp
                          : null,

                      child: Container(
                        margin:
                            const EdgeInsets.all(
                          20,
                        ),

                        width: 350,

                        height: 50,

                        color:
                            phoneController
                                            .text
                                            .length ==
                                        10 &&
                                    !isLoading
                                ? Colors.black
                                : const Color
                                    .fromARGB(
                                    255,
                                    224,
                                    221,
                                    221,
                                  ),

                        child: Center(
                          child: isLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,

                                  child:
                                      CircularProgressIndicator(
                                    color:
                                        Colors.white,

                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  "Next",

                                  style:
                                      TextStyle(
                                    color:
                                        phoneController
                                                        .text
                                                        .length ==
                                                    10
                                            ? Colors
                                                .white
                                            : const Color
                                                .fromARGB(
                                                255,
                                                131,
                                                130,
                                                130,
                                              ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],

                  // =================================================
                  // OTP SCREEN
                  // =================================================

                  if (isVerify) ...[
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isVerify = false;

                              otpController.clear();
                            });
                          },

                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.grey,
                          ),
                        ),

                        Container(
                          margin:
                              const EdgeInsets.only(
                            left: 90,
                          ),

                          child: Image.asset(
                            'assets/img/bookolaimg.webp',

                            width: 90,

                            height: 100,
                          ),
                        ),
                      ],
                    ),

                    const Center(
                      child: Text(
                        "Verify and log in",

                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.w600,
                          letterSpacing: -1,
                        ),
                      ),
                    ),

                    // =================================================
                    // OTP MESSAGE
                    // =================================================

                    Center(
                      child: Container(
                        margin:
                            const EdgeInsets.only(
                          top: 10,
                        ),

                        child: Text(
                          "Enter the OTP sent to your mobile\n"
                        "+91${phoneController.text.trim()}",

                          textAlign:
                              TextAlign.center,

                          style:
                              const TextStyle(
                            color: Colors.grey,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ),

                    // =================================================
                    // OTP INPUT
                    // =================================================

                    Container(
                      margin:
                          const EdgeInsets.all(
                        20,
                      ),

                      decoration:
                          BoxDecoration(
                        border: Border.all(
                          color:
                              const Color.fromARGB(
                            255,
                            239,
                            234,
                            234,
                          ),
                        ),
                      ),

                      child: Row(
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.symmetric(
                              horizontal: 10,
                            ),

                            child: Icon(
                              Icons.key,
                              color: Colors.grey,
                            ),
                          ),

                          Expanded(
                            child: TextField(
                              controller:
                                  otpController,

                              keyboardType:
                                  TextInputType.number,

                              maxLength: 6,

                              onChanged: (value) {
                                setState(() {});
                              },

                              decoration:
                                  const InputDecoration(
                                hintText:
                                    "Enter 6 digit OTP",

                                border:
                                    InputBorder.none,

                                counterText: "",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // =================================================
                    // LOGIN BUTTON
                    // =================================================

                    GestureDetector(
                      onTap:
                          otpController
                                      .text
                                      .length ==
                                  6 &&
                              !isLoading
                          ? verifyOtp
                          : null,

                      child: Container(
                        margin:
                            const EdgeInsets.all(
                          20,
                        ),

                        width: 350,

                        height: 50,

                        color:
                            otpController
                                            .text
                                            .length ==
                                        6 &&
                                    !isLoading
                                ? Colors.black
                                : const Color
                                    .fromARGB(
                                    255,
                                    224,
                                    221,
                                    221,
                                  ),

                        child: Center(
                          child: isLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,

                                  child:
                                      CircularProgressIndicator(
                                    color:
                                        Colors.white,

                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  "Log in",

                                  style:
                                      TextStyle(
                                    color:
                                        otpController
                                                        .text
                                                        .length ==
                                                    6
                                            ? Colors
                                                .white
                                            : const Color
                                                .fromARGB(
                                                255,
                                                131,
                                                130,
                                                130,
                                              ),
                                  ),
                                ),
                        ),
                      ),
                    ),

                    // =================================================
                    // RESEND OTP
                    // =================================================

                    Center(
                      child: TextButton(
                        onPressed:
                            isLoading
                                ? null
                                : resendOtp,

                        child: const Text(
                          "Resend OTP",

                          style: TextStyle(
                            color: Colors.blue,

                            decoration:
                                TextDecoration
                                    .underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

