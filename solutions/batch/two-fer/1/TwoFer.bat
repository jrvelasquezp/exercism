@echo off

set "name=%~1"

if [!name!]==[] (
    echo One for you, one for me.
) else (
    echo One for !name!, one for me.
)

