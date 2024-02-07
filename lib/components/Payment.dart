import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BuyNowPage extends StatefulWidget {
  //final String productId;
  //final String productName;
 // final double productPrice;
//  final String productImageUrl; // Add this line



  @override
  _BuyNowPageState createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  String selectedPaymentSystem = "COD";
  final _formKey = GlobalKey<FormState>();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController _productNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buy Now',
         ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Container(

          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(54.1),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    Text(
                      'Payment Information',
                      //style: GoogleFonts.bebasNeue(fontSize: 40, color: Colors.amber),
                    ),
                    SizedBox(height: 70),
                    DropdownButton<String>(
                      value: selectedPaymentSystem,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedPaymentSystem = newValue!;
                        });
                      },
                      items: <String>['COD', 'BKASH', 'NAGAD', 'ROCKET', 'Card']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(color: Colors.grey)),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    _buildCardFields(),
                    _buildPhoneNumberField(),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _proceedToPayment();
                        }
                      },
                      child: Text(
                        'Proceed to Payment',
                        style: TextStyle(fontSize: 20,color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Selected Payment System: $selectedPaymentSystem',
                    //  style: GoogleFonts.bebasNeue(color: Colors.blue,fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardFields() {
    return Center(
      child: Column(
        children: [
          if (selectedPaymentSystem == 'Card') ...[
            TextFormField(
              controller: cardNumberController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Card Number',
               // labelStyle: GoogleFonts.bebasNeue(color: Colors.white,fontSize: 24),
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length != 16) {
                  return 'Enter a valid 16-digit card number.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: expirationDateController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Expiration Date (MM/YYYY)',
                //labelStyle: GoogleFonts.bebasNeue(color: Colors.black,fontSize: 24),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a valid expiration date.';
                }
                RegExp regExp = RegExp(r'^\d{2}/\d{4}$');
                if (!regExp.hasMatch(value)) {
                  return 'Enter a valid expiration date (MM/YYYY).';
                }
                List<String> parts = value.split('/');
                int month = int.tryParse(parts[0] ?? '') ?? 0;
                int year = int.tryParse(parts[1] ?? '') ?? 0;
                if (month < 1 || month > 12) {
                  return 'Invalid month. Enter a value between 1 and 12.';
                }
                if (year < 2024 || year > 2034) {
                  return 'Invalid year. Enter a value between 2024 and 2034.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: cvvController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'CVV',
              //  labelStyle: GoogleFonts.bebasNeue(color: Colors.white,fontSize: 24),
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length != 3) {
                  return 'Enter a valid 3-digit CVV.';
                }
                return null;
              },
            ),
          ],
          TextFormField(
            controller: addressController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              labelText: 'Home Address',
              //labelStyle: GoogleFonts.bebasNeue(color: Colors.white,fontSize: 24),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your home address.';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    if (['BKASH', 'NAGAD', 'ROCKET'].contains(selectedPaymentSystem)) {
      return TextFormField(
        controller: phoneNumberController,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: 'Phone Number',
        //  labelStyle: GoogleFonts.bebasNeue(color: Colors.white,fontSize: 24),
        ),
        validator: (value) {
          if (value == null || value.isEmpty || value.length != 11) {
            return 'Enter a valid 11-digit phone number.';
          }
          List<String> allowedPrefixes = ['017', '016', '019', '018', '015', '013'];
          if (!allowedPrefixes.any((prefix) => value.startsWith(prefix))) {
            return 'Enter valid phone number.';
          }
          return null;
        },
      );
    } else {
      return SizedBox();
    }
  }

  void _proceedToPayment() async {
    bool paymentSuccessful = true;

    if (paymentSuccessful) {
      //await saveProductInfoToFirebase();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'Payment successful',
              style: TextStyle(color: Colors.black),
            ),
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

 }
