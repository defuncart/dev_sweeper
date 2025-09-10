# dev_sweeper

A desktop application to free up space used by developer tools.

## Current Functionality

- Xcode
 - Remove Archives
 - Remove Derived Data
 - Remove iOS Device Logs
 - Remove Device Support for old OS versions for iOS and macOS
- Brew
    - brew update && brew upgrade && brew cleanup
- Flutter
    - Find all Dart/Flutter projects and clean them
- FVM
    - Find all unused FVM versions
- Shorebird
    - Clean cache
- Node
    - Find all npm projects and clean them
- Rust
    - Find all rust projects and clean them

## Planned Functionality

- Xcode
    - Remove Device Support for old OS versions for watchOS, tvOS, visionOS
- Android AVD
    - List emulators, their size and potentially remove them
- dart
    - pub cache https://dart.dev/tools/pub/cmd/pub-cache
- Node
    - what is .npm/_cacache/content-v2 ?? >4GB

Once functionality on macOS is complete, support for Linux/Windows may be added.
