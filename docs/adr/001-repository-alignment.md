# ADR 001: Repository Alignment for RenderTrust

## Status

Accepted and implemented

## Context

The RenderTrust project was initially configured with an incorrect GitHub repository integration in Linear. Issues created for the RenderTrust project were being linked to the WTFB-app GitHub repository instead of a dedicated RenderTrust repository. This created confusion, complicated development workflows, and compromised code organization.

## Decision

We have decided to:

1. Create a dedicated RenderTrust team in Linear
2. Create a RenderTrust project within this team
3. Migrate all issues from the Words To Film By team to the new RenderTrust team
4. Configure proper bi-directional integration between Linear and GitHub
5. Close issues in the WTFB-app repository with transfer notices

## Consequences

### Positive

- Clean separation between WTFB-app and RenderTrust codebases
- Improved repository organization and workflow
- Better project tracking and management
- Proper issue tracking and linking

### Negative

- One-time migration effort
- Need to update references and documentation
- Need to re-establish project history and context

## Implementation Details

The migration was performed on May 17, 2025 by Claude-ARCHitect. Detailed documentation of the migration process is available in the [Confluence WTFB APP space](https://cheddarfox.atlassian.net/wiki/spaces/WA/pages/265453570/RenderTrust+Repository+Configuration+and+Migration).

## Notes

In the future, we should implement the following practices to avoid similar issues:

1. Configure GitHub integrations separately for each team
2. Test integrations immediately after setup
3. Document integration configurations
4. Perform periodic audits of repository connections