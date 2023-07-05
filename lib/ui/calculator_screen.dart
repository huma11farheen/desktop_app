import 'package:desktop_app/buttons.dart';
import 'package:desktop_app/ui/calculator_state.dart';
import 'package:desktop_app/ui/calculator_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculatorProvider =
    StateNotifierProvider<CalculatorViewModel, CalculatorState>(
  (ref) => CalculatorViewModel(),
);

class CalculatorScreen extends ConsumerStatefulWidget {
  const CalculatorScreen({super.key});

  @override
  ConsumerState<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends ConsumerState<CalculatorScreen> {

  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(calculatorProvider.notifier);
    final state = ref.watch(calculatorProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      state.input,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: Text(
                      state.result,
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Button(
                        buttontapped: () {
                          viewModel.clear();
                        },
                        buttonText: buttons[index],
                      );
                    } else if (index == 1) {
                      return Button(
                        buttonText: buttons[index],
                        buttontapped: () {},
                      );
                    } else if (index == 2) {
                      return Button(
                        buttontapped: () {
                          viewModel.updateInput(buttons[index]);
                        },
                        buttonText: buttons[index],
                      );
                    } else if (index == 3) {
                      return Button(
                        buttontapped: () {
                          viewModel.delete();
                        },
                        buttonText: buttons[index],
                      );
                    } else if (index == 18) {
                      return Button(
                        buttontapped: () {
                          viewModel.equalPressed();
                        },
                        buttonText: buttons[index],
                        buttonColor: Colors.orange,
                        textColor: Colors.white,
                      );
                    } else {
                      return Button(
                        buttontapped: () {
                          viewModel.updateInput(buttons[index]);
                        },
                        buttonText: buttons[index],
                        buttonColor: isOperator(buttons[index])
                            ? Colors.orange
                            : Colors.white30.withOpacity(0.3),
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.black,
                      );
                    }
                  }), // GridView.builder
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
}
