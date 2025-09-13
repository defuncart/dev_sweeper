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
    - Clean global packages cache
    - Find all Dart/Flutter projects and clean them
- FVM
    - Find all unused FVM versions
- Shorebird
    - Clean cache
- Node
    - Clean global npm cache
    - Find all npm projects and clean them
- Rust
    - Clean global crates cache
    - Find all rust projects and clean them

## Planned Functionality

- Cocoapods
    - Clean .cocoapods
- Dart
    - Clean .dartServer
- Xcode
    - Remove Device Support for old OS versions for watchOS, tvOS, visionOS
- Android AVD
    - List emulators, their size and potentially remove them
- Rust
    - .rustup/toolchains
- Firebase
    - emulators (.cache/firebase/emulators)

Once functionality on macOS is complete, support for Linux/Windows may be added.
