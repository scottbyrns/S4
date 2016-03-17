## Response

The `Response` type represents an HTTP response.

```swift
public struct Response: Message {
    public var version: Version
    public var status: Status
    public var headers: Headers
    public var body: Body
    public var storage: Storage
}
```

### Motivation

Having `Response` as a `struct` allows it to conform to protocols in extensions.