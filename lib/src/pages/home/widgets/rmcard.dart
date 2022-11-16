import 'package:flutter/material.dart';
import 'package:helloworld/src/models/characters.model.dart' as ch;

class RMCard extends StatelessWidget {
  const RMCard({Key? key, required this.avatar, this.onTap}) : super(key: key);
  final ch.Result avatar;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        // padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: Image.network(
              avatar.image,
              width: double.maxFinite,
              height: double.maxFinite,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress?.expectedTotalBytes !=
                    loadingProgress?.cumulativeBytesLoaded) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return child;
              },
              fit: BoxFit.cover,
            )),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(avatar.name, overflow: TextOverflow.ellipsis),
                      Text(avatar.gender.name, overflow: TextOverflow.ellipsis),
                      Text(avatar.origin.name, overflow: TextOverflow.ellipsis),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
