import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  Searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, color: Colors.black),
            hintText: "Search..",
            suffixIcon: Icon(Icons.mic),
            hintStyle: const TextStyle(
              color: Colors.black,
            ),
            floatingLabelAlignment: FloatingLabelAlignment.center,
            enabledBorder: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black)),
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }
}
