import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/selected_user.dart';
import '../providers/async_search_provider.dart';
import '../utils/debounce.dart';
import 'search_result_page.dart';

class SearchProfilePage extends ConsumerStatefulWidget {
  const SearchProfilePage({super.key});

  @override
  ConsumerState createState() => _SearchProfilePageState();
}

class _SearchProfilePageState extends ConsumerState<SearchProfilePage> {
  final TextEditingController _searchController = TextEditingController();
  final _debounce = Debounce(milliseconds: 1000);

  void handleTextFieldChanged() {
    final text = _searchController.text;
    if (text.isNotEmpty) {
      _debounce.run(() {
        print('===== search:  $text');
        ref.read(asyncSearchProvider.notifier).fetchSearchResult(text);
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          _searchController.clear();
        }
      });
    }
  }

  void showDetail(SelectedUser user) {
    // print('${user.toString()}');
    ref.read(asyncSearchProvider.notifier).setSelectedId(user.id);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SearchResultPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(handleTextFieldChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(asyncSearchProvider);
    // print('PAGE RESULT ${result.value}');
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight * 2),
          child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: _searchField(_searchController)),
          ),
        ),
        body: result.when(
            data: (currentList) {
              // final currentList = result.value;

              if (currentList.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                      itemCount: currentList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TextButton(
                          onPressed: () => showDetail(currentList[index]),
                          child: Text(
                            '${index + 1}: ${currentList[index]
                                .firstName} ${currentList[index].lastName}',
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyLarge,
                          ),
                        );
                      }),
                );
              } else {
                return Text('No results found. Please try again.', style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,);
              }
            },
            error: (error, stackTrace) {
              return Text('${error.toString}');
            },
            loading: () => const Center(child: CircularProgressIndicator()))
      // ListView.builder(
      //   itemCount: currentList!.length,
      //   itemBuilder: (BuildContext context, int index){
      //     return Text('List $index');
      //   })
    );
  }
}

Widget _searchField(searchController) {
  return Material(
    color: Colors.green,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.all(6),
          prefixIcon: Icon(Icons.search),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.0),
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
          hintText: 'Search for user profile...',
        ),
      ),
    ),
  );
}
