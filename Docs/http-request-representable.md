# HTTPRequestRepresentable

The `HTTPRequestRepresentable` protocol represents a type that can be converted to an S4 HTTP request.

```swift
public protocol HTTPRequestRepresentable {
    var S4Request: HTTPRequest { get }
}
```

## Motivation

If you don't want to use S4's native request you can convert it from your own request using this protocol.