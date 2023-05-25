import 'package:login_bloc_test/business_logic/constants/strings.dart';
import 'package:login_bloc_test/business_logic/constants/colors.dart';
import 'package:login_bloc_test/data/models/LeaveCount.dart';
import 'package:login_bloc_test/presentation/pages/second_screen.dart';
import 'package:login_bloc_test/data/models/LoginResponse.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:async';
import 'package:login_bloc_test/business_logic/cubit/leave_list_cubit.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  bool isPasswordVisible = false;
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  void showPassword() {
    isPasswordVisible = true;
    emit(AuthPasswordVisibilityChanged());
  }

  void hidePassword() {
    isPasswordVisible = false;
    emit(AuthPasswordVisibilityChanged());
  }
  // Login function using Dio
  Future<void> login(BuildContext context,String username, String password) async {
    emit(AuthLoading());
    try {
      final dialogContext = navigatorKey.currentContext ?? context;
      showDialog(
        context:context ,
          barrierDismissible: false,
          builder: (context) =>  Container(
            height: 150,
            child:Center(
              child:  LoadingAnimationWidget.discreteCircle(
                thirdRingColor: background_color,
                secondRingColor: border_color,
                color: button_color,
                size: 100,
              ),
            ),
          ),  );
      // Call the login API using Dio
      Response response = await Dio().post(
        login_url_post_api,
        data: {'username': username, 'password': password},
      );
      Navigator.pop(dialogContext);
      // Handle the API response
      if (response.statusCode == 200) {
        // Login was successful
        emit(AuthAuthenticated());
        LoginRespnse loginResponse = LoginRespnse.fromJson(response.data);


        // After the login is successful, the api leaves counter is requested and passed to the second screen

        Dio LeaveCountDio=Dio();

        LeaveCountDio.options.headers["Authorization"]="Bearer ${loginResponse.logInData.accessToken}";

        Response LeaveCountResponse = await LeaveCountDio.get(leave_count_get_api+"${loginResponse.logInData.user.employee.id}");

        LeaveCount leaveCount=LeaveCount.fromJson(LeaveCountResponse.data);

        LeaveListCubit leaveListCubit=LeaveListCubit();



        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider<LeaveListCubit>(
              create: (context) => leaveListCubit,
              child: SecondScreen(loginResponse: loginResponse,leaveCount:leaveCount),
            ),
          ),
        );
        // Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(loginResponse: loginResponse,leaveCount:leaveCount),),);
      } else {
        // Login failed
        print("Login failed \n"+response.toString());
        emit(AuthError('Login failed. Please try again.'));
      }
    } catch (e) {
      // Handle any errors that occur
      print(" Handle any errors that occur \n");
      Navigator.pop(context);
      emit(AuthError('An error occurred. Please try again later.'));
    }
  }
}