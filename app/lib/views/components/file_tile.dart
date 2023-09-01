import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FileTile extends StatelessWidget {
  const FileTile({
    super.key,
    required this.ref
  });

  final Reference ref;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Theme.of(context).colorScheme.secondaryContainer,
                child: InkWell(
                  onTap: (){
                    ref.getDownloadURL().then((value) => launchUrlString(value));
                  },
                  child: Center(
                    child: Icon(
                      Icons.image, 
                      color: Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.3), 
                      size: 38
                    )
                  )
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                ref.name,
                maxLines: 1,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}