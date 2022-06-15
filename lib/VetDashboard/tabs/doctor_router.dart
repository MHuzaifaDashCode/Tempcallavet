import 'package:flutter/material.dart';
import 'package:tempcallavet/VetDashboard/manage_appointment.dart';
import 'package:tempcallavet/VetDashboard/tabs/doctor_detail.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => ManageAppointment(),
  '/detail': (context) => SliverDoctorDetail(),
};
