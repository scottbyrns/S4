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

extension Headers: Sequence {
    public func makeIterator() -> DictionaryIterator<HeaderName, HeaderValues> {
        return headers.makeIterator()
    }

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
