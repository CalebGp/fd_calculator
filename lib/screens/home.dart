import 'package:fdp_calculator/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController amount = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController period = TextEditingController();
  double interest = 0;
  double total = 0;
  void calculation() {
    double calRate =
        (double.parse(rate.text) / 100 / 12) * int.parse(period.text);
    double calInterest = calRate * int.parse(amount.text);
    setState(() {
      interest = calInterest;
      total = int.parse(amount.text) + interest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.blue,
        leading: const Icon(
          Icons.notes,
          size: 30,
          color: Colors.white,
        ),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade100,
          child: Column(
            children: [
              Container(
                height: 170,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(
                      100,
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Fixed Deposit",
                        style: GoogleFonts.robotoMono(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Calculator",
                        style: GoogleFonts.robotoMono(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 40, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextField(
                      title: "Deposit amount :",
                      hintText: "e.g 20000",
                      controller: amount,
                    ),
                    MyTextField(
                      title: "Annual Interest Rate(%) :",
                      hintText: "e.g 3",
                      controller: rate,
                    ),
                    MyTextField(
                      title: "Period(in month) :",
                      hintText: "e.g 3",
                      controller: period,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        calculation();
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "CALCULATE",
                            style: GoogleFonts.robotoMono(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    interest != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Result :",
                                style: GoogleFonts.robotoMono(
                                  fontSize: 20,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Interest : RM ${interest.toStringAsFixed(
                                    2,
                                  )}",
                                  style: GoogleFonts.robotoMono(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                  "Total : RM ${total.toStringAsFixed(
                                    2,
                                  )}",
                                  style: GoogleFonts.robotoMono(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
