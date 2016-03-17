# RequestParser

The `RequestParser` protocol represents a type that can parse an HTTP request from binary data.

```swift
public protocol RequestParser {
    func parse(data: Data) throws -> Request?
}
```