import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noviindus_project/view_model/treatmentregister_vm.dart';
import 'package:provider/provider.dart';

class TreatmentTimePicker extends StatelessWidget {
  const TreatmentTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Treatment Time',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Consumer<TreatmentRegisterVM>(
                  builder: (context, vm, _) {
                    return DropdownButtonFormField<String>(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Hour',
                        labelStyle: const TextStyle(fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      value:
                          vm.selectedHour.isNotEmpty ? vm.selectedHour : null,
                      items: List.generate(24, (index) => index.toString())
                          .map((String hour) => DropdownMenuItem<String>(
                              value: hour, child: Text(hour)))
                          .toList(),
                      onChanged: (String? value) {
                        if (value != null) {
                          vm.updateSelectedHour(value);
                        }
                      },
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Consumer<TreatmentRegisterVM>(
                  builder: (context, vm, _) {
                    return DropdownButtonFormField<String>(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Minute',
                        labelStyle: const TextStyle(fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      value: vm.selectedMinute.isNotEmpty
                          ? vm.selectedMinute
                          : null,
                      items: List.generate(60, (index) => index.toString())
                          .map((String minute) => DropdownMenuItem<String>(
                              value: minute, child: Text(minute)))
                          .toList(),
                      onChanged: (String? value) {
                        if (value != null) {
                          vm.updateSelectedMinute(value);
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TreatmentDatePicker extends StatelessWidget {
  final String label;

  const TreatmentDatePicker({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final treatmentRegisterVM = Provider.of<TreatmentRegisterVM>(context);

    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
        bottom: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                final formattedDate =
                    DateFormat('dd/MM/yyyy').format(pickedDate);
                treatmentRegisterVM.updateSelectedDate(formattedDate);
              }
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              alignment: Alignment.centerLeft,
              child: Text(
                treatmentRegisterVM.selectedDate.isEmpty
                    ? 'DD/MM/YYYY'
                    : treatmentRegisterVM.selectedDate,
                style: TextStyle(
                  color: treatmentRegisterVM.selectedDate.isEmpty
                      ? Colors.grey
                      : Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
