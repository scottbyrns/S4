# ResponseInitializable

The `ResponseInitializable` protocol represents a type that can be initialized from an S4 HTTP response.

```swift
public protocol ResponseInitializable {
    init(S4Response: Response)
}
```

## Motivation

If you don't want to use S4's native response you can convert it to your own response using this protocol.