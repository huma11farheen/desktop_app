import 'package:desktop_app/ui/calculator_state.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorViewModel extends StateNotifier<CalculatorState> {
  CalculatorViewModel() : super(CalculatorState());

  void clear() {
    state = CalculatorState(input: '', result: '0');
  }

  void equalPressed() {
    String finaluserinput = state.input;
    finaluserinput = state.input.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    final answer = eval.toString();
    state = CalculatorState(input: finaluserinput, result: answer);
  }

  void updateInput(String operation) {
    var input = state.input;
    input += operation;
    state = CalculatorState(input: input, result: state.result);
  }

  void delete() {
    var input = state.input;
    final finalInput = input.substring(0, input.length - 1);

    state = CalculatorState(input: finalInput, result: state.result);
  }
}
