import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/provider/counter_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context).title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _counterViewController = context.read(counterViewController);
    useEffect(() {
      _counterViewController.initState();
      return _counterViewController.dispose;
    }, []);
    final counter = useProvider(counterState).state;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).homePageTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).homePageDescription,
            ),
            Text(
              (counter != null)
                  ? counter.count.toString()
                  : AppLocalizations.of(context).loadingMessage,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => (counter != null)
            ? _counterViewController.countUp()
            : ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(context).counterLoadingMessage,
                  ),
                  duration: const Duration(
                    seconds: 1,
                  ),
                  action: null,
                ),
              ),
        tooltip: AppLocalizations.of(context).incrementButton,
        child: const Icon(Icons.add),
      ),
    );
  }
}
