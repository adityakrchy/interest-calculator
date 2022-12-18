import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  TextEditingController _controller3 = new TextEditingController();
  double interest = 0;
  double total = 0;

  void calculation() {
    final calinterestrate = (double.parse(_controller2.text) / 100 / 12) *
        (double.parse(_controller3.text));
    final calinterest = calinterestrate * double.parse(_controller1.text);
    setState(() {
      interest = calinterest;
      total = interest + double.parse(_controller1.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.notes,
          size: 30,
          color: Colors.white,
        ),
        toolbarHeight: 30,
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      color: Colors.grey[100],
      child: Column(children: [
        Container(
          height: 170,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Fixed Deposit",
                      style: GoogleFonts.robotoMono(
                          fontSize: 35, color: Colors.white)),
                  Text("Calculator",
                      style: GoogleFonts.robotoMono(
                          fontSize: 35, color: Colors.white)),
                ]),
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
              inputForm(
                  title: "Enter Deposit Amount",
                  hintText: "eg. 20000",
                  controller: _controller1),
              inputForm(
                  title: "Annual Interest Rate(%)",
                  hintText: "eg. 3",
                  controller: _controller2),
              inputForm(
                  title: "Period (in months)",
                  hintText: "eg. 12",
                  controller: _controller3),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => {calculation()},
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      "Calculate",
                      style: GoogleFonts.robotoMono(
                          fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Result: ",
                    style: GoogleFonts.robotoMono(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Interest: " + interest.toStringAsFixed(2),
                    style: GoogleFonts.robotoMono(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Total: " + total.toStringAsFixed(2),
                    style: GoogleFonts.robotoMono(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }

  Widget inputForm(
      {required String title,
      required String hintText,
      required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.robotoMono(fontSize: 20),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                hintText: hintText),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
