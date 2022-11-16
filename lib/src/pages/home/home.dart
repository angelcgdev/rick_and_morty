import 'package:flutter/material.dart';
import 'package:helloworld/src/models/characters.model.dart' as Char;
import 'package:helloworld/src/pages/details/details.dart';
import 'package:helloworld/src/pages/home/widgets/rmcard.dart';
import 'package:helloworld/src/services/main.service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Char.Characters? charactes;

  @override
  void initState() {
    callendpoint();
    super.initState();
  }

  void callendpoint() async {
    charactes = await MainService.getCharacters();
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: charactes != null
          ? ListLoaded(
              characters: charactes!,
            )
          : const _LoadingScreen(),
    );
  }
}

class ListLoaded extends StatelessWidget {
  const ListLoaded({Key? key, required this.characters}) : super(key: key);
  final Char.Characters characters;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: characters.results.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.0,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemBuilder: ((context, index) => RMCard(
                    avatar: characters.results[index],
                    onTap: () => nextPage(context, characters.results[index]),
                  ))),
        )
      ],
    );
  }

  nextPage(BuildContext context, Char.Result avatar) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailsPage(avatar: avatar);
    }));
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Align(
          child: CircularProgressIndicator(),
        ),
        SizedBox(height: 10),
        Text('Loading...'),
      ],
    );
  }
}
