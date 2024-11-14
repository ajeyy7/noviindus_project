import 'package:flutter/material.dart';
import 'package:noviindus_project/constants/colors.dart';
import 'package:noviindus_project/view/components/common_button.dart';
import 'package:noviindus_project/view/components/mytextfiled.dart';
import 'package:noviindus_project/view/pages/generatepdf.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class TreatmentReg extends StatelessWidget {
  const TreatmentReg({super.key});

  void _showAddTreatmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Choose Treatment'),
              DropdownButtonFormField<String>(
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration: InputDecoration(
                  labelText: 'Choose preferred treatment',
                  labelStyle: const TextStyle(fontSize: 14),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: ['Treatment 1', 'Treatment 2']
                    .map((String treatment) => DropdownMenuItem<String>(
                        value: treatment, child: Text(treatment)))
                    .toList(),
                onChanged: (String? value) {},
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Add patients'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                              height: 45,
                              width: 124,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(child: Text('Male'))),
                          const SizedBox(height: 30),
                          Container(
                              height: 45,
                              width: 124,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(child: Text('Female'))),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    color: primary, shape: BoxShape.circle),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Center(child: Text('0'))),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    color: primary, shape: BoxShape.circle),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    color: primary, shape: BoxShape.circle),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Center(child: Text('0'))),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    color: primary, shape: BoxShape.circle),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: const [CommonButton(widget: Text('Save'), color: primary)],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyTextFiled(name: 'Name', hinttext: 'Enter your full name'),
              const MyTextFiled(
                  name: 'Whatsapp Number',
                  hinttext: 'Enter your Whatsapp number'),
              const MyTextFiled(
                  name: 'Address', hinttext: 'Enter your full address'),
              DropdownButtonFormField<String>(
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration: InputDecoration(
                  labelText: 'Location',
                  labelStyle: const TextStyle(fontSize: 14),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: ['Loc 1', 'Loc 2']
                    .map((String treatment) => DropdownMenuItem<String>(
                        value: treatment, child: Text(treatment)))
                    .toList(),
                onChanged: (String? value) {},
              ),
              DropdownButtonFormField<String>(
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration: InputDecoration(
                  labelText: 'Branch',
                  labelStyle: const TextStyle(fontSize: 14),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: ['Branch 1', 'Branch 2']
                    .map((String treatment) => DropdownMenuItem<String>(
                        value: treatment, child: Text(treatment)))
                    .toList(),
                onChanged: (String? value) {},
              ),
              const SizedBox(height: 10),
              const Text('Treatments'),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            const Text(
                              '1. Couple Combo package ...',
                              style: TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Text('Male'),
                                    const SizedBox(width: 10),
                                    Container(
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const Center(child: Text('0'))),
                                  ],
                                ),
                                const SizedBox(width: 40),
                                Row(
                                  children: [
                                    const Text('Female'),
                                    const SizedBox(width: 10),
                                    Container(
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const Center(child: Text('0'))),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.cancel, color: Colors.red),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.green),
                          onPressed: () {
                            _showAddTreatmentDialog(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CommonButton(
                widget: Text('+Add Treatment'),
                  color: Colors.green.shade200,
                  onTap: () {
                    _showAddTreatmentDialog(context);
                  }),
              const SizedBox(height: 20),
              const MyTextFiled(name: 'Total Amount', hinttext: ''),
              const MyTextFiled(name: 'Discount Amount', hinttext: ''),
              const Text('Payment Option'),
              Row(
                children: [
                  Radio(
                    value: 'Cash',
                    groupValue: '',
                    onChanged: (value) {},
                  ),
                  const Text('Cash'),
                  Radio(
                    value: 'Card',
                    groupValue: '',
                    onChanged: (value) {},
                  ),
                  const Text('Card'),
                  Radio(
                    value: 'UPI',
                    groupValue: '',
                    onChanged: (value) {},
                  ),
                  const Text('UPI'),
                ],
              ),
              const MyTextFiled(name: 'Advance Amount', hinttext: ''),
              const MyTextFiled(name: 'Balance Amount', hinttext: ''),
              const MyTextFiled(name: 'Treatment Date', hinttext: ''),
              Column(
                children: [
                  const Text('Treatment Time'),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          decoration: InputDecoration(
                            labelText: 'Hour',
                            labelStyle: const TextStyle(fontSize: 14),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          items: ['Hour 1', 'Hour 2']
                              .map((String treatment) =>
                                  DropdownMenuItem<String>(
                                      value: treatment, child: Text(treatment)))
                              .toList(),
                          onChanged: (String? value) {},
                        ),
                      ),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          decoration: InputDecoration(
                            labelText: 'Minutes',
                            labelStyle: const TextStyle(fontSize: 14),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          items: ['Hour 1', 'Hour 2']
                              .map((String treatment) =>
                                  DropdownMenuItem<String>(
                                      value: treatment, child: Text(treatment)))
                              .toList(),
                          onChanged: (String? value) {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
               CommonButton(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GeneratePdfExample()));
                },
                widget:  Text(
            'Save',
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
            textAlign: TextAlign.start,
          ),
                color: primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
