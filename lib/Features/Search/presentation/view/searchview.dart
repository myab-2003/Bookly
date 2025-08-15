import 'package:bookly_app/Core/Utils/constants.dart';
import 'package:bookly_app/Core/Utils/size_confige.dart';
import 'package:bookly_app/Features/Search/presentation/view/widgets/search_result_widget.dart';
import 'package:flutter/material.dart';

void showSearchDialog(BuildContext context) {
  final TextEditingController searchController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: SizeConfig.defaultSize! * 2),
              TextField(
                controller: searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.defaultSize! * 1),
              ElevatedButton(
                onPressed: () {
                  final searchQuery = searchController.text.trim();
                  if (searchQuery.isNotEmpty) {
                    Navigator.pop(context); // قفل الـ Dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Scaffold(
                          appBar: AppBar(
                            backgroundColor: kPrimaryColor,
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                " Search Result ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Tektur',
                                ),
                              ),
                            ),
                          ),
                          body: SearchResultWidget(query: searchQuery),
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Search'),
              ),
              SizedBox(height: SizeConfig.defaultSize! * 1),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
              SizedBox(height: SizeConfig.defaultSize! * 2),
            ],
          ),
        ),
      );
    },
  );
}
