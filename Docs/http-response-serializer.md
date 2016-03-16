# HTTPResponseSerializer

The `HTTPResponseSerializer` protocol represents a type that can serialize HTTP responses.

```swift
public protocol HTTPResponseSerializer {
    func serialize(response: HTTPResponse, @noescape send: Data throws -> Void) throws
}
```