
class MatrixCreationExcep implements Exception{

  final String message;

  MatrixCreationExcep(
     this.message
  );

  @override
  String toString() {
    return '$message';
  }
}