import Foundation

public extension Collection where Element: Equatable {

    /// O(n^2) in the worst case.
    func duplicatesRemoved() -> [Element] {
        var resultArray: [Element] = []
        for element in self {
            if resultArray.contains(element) == false {
                resultArray.append(element)
            }
        }
        return resultArray
    }

}

public extension Collection where Element: Equatable & Comparable {

    /// O(n.log(n)) in the worst case.
    func duplicatesRemoved() -> [Element] {
        if self.isEmpty { return [] }
        if self.count == 1 { return [ self[self.startIndex] ] }
        var resultArray: [Element] = []
        let sortedElements: [Element?] = self[self.startIndex ..< self.endIndex].sorted() + [nil]
        let pairs = zip(sortedElements.dropFirst(), sortedElements.dropLast())
        for (next, current) in pairs {
            if let cur = current, next != current {
                resultArray.append(cur)
            }
        }
        return resultArray
    }

}

public extension Collection where Element: Hashable {

    /// O(n) in the worst case, if the set operations
    /// contains(:) and insert(:) are O(1).
    func duplicatesRemoved() -> [Element] {
        var resultArray: [Element] = []
        var uniqueElements: Set<Element> = []
        for element in self {
            if uniqueElements.contains(element) == false {
                uniqueElements.insert(element)
                resultArray.append(element)
            }
        }
        return resultArray
    }

}
