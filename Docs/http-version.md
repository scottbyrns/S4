# HTTPVersion

The `HTTPVersion` type represents an HTTP version.

```swift
public struct HTTPVersion {
    public var major: Int
    public var minor: Int
}
```

## Motivation

HTTP version is needed to handle protocol differences properly.