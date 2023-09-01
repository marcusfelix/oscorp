import 'package:app/includes/dictionary.dart';
import 'package:app/views/components/large_button.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Onboard extends StatefulWidget {
  const Onboard({
    super.key,
  });

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final TextEditingController code = TextEditingController();
  bool working = false;
  String? error;

  Future submit() async {
    setState(() {
      working = true;
      error = null;
    });
    try {
      // Call cloud function to onboard user
      HttpsCallable call = FirebaseFunctions.instance.httpsCallable('onboardUserWithAccessCode');
      await call({
        "accessCode": code.text,
        "name": FirebaseAuth.instance.currentUser!.displayName,
      });
    } on FirebaseFunctionsException catch (e) {
      print(e);
      setState(() => error = e.message);
    } finally {
      setState(() => working = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate("onboard_string"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            }, 
            icon: const Icon(
              Icons.logout_outlined
            )
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 42),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                shape: BoxShape.circle
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  working ? const CircularProgressIndicator(
                    strokeWidth: 3,
                  ) : Container(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Icon(
                      error != null ? Icons.close_outlined : Icons.home_outlined,
                      size: 38,
                      color: Theme.of(context).colorScheme.onPrimaryContainer
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              translate("onboard_title_string"),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 16),
            Text(
              translate("onboard_description_string"),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.5)
              ),
            ),
            const SizedBox(height: 42),
            SizedBox(
              width: 160,
              child: TextFormField(
                controller: code,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  hintText: translate("onboard_hint_string"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
                maxLength: 6,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 6
                ),
                onFieldSubmitted: (_) => submit(),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: error != null ? Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8)
                ),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Text(
                  error ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.error
                  ),
                ),
              ) : Container()
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, MediaQuery.of(context).viewPadding.bottom + 16),
        child: LargeButton(
          onPressed: () => submit(),
          label: translate("submit_string"),
        ),
      ),
    );
  }
}