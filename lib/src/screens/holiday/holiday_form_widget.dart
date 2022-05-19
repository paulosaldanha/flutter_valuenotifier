import 'package:another_flushbar/flushbar.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hello/src/controller/holiday_controller.dart';
import 'package:hello/src/models/holiday.dart';
import 'package:hello/src/service/holiday_service.dart';
import 'package:hello/src/states/holiday_state.dart';

class HolidayFormWidget extends StatelessWidget {
  //constructor
  HolidayFormWidget({Key? key, required this.holiday}):super(key:key);

  final Holiday holiday;
  final holidayController = GetIt.I.get<HolidayController>();
  
   //definição do textformfield
  _textField({String? labelText, onChanged, required String? Function() errorText,String? initalValue}){
    return TextFormField(
      onChanged: onChanged,
      initialValue: initalValue,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
  
      holidayController.holiday = holiday;
      holidayController.carregaHoliday();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Feriado'),
      ),
      body: ValueListenableBuilder(
        valueListenable: holidayController,
        builder: (_,state,child) {
          
          if(state is LoadingHolidayState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is ErrorHolidayState){
            return Center(child: Text(state.message),);
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child:SingleChildScrollView(
              child: Column(
                children: <Widget>[
                      /*_textField(
                        labelText: "Nome",
                        onChanged: holidayController.holiday.name,
                        errorText: holidayController.validateName,
                        initalValue: holidayController.holiday.name
                      ),*/
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Nome do feriado",
                          labelText: "Nome:"
                        ),
                        initialValue: holidayController.holiday.name,
                        onChanged: (String value) {
                          holidayController.holiday.name = value;
                        },
                        validator: (value) {
                          holidayController.validateName();
                        },
                      ),
                  const SizedBox(
                    height: 18,
                  ),
                      /*_textField(
                        labelText: "Dia",
                        onChanged: holidayController.holiday.day,
                        errorText: holidayController.validateDate,
                        initalValue: holidayController.holiday.day
                      ),*/
                    DateTimeFormField(
                        decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'Dia',
                        ),
                        initialValue: holidayController.holiday.day,
                        initialDate: holidayController.holiday.day,
                        mode: DateTimeFieldPickerMode.date,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (e) {
                          holidayController.validateDate();
                        },
                        onDateSelected: (DateTime date) {
                          holidayController.holiday.day = date;
                        },
                    ),
                  const SizedBox(
                    height: 18,
                  ),
                      ElevatedButton(
                              onPressed: () {
                                //if(holidayController.isValid){
                                  holidayController.addItem(holidayController.holiday);
                                  if(state is SuccessHolidayState){
                                    holidayController.carregaHoliday();
                                    Navigator.pop(context);
                                    Flushbar(
                                      title: "Sucesso",
                                      message: "Operação realizada com sucesso!",
                                      duration: const Duration(seconds: 2),
                                    ).show(context);
                                  }
                                //}
                              },
                              child: const Text("Salvar"),
                            ) 
                ],
              ),
            ), 
          );
        },),
    );
  }
}