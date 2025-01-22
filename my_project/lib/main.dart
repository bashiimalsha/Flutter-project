import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({super.key});


 //P R O G R A M M I N G   F U N D A M E N T A L S

  //VARIABLES
  String name = "Bashi Imalsha";
  int age = 100;
  bool isBegginner = true;


  
/*
  BASIC MATH OPERATIONS
  1+1 -> 2, add
  4-1 -> 3, subtract
  2*3 -> 6, multiply
  8/4 -> 2, divide
  9%4 -> 1, remainder
  5++ -> 6, increment by 1
  5-- ->4, decrement by 1

  COMPARISON OPERATORS:
  5==5 -> true, EQUEL TO
  2!=3 -> true, NOT EQUEL TO
  3>2  -> true, GREATER THAN
  2<3  -> false, LESS THAN
  5>=5 -> true, GREATER OR EQUAL TO
  3<=7 -> true, LESS OR EQUAL TO

  LOGICAL OPERATORS:
  AND operator, return true if both sides are true
  isBeginner && ( AGE <18) -> return false

  OR operator, return true if at least one side is true
  isBeginner || ( AGE <18) -> return true

  NOT operator, return true if the operand is false
  !isBeginner -> return false
  */

  /*
C O N T R O L F L O W

if (condition) {
  do something}

if (condition) {
  do something
  }else if(another condition){
  do something else
} 


if (condition) {
  do something
} else {
  do something else
}

switch (expression){
case value:
  break;
  case value:

  break;
  default:
  }


  for( initialiazation; condition; iteration) {
  }

in a for loop,you have to specify the number of times to loop.
If you don't know how many times to loop,you canuse a while to keep looping untill a certain condition is met.

  while (condition) {
  }


  break   -> break out of loop
  continue -> skip this current iteration

*/
  @override
  Widget build(BuildContext context) {
    if(age >= 18){
      print("you are an adult");
    }else {
      print("you are not adult");
    }
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}