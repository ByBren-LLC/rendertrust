# Contributing to RenderTrust

Thank you for your interest in contributing to RenderTrust! This document provides guidelines for contributing to the project and explains our licensing model.

## Code of Conduct

By participating in this project, you agree to abide by our code of conduct. Please be respectful and constructive in your interactions with other contributors.

## How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Licensing Guidelines

RenderTrust uses a dual-licensing model. When contributing new code, please follow these guidelines to ensure your contribution uses the appropriate license:

### MIT License

Apply the MIT License to code in these directories:
- `sdk/` (except `sdk/mcp/`)
- `loadtest/`
- `ci/`
- `docs/`
- `diagrams/`

Add the following header to your source files:

```
// Copyright (c) 2025 Words To Film By, Inc.
// Licensed under the MIT License. See LICENSE-MIT for details.
```

### Apache License 2.0

Apply the Apache License 2.0 to code in these directories:
- `core/`
- `edgekit/relay/`
- `sdk/mcp/`

Add the following header to your source files:

```
// Copyright 2025 Words To Film By, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
```

### Enterprise License

The following directories contain proprietary code and are subject to the Enterprise License:
- `rollup_anchor/paymaster/`
- `edgekit/workers/premium_voice/`
- `edgekit/workers/studio_llm/`
- `core/gateway/web/enterprise/`

Do not contribute to these directories without explicit permission from the RenderTrust team.

Add the following header to source files in these directories:

```
// Copyright (c) 2025 Words To Film By, Inc.
// Proprietary and confidential.
// Licensed under the RenderTrust Enterprise License.
```

## Pull Request Process

1. Ensure your code follows the appropriate licensing guidelines
2. Update documentation as needed
3. Include tests for new functionality
4. Ensure the test suite passes
5. Get approval from a maintainer

## Questions?

If you have any questions about contributing or licensing, please contact us at contributors@rendertrust.com.
