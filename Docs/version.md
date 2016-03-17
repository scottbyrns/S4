# Version

The `Version` type represents an HTTP version.

```swift
public struct Version {
    public var major: Int
    public var minor: Int
}
```

## Motivation

HTTP version is needed to handle protocol differences properly.