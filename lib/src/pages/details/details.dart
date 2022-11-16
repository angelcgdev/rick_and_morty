import 'package:flutter/material.dart';
import 'package:helloworld/src/models/characters.model.dart';
import 'package:helloworld/src/utils/capitalize_all.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.avatar}) : super(key: key);

  final Result avatar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(avatar.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(
                avatar.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('About',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(capitalizeAllWords("status - ${avatar.status.name}"),
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 10),
                  Text(capitalizeAllWords("species - ${avatar.species.name}")),
                  const SizedBox(height: 10),
                  Text(capitalizeAllWords("gender - ${avatar.gender.name}")),
                  const SizedBox(height: 10),
                  const Divider(),
                  const Text('More Details',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(capitalizeAllWords("Origin - ${avatar.origin.name}")),
                  const SizedBox(height: 10),
                  Text(
                      capitalizeAllWords("Location - ${avatar.location.name}")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
