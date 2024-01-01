

import 'package:flutter/material.dart';
import 'package:ridify/screen/rent/rent_taxi.dart';

class ReceiptScreen extends StatelessWidget {
  final String customerName;
  final String carModel;
  final int rentDays;
  final double rentalAmount;
  final DateTime pickupDate;
  final DateTime returnDate;

  ReceiptScreen({
    required this.customerName,
    required this.carModel,
    required this.rentDays,
    required this.rentalAmount,
    required this.pickupDate,
    required this.returnDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderIconRow(),
                SizedBox(height: 16),
                _buildReceiptDetail('Customer Name', customerName),
                _buildReceiptDetail('Car Model', carModel),
                _buildReceiptDetail('Rental Period', '$rentDays days'),
                _buildReceiptDetail('Rental Amount', '\RS${rentalAmount.toStringAsFixed(2)}'),
                _buildReceiptDetail('Pickup Date', '${_formattedDate(pickupDate)}'),
                _buildReceiptDetail('Return Date', '${_formattedDate(returnDate)}'),
                SizedBox(height: 16),
                _buildFinishButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderIconRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.receipt, size: 40, color: Colors.blue),
        Text(
          'Rental Receipt',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 40),
      ],
    );
  }

  Widget _buildReceiptDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Text(value, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildFinishButton() {
    return ElevatedButton(
      onPressed: () {
         
      },
      child: Text('Finish'),
    );
  }

  String _formattedDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}