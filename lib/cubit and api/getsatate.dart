import 'package:test/cubit%20and%20api/model.dart';

abstract class InitialSatate {}

class LoadingSatate extends InitialSatate {}

class LoadedSatate extends InitialSatate {
  List<Apimodel> data;
  LoadedSatate(this.data);
}

class ErrorSatate extends InitialSatate {
  final String error;
  ErrorSatate(this.error);
}
