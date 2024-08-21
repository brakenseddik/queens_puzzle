import 'package:flutter/material.dart';

final buttonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Colors.deepPurpleAccent),
    fixedSize: WidgetStateProperty.all(const Size(300, 50)));

const successMessage = 'Congratulations 🎉🎊 You solved the puzzle!!!';
const failureMessage = 'Sorry, you did not solve the puzzle 😢';

const numberOfQueens = 8;
