# Sign In Page Flow
```mermaid
flowchart
    A[Init] --> B[Verify Email]
    B --> C[Invalid Struct]
    B --> E[Valid Email]
    C --> D[Show Error Message]
    D --> A
    E --> F[Find User]
    F --> G[User Not Found]
    G --> D
    F --> H[User Found]
    H --> I[Verify Password]
    I --> J[Password does not match]
    J --> D
    I --> K[Password matches]
    K --> L[Redirect to All Done Page]
```