// HeaderValues.swift
//
// The MIT License (MIT)
//
// Copyright (c) 2015 SwiftX
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

public struct HeaderValues {
    public var values: [String]

    public init(_ values: [String]) {
        self.values = values
    }
}

extension HeaderValues {
    public init(_ value: String) {
        self.init([value])
    }
}

extension HeaderValues: RangeReplaceableCollection {
    public init() {
        self.init([])
    }

    public init(repeating repeatedValue: String, count: Int) {
        self.init([String](repeating: repeatedValue, count: count))
    }

    public mutating func replaceSubrange<C : Collection where C.Iterator.Element == String>(subRange: Range<Int>, with newElements: C) {
        self.values.replaceSubrange(subRange, with: newElements)
    }

    public mutating func reserveCapacity(n: Int) {
        self.values.reserveCapacity(n)
    }

    public init<S : Sequence where S.Iterator.Element == String>(_ elements: S) {
        self.init([String](elements))
    }

    public mutating func append(x: String) {
        self.values.append(x)
    }

    public mutating func append<S : Sequence where S.Iterator.Element == String>(contentsOf newElements: S) {
        self.values.append(contentsOf: newElements)
    }


    public mutating func insert(newElement: String, at i: Int) {
        self.values.insert(newElement, at: i)
    }

    public mutating func insert<S : Collection where S.Iterator.Element == String>(contentsOf newElements: S, at i: Int) {
        self.values.insert(contentsOf: newElements, at: i)

    }

    public mutating func remove(at i: Int) -> String {
        return self.values.remove(at: i)
    }

    public mutating func removeFirst() -> String {
        return self.values.removeFirst()
    }

    public mutating func removeFirst(n: Int) {
        self.values.removeFirst(n)
    }

    public mutating func removeSubrange(bounds: Range<Int>) {
        self.values.removeSubrange(bounds)
    }

    public mutating func removeAll(keepingCapacity keepCapacity: Bool) {
        self.values.removeAll(keepingCapacity: keepCapacity)
    }
}

extension HeaderValues: MutableCollection {
    public func makeIterator() -> IndexingIterator<[String]> {
        return values.makeIterator()
    }

    public var startIndex: Int {
        return values.startIndex
    }

    public var endIndex: Int {
        return values.endIndex
    }

    public var count: Int {
        return values.count
    }

    public subscript(index: Int) -> String {
        get {
            return values[index]
        }

        set(value) {
            values[index] = value
        }
    }

    public subscript (bounds: Range<Int>) -> ArraySlice<String> {
        get {
            return values[bounds]
        }

        set(slice) {
            values[bounds] = slice
        }
    }
}

extension HeaderValues: StringLiteralConvertible {
    public init(stringLiteral string: String) {
        self.init(string)
    }

    public init(extendedGraphemeClusterLiteral string: String){
        self.init(string)
    }

    public init(unicodeScalarLiteral string: String){
        self.init(string)
    }
}

extension HeaderValues: ArrayLiteralConvertible {
    public init(arrayLiteral elements: String...) {
        self.init(elements)
    }
}

extension HeaderValues: NilLiteralConvertible {
    public init(nilLiteral: ()) {
        self.init()
    }
}

extension HeaderValues: Equatable {}

public func ==(lhs: HeaderValues, rhs: HeaderValues) -> Bool {
    return lhs.values == rhs.values
}