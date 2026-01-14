---
allowed-tools: Bash
description: Run tSQLt database unit tests against a SQL Server database
---

# tSQLt Test Runner

Run tSQLt database unit tests.

## Arguments

The user may provide:
- A connection string (required if not previously provided in conversation)
- A specific test name to run (optional)

## Instructions

1. If no connection string is provided, ask the user for one
2. Run the tSQLtRunner command:

```bash
"${CLAUDE_PLUGIN_ROOT}/tSQLtRunner" "<connection-string>" [test-name]
```

On Windows, use:
```bash
"${CLAUDE_PLUGIN_ROOT}/tSQLtRunner.cmd" "<connection-string>" [test-name]
```

3. Report the test results to the user
4. If tests fail, offer to help debug the failures

## Examples

Run all tests:
```bash
"${CLAUDE_PLUGIN_ROOT}/tSQLtRunner" "Server=.;Database=MyTestDb;Integrated Security=true"
```

Run a specific test:
```bash
"${CLAUDE_PLUGIN_ROOT}/tSQLtRunner" "Server=.;Database=MyTestDb;Integrated Security=true" "[MyTests].[test should validate input]"
```
