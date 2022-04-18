import 'package:flutter/material.dart';

Future<DateTime?> p_date_picker(
  BuildContext context, {
  DateTime? init,
  Function(DateTime picked)? onSelect,
  Function()? onCancel,
}) async {
  DateTime? date = await showDatePicker(
    context: context,
    initialDate: init == null ? DateTime.now() : init,
    firstDate: DateTime(1990),
    lastDate: DateTime(2500),
  );

  if (date == null) {
    if (onCancel != null) {
      onCancel();
    }
    return date;
  } else if (onSelect != null) {
    onSelect(date);
  }
  return date;
}

Future<TimeOfDay?> p_time_picker(
  BuildContext context, {
  TimeOfDay? init,
  Function()? onCancel,
  Function(TimeOfDay picked)? onSelect,
}) async {
  TimeOfDay? time = await showTimePicker(
    context: context,
    initialTime: init == null ? TimeOfDay.now() : init,
  );
  if (time == null) {
    if (onCancel != null) {
      onCancel();
    }
    return time;
  } else if (onSelect != null) {
    onSelect(time);
  }
  return time;
}
