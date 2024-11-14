import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<void> generatePdf(
    {required String name,
    required String whatsapp,
    required String address,
    required String totalAmount,
    required String discountAmount,
    required String advanceAmount,
    required String balanceAmount,
    required String paymentOption,
    required String selectedDate,
    required String selectedHour,
    required String selectedMinute,
    required String maleCount,
    required String femaleCount,
    required String selectedTreatment,
    required String branch,
    required BuildContext context}) async {
      print("Name: $name");
print("WhatsApp: $whatsapp");
print("Address: $address");
print("Total Amount: $totalAmount");
print("Discount Amount: $discountAmount");
print("Advance Amount: $advanceAmount");
print("Balance Amount: $balanceAmount");
print("Payment Option: $paymentOption");
print("Selected Date: $selectedDate");
print("Selected Hour: $selectedHour");
print("Selected Minute: $selectedMinute");
print("Male Count: $maleCount");
print("Female Count: $femaleCount");
print("Selected Treatment: $selectedTreatment");
print("Branch: $branch");

  final pdf = pw.Document();

  final bgImage = await _loadImage('assets/images/logom.png');
  final logoImage = await _loadImage('assets/images/logom.png');

  pdf.addPage(
    pw.Page(
      build: (context) => pw.Stack(
        children: [
          pw.Positioned.fill(
            child: pw.Opacity(
              opacity: 0.1,
              child: pw.Image(bgImage, fit: pw.BoxFit.cover),
            ),
          ),
          pw.Container(
            padding: const pw.EdgeInsets.all(20),
            child: pw.Column(
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Image(logoImage, width: 80, height: 80),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text(
                          "Amritha Ayurveda",
                          style: pw.TextStyle(
                            fontSize: 20,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black,
                          ),
                        ),
                        pw.Text("Cheepunkal P.O. Kumarakom, Kottayam, Kerala"),
                        pw.Text("e-mail: unknown@gmail.com"),
                        pw.Text("Mob: +91 9876543210 | +91 9876543210"),
                        pw.Text("GST No: 32AABCU9603R1ZW"),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Divider(thickness: 1),
                pw.SizedBox(height: 10),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      _buildSectionHeader("Patient Details"),
                    ]),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        _buildKeyValueRow("Name", name),
                        _buildKeyValueRow("Address", address),
                        _buildKeyValueRow("WhatsApp Number", whatsapp),
                      ],
                    ),
                    pw.Spacer(),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        _buildKeyValueRow("Booked On", selectedDate),
                        _buildKeyValueRow("Treatment Date", selectedDate),
                        _buildKeyValueRow("Treatment Time", selectedHour),
                      ],
                    ),
                  ],
                ),
                pw.Divider(thickness: 1),
                pw.SizedBox(height: 20),
                pw.TableHelper.fromTextArray(
                  headers: ['Treatment', 'Price', 'Male', 'Female', 'Total'],
                  data: [
                    [
                      'Panchakarma',
                      '230',
                      maleCount,
                      femaleCount,
                      '2,540'
                    ],
                    [
                      'Njavara Kizhi Treatment',
                      '230',
                      maleCount,
                      femaleCount,
                      '2,540'
                    ],
                    [
                      'Panchakarma',
                      '230',
                      maleCount,
                      '6',
                      '$femaleCount,540'
                    ],
                  ],
                  cellAlignment: pw.Alignment.centerLeft,
                  headerAlignment: pw.Alignment.centerLeft,
                  headerStyle: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 10,
                    color: PdfColors.green,
                  ),
                  headerDecoration: null,
                  cellStyle: const pw.TextStyle(fontSize: 10),
                  cellHeight: 25,
                  border: null,
                ),
                pw.SizedBox(height: 20),
                pw.Divider(thickness: 1),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        _buildKeyValueRow("Total Amount", totalAmount,
                            isBold: true),
                        _buildKeyValueRow("Discount", discountAmount),
                        _buildKeyValueRow("Advance", advanceAmount),
                        _buildKeyValueRow("Balance", balanceAmount, isBold: true),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Center(
                          child: pw.Text(
                            "Thank you for choosing us",
                            style: pw.TextStyle(
                              fontSize: 16,
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColors.green,
                            ),
                          ),
                        ),
                        pw.Text(
                          "Your well-being is our commitment, and we're honored \nyou've entrusted us with your health journey",
                          textAlign: pw.TextAlign.end,
                          style: const pw.TextStyle(
                              fontSize: 12, color: PdfColors.grey),
                        ),
                        pw.SizedBox(height: 20),
                        pw.Text(
                          "Signature:",
                          style: const pw.TextStyle(
                              fontSize: 12, color: PdfColors.grey),
                        ),
                        pw.SizedBox(height: 40),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 80),
                pw.Divider(color: PdfColors.grey),
                pw.Text(
                  "Booking amount is non-refundable, and it's important to arrive on the allotted time for your treatment",
                  style:
                      const pw.TextStyle(fontSize: 10, color: PdfColors.grey),
                  textAlign: pw.TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}

Future<pw.MemoryImage> _loadImage(String path) async {
  final data = await rootBundle.load(path);
  return pw.MemoryImage(data.buffer.asUint8List());
}

pw.Widget _buildSectionHeader(String title) {
  return pw.Text(
    title,
    style: pw.TextStyle(
      fontSize: 14,
      fontWeight: pw.FontWeight.bold,
      color: PdfColors.green,
    ),
  );
}

pw.Widget _buildKeyValueRow(String key, String value, {bool isBold = false}) {
  return pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 5),
    child: pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          "$key: ",
          style: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
            fontSize: 10,
          ),
        ),
        pw.Text(
          value,
          style: pw.TextStyle(
            fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
            fontSize: 10,
            color: PdfColors.grey700,
          ),
        ),
      ],
    ),
  );
}
