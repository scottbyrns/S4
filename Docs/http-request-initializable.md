# HTTPRequestInitializable

The `HTTPRequestInitializable` protocol represents a type that can be initialized from an S4 HTTP request.

```swift
public protocol HTTPRequestInitializable {
    init(S4Request: HTTPRequest)
}
```

## Motivation

If you don't want to use S4's native request you can convert it to your own request using this protocol.