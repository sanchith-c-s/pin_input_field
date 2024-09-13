
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String validPin = "1234";

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI(){
    return SafeArea(
      child:SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                _headingText(),
                SizedBox(
                  height: 20,
                ),
                _subheadingText(),
                SizedBox(
                  height: 20,
                ),
                _numberText(),
              ],
            ),
            _pinInputForm(),
            _resendCodeLink(),
          ],
        ),
        ) 
      );
  }

  Widget _headingText(){
    return const Text(
      "Verfication",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 25
      ),
    );
  }

  Widget _subheadingText(){
    return const Text(
      "Enter the code sent to the number",
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: Colors.black38
      ),
    );
  }

  Widget _numberText(){
    return const Text(
      "+91 99 44 333 955",
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
    );
  }

  Widget _resendCodeLink(){
    return Text(
      "Didn't get the code.\nResend Code?",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w200,
        fontSize: 15,
      ),
    );
  }

  Widget _pinInputForm(){
    return Form(
      key: formKey,
      child: Column(
      children: [
        Pinput(
          validator: (value){
            return value == validPin ? null : "Pin is incorrect";
          },
          onCompleted: (pin){
            print(
              'Success: $pin',
            );
          },
          errorBuilder: (errorText,pin){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(errorText ?? "",
                style: TextStyle(
                  color: Colors.red
                ),
                ),
              ),
              );
          },
        ),
        TextButton(onPressed: (){
          formKey.currentState!.validate();
        },
         child: Text('Validate')
         ),
      ],
    ));
  }
}