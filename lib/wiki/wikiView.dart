import 'package:flutter/material.dart';

class WikiView extends StatefulWidget {
  const WikiView({super.key});

  @override
  State<WikiView> createState() => _WikiViewState();
}

class _WikiViewState extends State<WikiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Wiki"),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline))
          ],
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8),
          child:
          SearchAnchor(
            builder: (context, searchController) {
              return SearchBar(
                controller: searchController,

                onTap: () {},
                onChanged: (s) {},
                trailing: const [Padding(padding: EdgeInsets.only(right: 8),
                    child: Icon(Icons.search))],
              );
            },
            suggestionsBuilder: (context, searchController) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        searchController.closeView(item);
                      });
                    });
              });
            },
          )),
          Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8),
              child: ListView.separated(
            itemCount: 10,
            itemBuilder: (BuildContext ctx, int index) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                height: 50,
              );
            },
            separatorBuilder: (ctx, index) => const Divider(),
          ))),
        ]));
  }
}
