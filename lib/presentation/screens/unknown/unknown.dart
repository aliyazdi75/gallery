import 'package:flutter/material.dart';
import 'package:gallery/l10n/index.dart';
import 'package:gallery/presentation/widgets/index.dart';
import 'package:routers_service/routers_service.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(GalleryLocalizations.of(context)!.unknownPageTitle)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          GalleryRouterStateScope.of(context)!.routePath = const RootPagePath();
        },
        icon: const Icon(Icons.home),
        label: Text(GalleryLocalizations.of(context)!.homeTitle),
      ),
      body: HoverContainer(
          Text(GalleryLocalizations.of(context)!.unknownPageDescription)),
    );
  }
}
