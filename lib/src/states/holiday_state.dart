import 'package:hello/src/models/holiday.dart';

abstract class HolidayState {}

class InitialHolidayState extends HolidayState{}

class SuccessHolidayState extends HolidayState{
  final List<Holiday> holidays;
  SuccessHolidayState(this.holidays);
}

class ErrorHolidayState extends HolidayState{
  final String message;
  ErrorHolidayState(this.message);
}

class LoadingHolidayState extends HolidayState{}