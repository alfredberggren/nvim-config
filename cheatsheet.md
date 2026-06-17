Ultimate Vim/Neovim Cheat Sheet

Fast Brackets & Braces (Insert Mode)
    - '{|' → Type '{' followed by '<CR>' (if auto-pairs plugin is installed).
    - '}<Esc>O' → Create closing brace, drop to new line, open line above.
    - 'ctrl+v' then '<Enter>' → Insert a literal newline during a macro.

Essential Navigation
    - 'h' 'j' 'k' 'l' → Left, down, up, right.
    - 'w' / 'b' → Jump forward / backward by word.
    - '0' / '$' → Jump to start / end of line.
    - 'gg' / 'G' → Go to start / end of file.
    - '%' → Jump between matching brackets '()', '{}', '[]'.

Efficient Editing
    - 'i' / 'a' → Insert before / append after cursor.
    - 'o' / 'O' → Open new line below / above current line.
    - 'ciw' → Change inner word (deletes word, enters Insert mode).
    - 'cit' → Change inner XML/HTML tag contents.
    - 'ci"' → Change text inside double quotes.
    - '.' → Repeat last editing command.

Copy, Cut, & Paste
    - 'y' / 'yy' → Yank (copy) selection / current line.
    - 'd' / 'dd' → Delete (cut) selection / current line.
    - 'p' / 'P' → Paste after / before cursor.
    - '"+y' → Copy text to system clipboard.
    - '"+p' → Paste text from system clipboard.

Search & Replace
    - '/text' → Search forward for "text".
    - 'n' / 'N' → Repeat search forward / backward.
    - ':%s/old/new/g' → Replace all "old" with "new" in file.
    - ':%s/old/new/gc' → Replace all with confirmation prompt.

Macros (Record & Play)
    - 'qa' → Start recording macro into register 'a'.
    - 'q' → Stop recording macro.
    - '@a' → Play macro from register 'a'.
    - '@@' → Repeat last played macro.
    - '10@a' → Play macro from register 'a' 10 times.

