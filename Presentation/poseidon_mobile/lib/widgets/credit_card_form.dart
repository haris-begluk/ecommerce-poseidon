import 'package:flutter/material.dart';
import 'package:openapi/providers/checkout.dart';
import 'package:openapi/utils/screen_utils.dart';
import 'package:provider/provider.dart';

class CreditCardForm extends StatefulWidget {
  const CreditCardForm({Key? key}) : super(key: key);

  @override
  State<CreditCardForm> createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  bool selected = false;
  String? cardNumber;
  String? cvc;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null &&
        picked != selectedDate &&
        picked.compareTo(DateTime.now()) > 0) {
      setState(() {
        selectedDate = picked;
        selected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var checkout = Provider.of<Checkout>(context, listen: false);

    return SizedBox(
      width: getProportionateScreenWidth(320), // set this
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Card number',
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length != 16) {
                  return 'Please enter correct credit card number';
                } else {
                  setState(() {
                    this.cardNumber = value;
                  });
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'CVC',
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length != 3) {
                  return 'Please enter correct CVC number';
                } else {
                  setState(() {
                    this.cvc = value;
                  });
                }
                return null;
              },
            ),
            Text(
              "${selectedDate.toUtc().month.toString().padLeft(2, '0')}/${selectedDate.toUtc().year.toString().substring(2)}",
            ),
            if (!selected) Text('Please select a valid date'),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: selected
                      ? Text('Date selected')
                      : Text('Select expiration date'),
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 12),
                    minimumSize: Size(
                      getProportionateScreenWidth(20),
                      getProportionateScreenHeight(30),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(2),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && selected) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      checkout.addUserCreditCards(
                          cardNumber!, cvc!, selectedDate);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Saved')),
                      );
                    }
                  },
                  child: const Text('Save'),
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 12),
                    minimumSize: Size(
                      getProportionateScreenWidth(20),
                      getProportionateScreenHeight(30),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(2),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
