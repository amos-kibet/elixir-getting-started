## Regular Expressions

- Written as `~r{regexp}` or `r{regexp}opts, with delimiters being `{`and`}`
- You can also use `~r/.../ but it is less convenient considering that any forward slashes inside the pattern must be escaped.

| Opt | Meaning                                                                                                                                                              |
| --- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| f   | Force the pattern to start to match on the first line of a multiline string.                                                                                         |
| i   | Makes matches case insensitive                                                                                                                                       |
| m   | If the string to be matched contains multiple lines, ^ and $ match the start and end of these lines. \A and \z continue to match the beginning or end of the string. |
| s   | Allow . to match any newline characters                                                                                                                              |
| U   | Normally modifiers like \* and + are greedy, matching as much as possible. The U modifier makes them ungreed, matching as little as possible.                        |
| u   | Enable unicode-specific patterns like \p.                                                                                                                            |
| x   | Enable extended mode-ignore whitespace and comments (# to end of line).                                                                                              |

### Examples

You can manipulate regular expressions with the Rgex module.

```elixir
iex(1)>Regex.run ~r{[aeiou]}, "caterpillar"
["a"] # matches the first pattern

iex(2)>Regex.scan ~r{[aeiou]}, "caterpillar"
[["a"], ["e"], ["i"], ["a"]]

iex(3)>Regex.split ~r{[aeiou]}, "caterpillar"
["c", "t", "rp", "ll", "r"]

iex(4)>Regex.replace ~r{[aeiou]}, "caterpillar", "*"
"c*t*rp*ll*r"
```
