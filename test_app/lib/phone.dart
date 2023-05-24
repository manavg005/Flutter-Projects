import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({super.key});

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  bool isButtonActive = true;
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;

      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          color: Colors.white,
          margin: const EdgeInsets.only(left: 25, right: 25),
          // alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/tick_img.png",
                    fit: BoxFit.cover,
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Welcome,",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Please enter your registered mobile number to continue",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ))
                    //     TextStyle(
                    //   fontSize: 16,
                    // ),
                    ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          // textAlign: TextAlign.center,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Your Mobile Number"),
                          controller: controller,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isButtonActive
                        ? () {
                            setState(() => isButtonActive = false);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 34, 93, 195),
                        disabledForegroundColor:
                            const Color.fromARGB(255, 17, 91, 151)
                                .withOpacity(0.38),
                        disabledBackgroundColor:
                            const Color.fromARGB(255, 17, 91, 151)
                                .withOpacity(0.12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: const Text("Send OTP"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
