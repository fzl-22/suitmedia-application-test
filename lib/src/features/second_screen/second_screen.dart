import 'package:flutter/material.dart';
import 'package:suitmedia_application_test/src/features/common/widgets/action_button.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: const Text("Second Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Welcome"),
            Text(
              name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Selected User Name",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ),
            ActionButton(
              onPressed: () {},
              text: "Choose a User",
            ),
          ],
        ),
      ),
    );
  }
}
