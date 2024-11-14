import 'package:flutter/material.dart';
import 'package:noviindus_project/constants/colors.dart';
import 'package:noviindus_project/view/components/common_button.dart';
import 'package:noviindus_project/view_model/dialoguebox_vm.dart';
import 'package:provider/provider.dart';

class AddTreatmentDialogue extends StatelessWidget {
  const AddTreatmentDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DialogueBoxVm>(builder: (context, viewModel, child) {
      if (viewModel.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (viewModel.errorMessage != null) {
        return Text(viewModel.errorMessage ?? "Error fetching treatments");
      }
      return AlertDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Choose Treatment'),
            DropdownButtonFormField<int>(
              icon: const Icon(Icons.keyboard_arrow_down),
              decoration: InputDecoration(
                filled: true,
                fillColor: grey,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: viewModel.treatments
                  .map((treatment) => DropdownMenuItem<int>(
                      value: treatment.id, child: Text(treatment.name)))
                  .toList(),
              onChanged: (int? selectedId) {
                if (selectedId != null) {
                  viewModel.setSelectedTreatment(selectedId);
                  var selectedTreatment = viewModel.treatments
                      .firstWhere((treatment) => treatment.id == selectedId);
                  viewModel.setTreatmentName(selectedTreatment.name);
                  print("Selected treatment ID: $selectedId");
                }
              },
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
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(child: Text('Male'))),
                        const SizedBox(height: 30),
                        Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(child: Text('Female'))),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                viewModel
                                    .updateMaleCount(viewModel.maleCount - 1);
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    color: primary, shape: BoxShape.circle),
                                child: const Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                  height: 30,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                      child: Text(
                                          viewModel.maleCount.toString()))),
                            ),
                            InkWell(
                              onTap: () {
                                viewModel
                                    .updateMaleCount(viewModel.maleCount + 1);
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    color: primary, shape: BoxShape.circle),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                viewModel.updateFemaleCount(
                                    viewModel.femaleCount - 1);
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    color: primary, shape: BoxShape.circle),
                                child: const Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                  height: 30,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                      child: Text(
                                          viewModel.femaleCount.toString()))),
                            ),
                            InkWell(
                              onTap: () {
                                viewModel.updateFemaleCount(
                                    viewModel.femaleCount + 1);
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    color: primary, shape: BoxShape.circle),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
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
        actions: [
          CommonButton(
              onTap: () {
                if (viewModel.selectedTreatmentId != null) {
                  print("Saving treatment: ${viewModel.selectedTreatmentId}");
                  print("Male Count: ${viewModel.maleCount}");
                  print("Female Count: ${viewModel.femaleCount}");

                  Navigator.pop(context);
                }
              },
              widget: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
              color: primary)
        ],
      );
    });
  }
}
