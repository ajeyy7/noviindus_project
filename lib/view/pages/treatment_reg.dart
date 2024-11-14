import 'package:flutter/material.dart';
import 'package:noviindus_project/constants/colors.dart';
import 'package:noviindus_project/helper/pdf_helper.dart';
import 'package:noviindus_project/view/components/addtreatment_dilaogue.dart';
import 'package:noviindus_project/view/components/common_button.dart';
import 'package:noviindus_project/view/components/datetime_picker.dart';
import 'package:noviindus_project/view/components/mytextfiled.dart';
import 'package:noviindus_project/view/components/paymentoption.dart';
import 'package:noviindus_project/view_model/branch_vm.dart';
import 'package:noviindus_project/view_model/dialoguebox_vm.dart';
import 'package:noviindus_project/view_model/treatmentregister_vm.dart';
import 'package:provider/provider.dart';

class TreatmentReg extends StatelessWidget {
  const TreatmentReg({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController whatsappController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController totalAmountController = TextEditingController();
    final TextEditingController discountAmountController =
        TextEditingController();
    final TextEditingController advanceAmountController =
        TextEditingController();
    final TextEditingController balanceAmountController =
        TextEditingController();
    final TextEditingController treatmentDateController =
        TextEditingController();
    String selectedBranch = '';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Badge(
            label: const Text(''),
            child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextFiled(
                name: 'Name',
                hinttext: 'Enter your full name',
                controller: nameController,
              ),
              MyTextFiled(
                  controller: whatsappController,
                  name: 'Whatsapp Number',
                  hinttext: 'Enter your Whatsapp number'),
              MyTextFiled(
                  controller: addressController,
                  name: 'Address',
                  hinttext: 'Enter your full address'),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Consumer<BranchViewModel>(
                    builder: (context, branchViewModel, _) {
                  final isLoading = branchViewModel.isLoading;
                  final branches = branchViewModel.branches;
                  final errorMessage = branchViewModel.errorMessage;
                  return Column(
                    children: [
                      DropdownButtonFormField<String>(
                        icon: const Icon(Icons.keyboard_arrow_down),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: grey,
                          labelText: 'Location',
                          labelStyle: const TextStyle(fontSize: 14),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        items: ['Malapuram', 'Kozhikode', 'Palakkad', 'Kochi']
                            .map((String treatment) => DropdownMenuItem<String>(
                                value: treatment, child: Text(treatment)))
                            .toList(),
                        onChanged: (String? value) {},
                      ),
                      const SizedBox(height: 20),
                      isLoading
                          ? const CircularProgressIndicator()
                          : errorMessage != null
                              ? Text(
                                  errorMessage,
                                  style: const TextStyle(color: Colors.red),
                                )
                              : DropdownButtonFormField<int>(
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: branches
                                      .map(
                                        (branch) => DropdownMenuItem<int>(
                                          value: branch.id,
                                          child: Text(branch.name),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (int? selectedBranchId) {
                                    if (selectedBranchId != null) {
                                      selectedBranch =
                                          selectedBranchId.toString();
                                      print(
                                          'Selected Branch ID: $selectedBranchId');
                                    }
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: grey,
                                    labelText: 'Branch',
                                    labelStyle: const TextStyle(fontSize: 14),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                      const SizedBox(height: 20),
                    ],
                  );
                }),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Consumer<DialogueBoxVm>(builder: (context, vm, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                    Text(
                                      vm.treatmentName?.isNotEmpty == true
                                          ? vm.treatmentName!
                                          : '1. Couple Combo package ...',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 20),
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
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Center(
                                                    child: Text(vm.maleCount
                                                        .toString()))),
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
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Center(
                                                    child: Text(vm.femaleCount
                                                        .toString()))),
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
                                  icon: const Icon(Icons.cancel,
                                      color: Colors.red),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.green),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            const AddTreatmentDialogue());
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CommonButton(
                          widget: const Text('+Add Treatment'),
                          color: Colors.green.shade200,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    const AddTreatmentDialogue());
                          }),
                    ],
                  );
                }),
              ),
              const SizedBox(height: 20),
              MyTextFiled(
                name: 'Total Amount',
                hinttext: '',
                controller: totalAmountController,
              ),
              MyTextFiled(
                name: 'Discount Amount',
                hinttext: '',
                controller: discountAmountController,
              ),
              const PaymentOptionWidget(),
              MyTextFiled(
                name: 'Advance Amount',
                hinttext: '',
                controller: advanceAmountController,
              ),
              MyTextFiled(
                name: 'Balance Amount',
                hinttext: '',
                controller: balanceAmountController,
              ),
              const TreatmentDatePicker(
                label: 'Treatment Date',
              ),
              const TreatmentTimePicker(),
              const SizedBox(height: 20),
              CommonButton(
                onTap: () {
                  final treatmentRegisterVM =
                      Provider.of<TreatmentRegisterVM>(context, listen: false);
                  if (treatmentRegisterVM.selectedPaymentOption.isEmpty ||
                      treatmentRegisterVM.selectedHour.isEmpty ||
                      treatmentRegisterVM.selectedMinute.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Please fill in all the fields'),
                      ),
                    );
                    return;
                  }
                  treatmentRegisterVM.registerPatient(
                    name: nameController.text,
                    payment: treatmentRegisterVM.selectedPaymentOption,
                    excecutive: "Executive Name",
                    phone: whatsappController.text,
                    address: addressController.text,
                    totalAmount: totalAmountController.text,
                    discountAmount: discountAmountController.text,
                    advanceAmount: advanceAmountController.text,
                    balanceAmount: balanceAmountController.text,
                    dateNdTime: '01/02/2024-10:24 AM',
                    id: "",
                    male: Provider.of<DialogueBoxVm>(context, listen: false)
                        .maleCount
                        .toString(),
                    female: Provider.of<DialogueBoxVm>(context, listen: false)
                        .femaleCount
                        .toString(),
                    branch: selectedBranch,
                    treatments:
                        Provider.of<DialogueBoxVm>(context, listen: false)
                                .selectedTreatmentId
                                .toString() ??
                            '',
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        backgroundColor: primary,
                        content: Text('Treatment saved successfully!')),
                  );
                  generatePdf(context);
                },
                widget: const Text(
                  'Save',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
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
