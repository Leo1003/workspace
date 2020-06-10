# Bash Scripting Cheatsheet

## Filename processing
- Directory name: `${path%/*}`
- File name without path: `$(basename -- "$file")`
- File extension: `${file##*.}`
- File without extension: `${file%.*}`

## Variable processing
- Default value: `${var:-defval}`
- Default value and set: `${var:=defval}`
- Variable mapping: `${var:+val}`
- Exception: `${val:?msg}`

## String processing
### Case Modification
- To lowercase
    - First letter of words: `${str,}`
    - All letters: `${str,,}`
- To uppercase
    - First letter of words: `${str^}`
    - All letters: `${str^^}`
- Reverse case
    - First letter of words: `${str~}`
    - All letters: `${str~~}`

### Others
- String length: `${#str}`

