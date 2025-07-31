# mise-taskwarrior

[![Build Status](https://github.com/m-dango/mise-taskwarrior/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/m-dango/mise-taskwarrior/actions/workflows/main.yml?query=branch%3Amain++)

[Taskwarrior](https://taskwarrior.org/) plugin for the [mise](https://github.com/jdx/mise) version manager.

## Install

Depends on `bash`, `curl`/`wget`, and `tar`.

```
mise plugin add taskwarrior https://github.com/massa/mise-taskwarrior.git
mise list all taskwarrior
mise install taskwarrior latest
```

Just downloads the selected version from git and installs it from source

## Use

Check the [mise documentation](https://mise.jdx.dev) for instructions on how to install and manage versions of taskwarrior.

## Notes

Taskwarrior versions are sourced from [GothenburgBitFactory/taskwarrior](https://github.com/GothenburgBitFactory/taskwarrior).
