# HTTPResponseInitializable

The `HTTPResponseInitializable` protocol represents a type that can be initialized from an S4 HTTP response.

```swift
public protocol HTTPResponseInitializable {
    init(S4Response: HTTPResponse)
}
```

## Motivation

If you don't want to use S4's native response you can convert it to your own response using this protocol.