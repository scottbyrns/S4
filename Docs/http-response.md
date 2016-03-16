## HTTPResponse

The `HTTPResponse` type represents an HTTP response.

```swift
public struct HTTPResponse: HTTPMessage {
    public var version: HTTPVersion
    public var status: HTTPStatus
    public var headers: HTTPHeaders
    public var body: HTTPBody
    public var storage: Storage
}
```

### Motivation

Having `HTTPResponse` as a `struct` allows it to conform to protocols in extensions.