import 'package:flutter/material.dart';
import 'package:matriz_delosi/models/matrix_model.dart';

class MatrixRotateWidget extends StatelessWidget {
  const MatrixRotateWidget({super.key, required this.matrix});

  final MatrixModel matrix;

  @override
  Widget build(BuildContext context) {
    final int valueLength = matrix.listValues.length;
    return Table(
      border: TableBorder.all(color: Colors.black),
      children: List.generate(
        valueLength, (row) => TableRow(
          children: List.generate(
            valueLength, (col) => TableCell(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    matrix.listValues[row][col].toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            )
          )
        )
      )
      
     
    );
  }
}