# RequestSerializer

The `RequestSerializer` protocol represents a type that can serialize HTTP requests to binary data.

```swift
public protocol RequestSerializer {
    func serialize(request: Request, @noescape send: Data throws -> Void) throws
}
```