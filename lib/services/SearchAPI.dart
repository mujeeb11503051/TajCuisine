import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test_demo22/view/ProductVM.dart';
import 'package:test_demo22/viewmodel/ProductCatVM.dart';
import 'package:test_demo22/viewmodel/ProductVM.dart';

class SearchDelegateAPI extends SearchDelegate {
  final List<String> _history;
  // List<ProductCatVM> _lstproductCatVM;
  // List<ProductVM> _lstproductList;
  dynamic _lstProductItem;
  final vm;

  SearchDelegateAPI(this._lstProductItem, this.vm)
      : _history = <String>[''],
        super();
  @override
  Widget buildResults(BuildContext context) {
    dynamic productList;
    if (_lstProductItem is List<ProductCatVM>) {
      productList = List<ProductCatVM>.from(_lstProductItem)
          .where((element) =>
              element.name.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    }
    if (_lstProductItem is List<ProductVM>) {
      productList = List<ProductVM>.from(_lstProductItem)
          .where((element) =>
              element.name.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  this.close(context, productList.first.id);
                },
                child: ListTile(
                  leading: productList.length > 0
                      ? Image.memory(base64Decode(productList.first.image),
                          width: 50.0, height: 50.0)
                      : Icon(null),
                  // Highlight the substring that matched the query.
                  title: RichText(
                    text: TextSpan(
                      text: productList.first.name.substring(0, query.length),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: productList.first.name.substring(query.length),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  // Suggestions list while typing search query - this.query.
  @override
  Widget buildSuggestions(BuildContext context) {
    dynamic suggestions;
    if (_lstProductItem is List<ProductCatVM>) {
      suggestions = List<ProductCatVM>.from(_lstProductItem)
          .where((element) =>
              element.name.toLowerCase().startsWith(query.toLowerCase()))
          .toList(); //words = productListVM.product
    }
    if (_lstProductItem is List<ProductVM>) {
      suggestions = List<ProductVM>.from(_lstProductItem)
          .where((element) =>
              element.name.toLowerCase().startsWith(query.toLowerCase()))
          .toList(); //words = productListVM.product
    }
    return _WordSuggestionList(
      query: this.query,
      suggestions: suggestions,
      onSelected: (String suggestion) {
        this.query = suggestion;
        this._history.insert(0, suggestion);
        showResults(context);
      },
    );
  }

  // Action buttons at the right of search bar.
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isNotEmpty
          ? IconButton(
              tooltip: 'Clear',
              icon: const Icon(Icons.clear),
              onPressed: () {
                query = '';
                showSuggestions(context);
              },
            )
          : IconButton(
              icon: const Icon(Icons.mic),
              tooltip: 'Voice input',
              onPressed: () {
                this.query = 'TBW: Get input from voice';
              },
            ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        //Take control back to previous page
        //if (productList != null) this.close(context, productList);
        this.close(context, null);
      },
    );
  }
}

class _WordSuggestionList extends StatelessWidget {
  const _WordSuggestionList({this.suggestions, this.query, this.onSelected});

  final suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i].name.toLowerCase();
        return ListTile(
          leading: query.isEmpty
              ? Image.memory(base64Decode(suggestions[i].image),
                  width: 50.0, height: 50.0)
              : Icon(null),
          // Highlight the substring that matched the query.
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: textTheme,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}
