## HTTPStatus

The `HTTPStatus` protocol represents an HTTP status.

```swift
public enum HTTPStatus {
    case Continue
    case SwitchingProtocols
    case Processing

    case OK
    case Created
    case Accepted
    case NonAuthoritativeInformation
    case NoContent
    case ResetContent
    case PartialContent

    case MultipleChoices
    case MovedPermanently
    case Found
    case SeeOther
    case NotModified
    case UseProxy
    case SwitchProxy
    case TemporaryRedirect
    case PermanentRedirect

    case BadRequest
    case Unauthorized
    case PaymentRequired
    case Forbidden
    case NotFound
    case MethodNotAllowed
    case NotAcceptable
    case ProxyAuthenticationRequired
    case RequestTimeout
    case Conflict
    case Gone
    case LengthRequired
    case PreconditionFailed
    case RequestEntityTooLarge
    case RequestURITooLong
    case UnsupportedMediaType
    case RequestedRangeNotSatisfiable
    case ExpectationFailed
    case ImATeapot
    case AuthenticationTimeout
    case EnhanceYourCalm
    case UnprocessableEntity
    case Locked
    case FailedDependency
    case PreconditionRequired
    case TooManyRequests
    case RequestHeaderFieldsTooLarge

    case InternalServerError
    case NotImplemented
    case BadGateway
    case ServiceUnavailable
    case GatewayTimeout
    case HTTPVersionNotSupported
    case VariantAlsoNegotiates
    case InsufficientStorage
    case LoopDetected
    case NotExtended
    case NetworkAuthenticationRequired

    case Raw(statusCode: Int, reasonPhrase: String)
}
```

### Motivation

Having `HTTPStatus` as an enum with a `Raw` case makes it convenient and flexible at the same time.
