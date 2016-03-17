# ResponseParser

The `ResponseParser` protocol represents a type that can parse an HTTP response.

```swift
public protocol ResponseParser {
    func parse(data: Data) throws -> Response?
}
```