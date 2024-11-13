import 'package:flutter/material.dart';
import 'package:noviindus_project/constants/colors.dart';
import 'package:noviindus_project/view/components/bookingcard.dart';
import 'package:noviindus_project/view/components/common_button.dart';
import 'package:noviindus_project/view/components/mytextfiled.dart';
import 'package:noviindus_project/view/pages/treatment_reg.dart';
import 'package:noviindus_project/view_model/patient_vm.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final patientViewModel = Provider.of<PatientViewModel>(context);

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
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                    flex: 3,
                    child: MyTextFiled(
                      name: '',
                      hinttext: 'Search for treatments',
                      prefixIcon: Icon(Icons.search),
                    )),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () => patientViewModel.fetchPatients(),
                    child: Container(
                      height: 40,
                      width: 85,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Text(
                          'Search',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Sort by :', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  value: 'Date',
                  items: ['Date', 'Name'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {},
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: patientViewModel.isLoading
                  ? const Center(child:  CircularProgressIndicator())
                  : patientViewModel.errorMessage.isNotEmpty
                      ? Text(patientViewModel.errorMessage)
                      : ListView.builder(
                          itemCount: patientViewModel.patients.length,
                          itemBuilder: (context, index) {
                            return BookingCard(
                                patient: patientViewModel.patients[index]);
                          },
                        ),
            ),
            CommonButton(
              widget: Text(
                'Register',
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                textAlign: TextAlign.start,
              ),
              color: primary,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TreatmentReg()));
              },
            )
          ],
        ),
      ),
    );
  }
}
