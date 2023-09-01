import 'package:app/includes/dictionary.dart';
import 'package:app/views/components/create_account.dart';
import 'package:app/views/components/large_button.dart';
import 'package:app/views/components/login_with_email.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          translate("welcome_string"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer
          ),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimaryContainer
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 32, 16, MediaQuery.of(context).viewPadding.bottom + 32),
            child: Column(
              children: ([]).map<Widget>((e) => Column(
                children: [
                  LargeButton(
                    label: "",
                    onPressed: () {}
                  ),
                  const SizedBox(height: 16),
                ],
              )).toList()..addAll([
                LargeButton(
                  label: "Login with e-mail",
                  onPressed: () {
                    showModalBottomSheet(
                      context: context, 
                      isScrollControlled: true,
                      builder: (context) => Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        margin: MediaQuery.of(context).viewInsets,
                        child: const LoginWithEmail()
                      )
                    );
                  }
                ),
                const SizedBox(height: 16),
                LargeButton(
                  label: "Create account",
                  onPressed: () {
                    showModalBottomSheet(
                      context: context, 
                      isScrollControlled: true,
                      builder: (context) => Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        margin: MediaQuery.of(context).viewInsets,
                        child: const CreateAccount()
                      )
                    );
                  }
                )
              ]),
            )
          ),
        ],
      ),
    );
  }
}
