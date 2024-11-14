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
    final patientViewModel = Provider.of<PatientProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration:
                     const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),
              ),
            ],
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => patientViewModel.loadPatients(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Flexible(
                      flex: 3,
                      child: MyTextFiled(
                        visible: false,
                        name: '',
                        hinttext: 'Search for treatments',
                        prefixIcon: Icon(Icons.search),
                      )),
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () => patientViewModel.loadPatients(),
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
                  SizedBox(
                    height: 40,
                    width: 90,
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
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
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: patientViewModel.isLoading
                    ? const Center(
                        child: Center(
                            child: CircularProgressIndicator(
                        color: primary,
                      )))
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
                widget: const Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  textAlign: TextAlign.start,
                ),
                color: primary,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TreatmentReg()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
