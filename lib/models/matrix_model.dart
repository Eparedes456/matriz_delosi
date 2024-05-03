
import 'package:flutter/material.dart';
import 'package:matriz_delosi/exception/matrix_exception.dart';

class MatrixModel {
  static const _maxLengthN = 5;
  final List<List<int>> listValues;

  MatrixModel({
    required this.listValues
  });

  
  static _isValidInputText({required String value}){
    final RegExp regExp = RegExp(r'^\[\[(\d+(,\d+)*)\](,\[(\d+(,\d+)*)\])*\]$');
    return regExp.hasMatch(value);
  }

  static int? _calculateMatrix(int totalItems){
    if(totalItems  == 4){
      return 2;
    }

    for (int i = 2; i * i <= totalItems; i++) {
      if (totalItems % i == 0) {
        int otherFactor = totalItems ~/ i;
        if (otherFactor >= 2 && otherFactor <= _maxLengthN) {
          return otherFactor;
        }
      }
    }

    return null;
  }

  static MatrixModel generar({required String inputTextValue}){
    if(_isValidInputText(value: inputTextValue) == false){
      throw MatrixCreationExcep(
        'Formato inválido'
      );
    }
    final String cleanText = inputTextValue.replaceAll('[', '').replaceAll(']', '');
    final List<String> totalItems = cleanText.split(',');

    final int? totalNNMatrix = _calculateMatrix(totalItems.length);
    if(totalNNMatrix == null){
      throw  MatrixCreationExcep(
        'No se pudo calcular de cuánto por cuánto iba a ser la matriz.'
      );
    }
    List<List<int>> matrix = List.generate(totalNNMatrix, (_) => List<int>.filled(totalNNMatrix, 0));
   
    for (int i = 0; i < totalNNMatrix; i++) {
      for (int j = 0; j < totalNNMatrix; j++) {
        if(totalItems.length == i * totalNNMatrix + j){
          throw  MatrixCreationExcep(
            'No se pudo calcular de cuánto por cuánto iba a ser la matriz.'
          );
        }else{
          matrix[i][j] = int.parse(totalItems[i * totalNNMatrix + j]);
        }
       
      }
    }

    return MatrixModel(listValues: matrix);

  }


}