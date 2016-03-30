public struct Headers {
    public var headers: [HeaderName: HeaderValues]

    public init(_ headers: [HeaderName: HeaderValues]) {
        self.headers = headers
    }
}

extension Headers: DictionaryLiteralConvertible {
    public init(dictionaryLiteral elements: (HeaderName, HeaderValues)...) {
        var headers: [HeaderName: HeaderValues] = [:]

        for (key, value) in elements {
            headers[key] = value
        }

        self.headers = headers
    }
}

extension Headers: NilLiteralConvertible {
    public init(nilLiteral: ()) {
        self.headers = [:]
    }
}

#if swift(>=3.0)
extension Headers: Sequence {}
#else
extension Headers: SequenceType {}
#endif

extension Headers {
    #if swift(>=3.0)
    public func makeIterator() -> DictionaryIterator<HeaderName, HeaderValues> {
        return headers.makeIterator()
    }
    #else
    public func generate() -> DictionaryGenerator<HeaderName, HeaderValues> {
        return headers.generate()
    }
    #endif

    public var count: Int {
        return headers.count
    }

    public var isEmpty: Bool {
        return headers.isEmpty
    }

    public subscript(name: HeaderName) -> HeaderValues {
        get {
            return headers[name] ?? nil
        }

        set(headerValues) {
            headers[name] = headerValues
        }
    }
}
