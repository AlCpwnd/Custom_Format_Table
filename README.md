# Custom_Format_Table
Test function written with the goal of adding conditionnal highlighting to the existing `Format-Table` output method.

## Examples:

### Example 1:
The following will return a table with all running process while highlighting the line which correspond to the condition.
```
PS> Format-CustomTable -Data (Get-Process) -Condition {$_.ProcessName -match "host"} -Highlight Green
```