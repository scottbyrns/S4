# Message

The `Message` protocol represents properties common to HTTP messages (request/response).

```swift
public protocol Message: CustomDataStore {
    var version: Version { get set }
    var headers: Headers { get set }
    var body: Body { get set }
}
```

## Motivation

Having the `Message` protocol makes adding computed properties common to requests and responses more convenient. It removes code duplication.