# ResponseRepresentable

The `ResponseRepresentable` protocol represents a type that can be converted to an S4 HTTP response.

```swift
public protocol ResponseRepresentable {
    var S4Response: Response { get }
}
```

## Motivation

If you don't want to use S4's native response you can convert it from your own response using this protocol.