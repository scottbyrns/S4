# Headers

The `Headers` type represents HTTP headers.

```swift
public typealias Headers = [Header]
```

### Motivation

Unfortunately the HTTP protocol allows duplicate headers (see Set-Cookie). So we have to make it an array instead of a dictionary.