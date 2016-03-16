# HTTPRequest

The `HTTPRequest` type represents an HTTP request.

```swift
public struct HTTPRequest: HTTPMessage {
    public var method: HTTPMethod
    public var uri: URI
    public var version: HTTPVersion
    public var headers: HTTPHeaders
    public var body: HTTPBody
    public var storage: Storage = [:]
}
```

## Motivation

Having `HTTPRequest` as a `struct` allows it to conform to protocols in extensions.