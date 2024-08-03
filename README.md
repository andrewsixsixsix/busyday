# BusyDay

A todo app

## SwiftLint setup

1. Install via Homebrew

```shell
brew install swiftlint
```

2. Add `.swiftlint.yml` to project root

3. In XCode >= 15.0 set `ENABLE_USER_SCRIPT_SANDBOXING` to `NO` in project's `Build Settings` (use search field to find this property)

4. Add `Run Script` step to project's `Build Phases` before `Compile Sources` step. Script's content:

```shell
if [[ "$(uname -m)" == arm64 ]]
then
    export PATH="/opt/homebrew/bin:$PATH"
fi

if command -v swiftlint >/dev/null 2>&1
then
    swiftlint --fix && swiftlint
else
    echo "warning: `swiftlint` command not found - See https://github.com/realm/SwiftLint#installation for installation instructions."
fi
```

5. Right below script input field, uncheck `Based on dependency analysis` box to run script on every build and supress warning

6. Done
