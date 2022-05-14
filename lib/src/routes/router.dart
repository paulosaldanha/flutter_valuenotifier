import 'package:flutter/material.dart';
import 'package:hello/src/models/employee.dart';
import 'package:hello/src/models/holiday.dart';
import 'package:hello/src/models/work_day.dart';
import 'package:hello/src/screens/holiday/holiday_form_widget.dart';
import 'package:hello/src/screens/holiday/holiday_list_widget.dart';

import 'routing_constants.dart';

RouteFactory rotas() {
  return (settings) {
      Object? obj = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case HomeViewRoute:
          screen = HolidayListWidget();
          break;
        case HolidayListViewRoute:
          screen = HolidayListWidget();
          break;
        case HolidayFormViewRoute:
          print(obj);
          obj = obj as Holiday;
          screen = HolidayFormWidget(holiday: obj);
          break;
        case EmployeeListViewRoute:
          screen = HolidayListWidget();
          break;
        /*case EmployeeFormViewRoute:
          obj = obj as Employee;
          //screen = EstadoForm(estado:obj);
          break;*/
        case WorkDayListViewRoute:
          screen = HolidayListWidget();
          break;
        /*case WorkDayFormViewRoute:
          obj = obj as WorkDay;
          //screen = EstadoForm(estado:obj);
          break;*/
        default:
          screen = HolidayListWidget();
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}