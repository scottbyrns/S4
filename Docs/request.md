# Request

The `Request` type represents an HTTP request.

```swift
public struct Request: Message {
    public var method: Method
    public var uri: URI
    public var version: Version
    public var headers: Headers
    public var body: Body
    public var storage: Storage
}
```

## Motivation

Having `Request` as a `struct` allows it to conform to protocols in extensions.