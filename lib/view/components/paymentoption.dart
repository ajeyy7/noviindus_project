import 'package:flutter/material.dart';
import 'package:noviindus_project/view_model/treatmentregister_vm.dart';
import 'package:provider/provider.dart';

class PaymentOptionWidget extends StatelessWidget {
  const PaymentOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Consumer<TreatmentRegisterVM>(
        builder: (context, vm, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Payment Option'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: 'Cash',
                    groupValue: vm.selectedPaymentOption,
                    onChanged: (String? value) {
                      if (value != null) {
                        vm.updatePaymentOption(value);
                      }
                    },
                  ),
                  const Text('Cash'),
                  Radio(
                    value: 'Card',
                    groupValue: vm.selectedPaymentOption,
                    onChanged: (String? value) {
                      if (value != null) {
                        vm.updatePaymentOption(value);
                      }
                    },
                  ),
                  const Text('Card'),
                  Radio(
                    value: 'UPI',
                    groupValue: vm.selectedPaymentOption,
                    onChanged: (String? value) {
                      if (value != null) {
                        vm.updatePaymentOption(value);
                      }
                    },
                  ),
                  const Text('UPI'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
