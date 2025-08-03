@echo off
setlocal enabledelayedexpansion

set startVerse=%~1
set endVerse=%~2
set "result="
set /a startVerse = "%startVerse% - 1"
set /a endVerse = "%endVerse% - 1"

set song[0]=I know an old lady who swallowed a fly.\nI don't know why she swallowed the fly. Perhaps she'll die.
set song[1]=I know an old lady who swallowed a spider.\nIt wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die.
set song[2]=I know an old lady who swallowed a bird.\nHow absurd to swallow a bird!\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die.
set song[3]=I know an old lady who swallowed a cat.\nImagine that, to swallow a cat!\nShe swallowed the cat to catch the bird.\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die.
set song[4]=I know an old lady who swallowed a dog.\nWhat a hog, to swallow a dog!\nShe swallowed the dog to catch the cat.\nShe swallowed the cat to catch the bird.\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die.
set song[5]=I know an old lady who swallowed a goat.\nJust opened her throat and swallowed a goat!\nShe swallowed the goat to catch the dog.\nShe swallowed the dog to catch the cat.\nShe swallowed the cat to catch the bird.\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die.
set song[6]=I know an old lady who swallowed a cow.\nI don't know how she swallowed a cow!\nShe swallowed the cow to catch the goat.\nShe swallowed the goat to catch the dog.\nShe swallowed the dog to catch the cat.\nShe swallowed the cat to catch the bird.\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die.
set song[7]=I know an old lady who swallowed a horse.\nShe's dead, of course!

set i=!startVerse!
:loop
if !i! gtr !endVerse! goto :display_song
if !i! gtr !startVerse! set result=!result!\n
set result=!result!!song[%i%]!
set /a i=!i!+1
goto :loop

:display_song
echo %result%
