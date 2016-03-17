# RequestInitializable

The `RequestInitializable` protocol represents a type that can be initialized from an S4 HTTP request.

```swift
public protocol RequestInitializable {
    init(S4Request: Request)
}
```

## Motivation

If you don't want to use S4's native request you can convert it to your own request using this protocol.