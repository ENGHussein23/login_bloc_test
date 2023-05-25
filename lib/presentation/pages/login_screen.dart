import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_test/business_logic/constants/colors.dart';
import 'package:login_bloc_test/presentation/pages/second_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:login_bloc_test/business_logic/cubit/auth_cubit.dart';
class Login_page extends StatelessWidget {
  final _OutlineInputBorder=OutlineInputBorder(
    borderSide:  BorderSide(color: button_color,width: 2),
    borderRadius: BorderRadius.circular(12),
  );
  final _EnapleOutlineInputBorder=OutlineInputBorder(
    borderSide:  const BorderSide(color: Colors.transparent,width: 2),
    borderRadius: BorderRadius.circular(12),
  );
  TextEditingController PasswordController=TextEditingController();
  TextEditingController UserEmailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final heightMax = MediaQuery.of(context).size.height;
    final widthMax = MediaQuery.of(context).size.width;

    return Scaffold(
      body:BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
          child: Builder(
              builder: (context) =>Container(
                padding: const EdgeInsets.all(15),
                height: heightMax,
                width: widthMax,
                color: background_color,
                child: ListView(
                  children:  [
                    const SizedBox(height: 70,),
                    const Image(image: AssetImage("assets/images/Welcome.png"),
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10,),
                    const Center(child: Text("Please Login To Your Account",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),),
                    const SizedBox(height: 10,),
                    const Text("User name / Email",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                    const SizedBox(height: 5,),
                    TextFormField(
                      controller: UserEmailController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelStyle: const TextStyle(color: Colors.white),
                        hintStyle: const TextStyle(color: Colors.white),
                        enabledBorder:_EnapleOutlineInputBorder,
                        focusedBorder:_OutlineInputBorder,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text("Password",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                    const SizedBox(height: 5,),
                    TextFormField(
                      controller: PasswordController,
                      obscureText: !AuthCubit.get(context).isPasswordVisible,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: const TextStyle(color: Colors.white),
                          hintStyle: const TextStyle(color: Colors.white),
                          enabledBorder:_EnapleOutlineInputBorder,
                          focusedBorder:_OutlineInputBorder,
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (AuthCubit.get(context).isPasswordVisible) {
                                AuthCubit.get(context).hidePassword();
                              } else {
                                AuthCubit.get(context).showPassword();
                              }
                            },
                            icon: Icon(AuthCubit.get(context).isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off)
                      ),
                    ),),
                     SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: (){
                      AuthCubit.get(context).login(context, UserEmailController.text, PasswordController.text);
                    },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromWidth(200),
                        elevation: 0,
                        backgroundColor: button_color,
                        minimumSize: const Size(88, 56),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                        ),
                      ), child:  Text("Login",
                        style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),
                      ),
                    )

                  ],
                ),
              )
          )
      )

    );
  }
}
