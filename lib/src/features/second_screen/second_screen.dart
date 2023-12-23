import 'package:flutter/material.dart';
import 'package:suitmedia_application_test/src/features/common/widgets/action_button.dart';
import 'package:suitmedia_application_test/src/features/common/widgets/custom_appbar.dart';
import 'package:suitmedia_application_test/src/features/third_screen/third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    super.key,
    required this.name,
  });

  final String name;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String? _selectedUserName;

  void submitChooseUser(BuildContext context) async {
    final String? returnedUserName = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ThirdScreen(),
      ),
    );

    if (returnedUserName == null || returnedUserName.isEmpty) {
      return;
    }

    setState(() {
      _selectedUserName = returnedUserName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CenteredAppBar(
        onPressed: () {
          Navigator.of(context).pop();
        },
        title: "Second Screen",
      ),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Welcome"),
            Text(
              widget.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Expanded(
              child: Center(
                child: Text(
                  _selectedUserName ?? "Selected User Name",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ),
            ActionButton(
              onPressed: () {
                submitChooseUser(context);
              },
              text: "Choose a User",
            ),
          ],
        ),
      ),
    );
  }
}
