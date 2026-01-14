---
name: tsqlt-runner
description: Run tSQLt database unit tests. Use when verifying database changes, running tests, or checking test results.
allowed-tools: Bash
---

# tSQLt Test Runner

Run tSQLt database unit tests from Claude Code against SQL Server databases.

## Command

```bash
${CLAUDE_PLUGIN_ROOT}/tSQLtRunner "<connection-string>" [test-name]
```

## Parameters

### Required
- `<connection-string>`: SQL Server connection string
  - Example: `"Server=.;Database=MyTestDb;Integrated Security=true"`
  - Example: `"Server=localhost;Database=MyDb;User Id=sa;Password=MyPass123"`

### Optional
- `[test-name]`: Specific test to run in format `[Schema].[TestName]`
  - Example: `"[MyTests].[test should validate input]"`
  - If omitted, all tests in the database will be run

## Usage Examples

### Run all tests
```bash
${CLAUDE_PLUGIN_ROOT}/tSQLtRunner "Server=.;Database=MyTestDb;Integrated Security=true"
```

### Run specific test
```bash
${CLAUDE_PLUGIN_ROOT}/tSQLtRunner "Server=.;Database=MyTestDb;Integrated Security=true" "[MyTests].[test should validate input]"
```

### Run specific test class (all tests in a schema)
```bash
${CLAUDE_PLUGIN_ROOT}/tSQLtRunner "Server=.;Database=MyTestDb;Integrated Security=true" "[MyTests]"
```

## Exit Codes

- `0`: All tests passed
- `1`: One or more tests failed or an error occurred

## Output Format

The tool outputs:
1. Test execution header with connection info
2. SQL command being executed
3. Any intermediate output from the tests (recordsets, PRINT statements)
4. Individual test results with color-coded PASS/FAIL status
5. Summary with total counts and overall status

### Example Output

```
================================================================================
tSQLt Test Runner
================================================================================

Running ALL tests...

Executing: EXEC tSQLt.RunAll

Test Results:
--------------------------------------------------------------------------------
[PASS] MyTests.test should validate input
[PASS] MyTests.test should handle null values
[FAIL] MyTests.test should calculate total
       Expected: <100> but was: <0>

================================================================================
Summary: 3 tests, 1 failures, 0 errors
TESTS FAILED (1 failed)
================================================================================
```

## When to Use This Skill

Use this skill when you need to:
- Run tests after making database schema changes
- Verify specific test cases during development
- Check test coverage and results
- Debug failing tests
- Validate stored procedures or functions
- Verify database migrations

## Requirements

- SQL Server database with tSQLt framework installed
- Valid connection string with appropriate permissions
- Network access to the database server

## Platform Support

The skill automatically detects your platform and runs the appropriate binary:
- Windows (x64)
- macOS Intel (x64)
- macOS Apple Silicon (ARM64)
- Linux (x64)

No .NET SDK installation required - binaries are self-contained.

## Tips for Claude

- Always ask the user for the connection string if not provided in context
- Connection strings can use Windows Authentication (`Integrated Security=true`) or SQL Authentication (`User Id=...;Password=...`)
- If tests fail, offer to help debug by examining the failure messages
- Test names are case-insensitive in SQL Server
- The tSQLt framework uses schemas as test classes - each schema with test procedures is a test class
