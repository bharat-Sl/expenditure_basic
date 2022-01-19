import 'package:expenditure_basic/models/expenditurePerGroup.dart';
import 'package:expenditure_basic/screens/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenditureInput extends StatefulWidget {
  const ExpenditureInput({Key? key}) : super(key: key);

  @override
  _ExpenditureInputState createState() => _ExpenditureInputState();
}

class _ExpenditureInputState extends State<ExpenditureInput> {
  TextEditingController decorator = TextEditingController();
  TextEditingController photographer = TextEditingController();
  TextEditingController caterer = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  "Expenses",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              controller: decorator,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Decorator",
                suffix: Text("₹"),
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              controller: photographer,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Photographer",
                suffix: Text("₹"),
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              controller: caterer,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                suffix: Text("₹"),
                labelText: "Caterer",
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                List<ExpenditurePerGroup> chartData = [
                  ExpenditurePerGroup(
                      expenditure: int.parse(decorator.text),
                      group: "Decorator",
                      color: Colors.blue),
                  ExpenditurePerGroup(
                      expenditure: int.parse(photographer.text),
                      group: "Photographer",
                      color: Colors.teal),
                  ExpenditurePerGroup(
                      expenditure: int.parse(caterer.text),
                      group: "Caterer",
                      color: Colors.cyan)
                ];
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Report(chartData: chartData)));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    "Generate Report",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
