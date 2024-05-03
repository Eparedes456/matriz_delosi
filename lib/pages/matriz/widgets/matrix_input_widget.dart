import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MatrixInputWidget extends StatelessWidget {
  const MatrixInputWidget({super.key, required this.inputController});

  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: TextField(
            controller: inputController,
            inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9\[\],]'))
              ],
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Ejemplo: [[1,2],[3,4]]'
            ),
          ),
        ),
      ),
    );
  }
}