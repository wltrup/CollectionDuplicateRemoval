import XCTest
@testable import CollectionDuplicateRemoval

private protocol Randomisable {
    init(x: Int)
}

private extension Randomisable {
    static func randomArray() -> [Self] {
        (0 ..< 10).map { _ in Self(x: Int.random(in: 0 ... 30)) }
    }
}

final class CollectionDuplicateRemovalTests: XCTestCase {

    struct FooEquatable: Equatable, Randomisable {
        let x: Int
    }

    struct FooEquatableComparable: Equatable, Comparable, Randomisable {
        let x: Int
        static func < (lhs: FooEquatableComparable, rhs: FooEquatableComparable) -> Bool { lhs.x < rhs.x }
    }

    struct FooHashable: Hashable, Randomisable {
        let x: Int
    }

    func test_duplicatesRemoved_Equatable() {
        let s = FooEquatable.randomArray()
        let exp = Array(Set(s.map { $0.x })).sorted()
        let res = Array(Set(s.duplicatesRemoved().map { $0.x })).sorted()
        XCTAssert(res == exp, "source: \(s), res: \(res), exp: \(exp)")
    }

    func test_duplicatesRemoved_Equatable_and_Comparable_empty() {
        let s: [FooEquatableComparable] = []
        let exp = s
        let res = s.duplicatesRemoved()
        XCTAssert(res == exp, "source: \(s), res: \(res), exp: \(exp)")
    }

    func test_duplicatesRemoved_Equatable_and_Comparable_single_element() {
        let x = Int.random(in: 0 ... 10)
        let s: [FooEquatableComparable] = [ FooEquatableComparable(x: x) ]
        let exp = s
        let res = s.duplicatesRemoved()
        XCTAssert(res == exp, "source: \(s), res: \(res), exp: \(exp)")
    }

    func test_duplicatesRemoved_Equatable_and_Comparable() {
        let s = FooEquatableComparable.randomArray()
        let exp = Array(Set(s.map { $0.x })).sorted()
        let res = Array(Set(s.duplicatesRemoved().map { $0.x })).sorted()
        XCTAssert(res == exp, "source: \(s), res: \(res), exp: \(exp)")
    }

    func test_duplicatesRemoved_Hashable() {
        let s = FooHashable.randomArray()
        let exp = Array(Set(s.map { $0.x })).sorted()
        let res = Array(Set(s.duplicatesRemoved().map { $0.x })).sorted()
        XCTAssert(res == exp, "source: \(s), res: \(res), exp: \(exp)")
    }

}
