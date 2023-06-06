import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
  {'elevation': 6.0, 'label': 'Elevation 6'},
];

class CardsScreen extends StatelessWidget {
  static String name = 'cards';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(title: const Text('Cards')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...cards.map((e) {
                return Card(
                  elevation: e['elevation'],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.more_vert_outlined),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(e['label'])),
                      ],
                    ),
                  ),
                );
              }),
              ...cards.map((e) {
                return Card(
                  elevation: e['elevation'],
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: colors.outline),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.more_vert_outlined),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(e['label'])),
                      ],
                    ),
                  ),
                );
              }),
              ...cards.map((e) {
                return Card(
                  color: colors.surfaceVariant,
                  elevation: e['elevation'],
                  child: InkWell(
                    onTap: () {},
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.more_vert_outlined),
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(e['label'])),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              ...cards.map((e) {
                return Card(
                  clipBehavior: Clip.hardEdge,
                  elevation: e['elevation'],
                  child: Stack(
                    children: [
                      Image.network(
                        'https://picsum.photos/id/${e['elevation'].toInt()}/600/250',
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12))),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert_outlined)),
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            e['label'],
                            style: const TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}
