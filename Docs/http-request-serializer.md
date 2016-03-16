# HTTPRequestSerializer

The `HTTPRequestSerializer` protocol represents a type that can serialize HTTP requests to binary data.

```swift
public protocol HTTPRequestSerializer {
    func serialize(request: HTTPRequest, @noescape send: Data throws -> Void) throws
}
```