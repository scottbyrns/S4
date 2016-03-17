# RequestConvertible

The `RequestConvertible` protocol represents a type that can be converted to and from an S4 HTTP request.

```swift
public protocol RequestConvertible: RequestInitializable, RequestRepresentable {}
```

## Motivation

If you don't want to use S4's native request you can convert it to and from your own request using this protocol.