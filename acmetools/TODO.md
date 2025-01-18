# DONE: Git

An example program for Acme that would provide some wrappers for Git.
It would have a dedicated window called <path>/+Git, and some load the
tagbar with commands starting with Git.*: e.g. Git.Status, Git.Diff
and such.  It would serve as an example of writing dedicated helper
applications for Acme.

# DONE: Escape

A tool should be added to escape special characters for Getids; or
alternatively, Getids should deal with the special characters instead
(the better option)

# DONE: Automatic tagbar setup based on filename patterns

The tagbar could be populated automatically based on the pattern
of the file.  E.g. a file ending with ".sh" could have shell-script
related utilities loaded in it's tagbar. Maybe even automatically,
like all utilities in path with the name Tag.Sh.* could be loaded,
where "Sh" would be the "name" of the rule, and not the suffix.

## DONE: Implementation

The `Hook' command runs "${HOME}/acme.hook" each time a new window
is spawned in acme. This script is called with the ID of the newly
created window. So, this script should be symlinked to the actual
hook in the repo, also called `acme.hook'. Now, that script probably
also handles events, so I guess I should modify that. Ideas for hooks:
- Load the correct tags into the new window's tagbar
- Insert closing characters of parentheses, quotes, etc.

Only the assembling of the correct tags remain here, and writing
some utilities: Up, Upb, Upc, Uq1, Uq2

## DONE: Tag.Common + Tag.Sh

These scripts should be added, where Tag.Common would provide basic
text editing, and Tag.Sh shell-scripting related editing commands.

## DONE: Clean up acme.hook

## DONE: Add automatic Hook launching in Acme

## DONE: Fix Dumping and Loading with hooks enabled

XDump and XLoad doesn't work when the hook is also running. See
original implementation and BUGS section of the Unhook help message
for more information.

XDump crashed the whole desktop when it tried to kill the acme hook
process group; maybe a wrong process was killed. It should be tested
to logout and login, and not start acme, and see if the desktop
crashes have anything to do with the Unhook mechanism killing the
wrong processes (like something related to DBus for example).

Solution: more like a workaround, but reading from the events in
the hook was removed. Now the hook only does one-off actions at the
beginning of opening a window, and then exits. This removes the race
condition, but also makes it not possible to react to events globally.

# DONE: Fuzzy

A more real and important application for Acme. There should be
an interactive text search and an interactive file search tool
with fuzzy matching. These could even be permanent windows for the
project, e.g. /home/zoltan/git/plan9tools/+Fuzzy.Text which would
search for occurences of the text provided at a prompt and could dump
findings dynamically below the prompt. Same could be applied for file
search. However, it would be important that fuzzy search should work
for virtual buffers as well, and it should be easy to use.

## DONE: Click events seem to be not working in fuzzy windows

Fixed it, problem was that not all events are supported by the events
file, only "lLrRxX", meaning, only mouse clicks, not chords

# DONE: Scratchpad

A permanent window called +Scratch or something would be nice for
temporary text.

# CANCELED: sgpt integration

Needs an API key to one of the many AI services, which is really costly.

# TODO: History

A new program called `Hist` could listen on log events, and print each
opened file into a new line. It could be given an argument to filter
based on paths (e.g. if I'm only interested in opened files under
a directtory). A new program could also be written called HistAdd or
something, that would take a string parameter and would add one line to
the history entry with the current position. To save on path lengths,
relative paths could be used under the directory +Hist operates,
e.g. <proj-dir>/+Hist would list files like ./lib/liba.h instead
of <proj-dir>/lib/liba.h. Proj.Hist would be added to watch the
current project, and HistAdd would add to all History buffers that
are "above" it in the hierarchy. History should also have a maximum
number of entries.

# TODO: Possible Fuzzy improvements

- Wait between keystrokes (e.g. 2-500ms) before executing the find
  command
- If the search string is modified before the previous find command
  ends, the previous find process should be killed and the new one
  started
- If the search string was appended (e.g. the old search string is a
  prefix of the new search string), the find command should not be
  executed and instead the current results should be narrowed down

# New theme: xoria

Add a new theme that looks like xoria256-thin in mc. It should have
black background, with grey tagbars, and that light red as a column
button, and purple as the selection background.
