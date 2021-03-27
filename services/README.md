# Gallery Services

Host your awesome services here.

## Run `flutter pub get` for all services
Instead of running `flutter pub get` for each service, you can run `./pub_get.sh ` in the `root` directory.

## Creating a new service
Creating a new service (using the
[stagehand package](https://pub.dev/packages/stagehand)):
* For the first time: `flutter pub global activate stagehand`
* `mkdir <name_service>`
* `cd <name_service>`
* `flutter pub global run stagehand package-simple`
* `flutter pub get`
* change `analysis_options.yaml` with this:
```
include: package:pedantic/analysis_options.yaml

analyzer:
  strong-mode:
    implicit-casts: false
    implicit-dynamic: false

linter:
  rules:
    - avoid_types_on_closure_parameters
    - avoid_void_async
    - await_only_futures
    - camel_case_types
    - cancel_subscriptions
    - close_sinks
    - constant_identifier_names
    - control_flow_in_finally
    - directives_ordering
    - empty_statements
    - hash_and_equals
    - implementation_imports
    - non_constant_identifier_names
    - package_api_docs
    - package_names
    - package_prefixed_library_names
    - prefer_const_constructors
    - prefer_const_literals_to_create_immutables
    - test_types_in_equals
    - throw_in_finally
    - unnecessary_brace_in_string_interps
    - unnecessary_getters_setters
    - unnecessary_statements
```
