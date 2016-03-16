# Storage

The `Storage` type represents arbitrary data that can be passed between middleware and a responder in a chain.

```swift
public typealias Storage = [String: Any]
```

## Motivation

Having a storage in the HTTP messages makes middleware much more useful since they can pass forward parsed/serialized content, session information or just about any custom data.
