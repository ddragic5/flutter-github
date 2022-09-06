import 'package:flutter/material.dart';
import 'package:search_github/screens/repo_screen.dart';

class SearchScreem extends StatefulWidget {
  const SearchScreem({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreem> createState() => _SearchScreemState();
}

class _SearchScreemState extends State<SearchScreem> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Form(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: controller,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.white)),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    labelText: 'Search repositories',
                    labelStyle: const TextStyle(color: Colors.white),
                    hintStyle: const TextStyle(color: Colors.white),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.greenAccent, width: 2),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.greenAccent,
                    child: MaterialButton(
                      onPressed: () {
                        {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RepoScreen(
                                    repos: controller.text,
                                  )));
                        }
                      },
                      child: const Text(
                        'Search',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
