import 'package:flutter/material.dart';
import 'package:my_verifications/Screens/userInformationScreen.dart';
import 'package:my_verifications/provider/auth_provider.dart';
import 'package:my_verifications/utils/utils.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
        body: Container(
            color: Color.fromARGB(255, 30, 30, 55),
            child: SafeArea(
                child: isLoading == true
                    ? const Center(child: CircularProgressIndicator())
                    : Center(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 25, horizontal: 35),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: GestureDetector(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: const Icon(Icons.arrow_back),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .28,
                                  height:
                                      MediaQuery.of(context).size.height * .28,
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(98, 79, 79, 141)),
                                  child: Image.asset("assets/players.png"),
                                ),
                                const Text(
                                  "Verification",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "ُEnter the OTP sent to your phone number",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white38),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Pinput(
                                  length: 6,
                                  showCursor: true,
                                  defaultPinTheme: PinTheme(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                97, 255, 255, 255))),
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  onCompleted: (value) {
                                    setState(() {
                                      otpCode = value;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: ElevatedButton(
                                    child: Text("Verify"),
                                    onPressed: () {
                                      if (otpCode != null) {
                                        verifyOtp(context, otpCode!);
                                      } else {
                                        showSnackBar(
                                            context, "Enter 6-Digit Code");
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "Didn't receive any code",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white38),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  "Resend New Code",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ))))));
  }

  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
        context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSuccess: () {
          ap.checkExistingUser().then((value) async {
            if (value == true) {
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const userInformationScreen()),
                  (route) => false);
            }
          });
        });
  }
}
