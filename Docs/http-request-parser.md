# HTTPRequestParser

The `HTTPRequestParser` protocol represents a type that can parse an HTTP request from binary data.

```swift
public protocol HTTPRequestParser {
    func parse(data: Data) throws -> HTTPRequest?
}
```