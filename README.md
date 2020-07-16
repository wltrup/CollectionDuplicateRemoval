# CollectionDuplicateRemoval
![](https://img.shields.io/badge/platforms-iOS%2010%20%7C%20tvOS%2010%20%7C%20watchOS%204%20%7C%20macOS%2010.14-red)
[![Xcode](https://img.shields.io/badge/Xcode-11-blueviolet.svg)](https://developer.apple.com/xcode)
[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/wltrup/CollectionDuplicateRemoval)
![GitHub](https://img.shields.io/github/license/wltrup/CollectionDuplicateRemoval/LICENSE)

## What

**CollectionDuplicateRemoval** is a Swift Package Manager package for iOS/tvOS (10.0 and above), watchOS (4.0 and above), and macOS (10.14 and above), under Swift 5.0 and above, adding protocol extensions to `Collection` in order to define a function that returns an array of the elements of the collection, with duplicates removed. 

```swift
public extension Collection where Element: Equatable {

    /// O(n^2) in the worst case.
    func duplicatesRemoved() -> [Element]

}

public extension Collection where Element: Equatable & Comparable {

    /// O(n.log(n)) in the worst case.
    func duplicatesRemoved() -> [Element]

}

public extension Collection where Element: Hashable {

    /// O(n) in the worst case, if the set operations
    /// contains(:) and insert(:) are O(1).
    func duplicatesRemoved() -> [Element]

}
```

## Installation

**CollectionDuplicateRemoval** is provided only as a Swift Package Manager package, because I'm moving away from CocoaPods and Carthage, and can be easily installed directly from Xcode.

## Author

Wagner Truppel, trupwl@gmail.com

## License

**CollectionDuplicateRemoval** is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.
