import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void encrease() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSizeStyle = TextStyle( fontSize: 30, fontWeight: FontWeight.bold );

    return Scaffold(
      appBar: AppBar( 
        title: const Text( 
          'The best counter app ever!', 
          style: TextStyle( 
            color: Colors.white,
            fontWeight: FontWeight.bold
          )
        ), 
        backgroundColor: Colors.black, 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Clicks: ', style: fontSizeStyle),
            Text('$counter', style: fontSizeStyle)
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey[100],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: CustomFloatingActions(
        increaseFn: encrease,
        descreaseFn: decrease,
        resetFn: reset,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function descreaseFn;
  final Function resetFn;

  const CustomFloatingActions({
    super.key, 
    required this.increaseFn,
    required this.descreaseFn,
    required this.resetFn
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () => descreaseFn(),
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          child: const Icon(Icons.exposure_minus_1),
        ),
    
        FloatingActionButton(
          onPressed: () => increaseFn(),
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          child: const Icon(Icons.exposure_plus_1)
        ),
    
        FloatingActionButton(
          onPressed: () => resetFn(),
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          child: const Icon(Icons.exposure_zero)
        ),
      ],
    );
  }
}
