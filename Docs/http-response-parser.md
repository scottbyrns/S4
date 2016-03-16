# HTTPResponseParser

The `HTTPResponseParser` protocol represents a type that can parse an HTTP response.

```swift
public protocol HTTPResponseParser {
    func parse(data: Data) throws -> HTTPResponse?
}
```