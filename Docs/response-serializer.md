# ResponseSerializer

The `ResponseSerializer` protocol represents a type that can serialize HTTP responses.

```swift
public protocol ResponseSerializer {
    func serialize(response: Response, @noescape send: Data throws -> Void) throws
}
```