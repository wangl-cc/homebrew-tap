# MaaAssistantArknights Homebrew Tap

这是一个用于安装 MaaAssistantArknights (MAA) 相关软件的 Homebrew Tap。

This is a Homebrew Tap for installing MaaAssistantArknights (MAA) related software.

## 如何安装包 (How do I install these formulae and casks?)

```bash
brew install MaaAssistantArknights/tap/<formula>`
```

or

```bash
brew tap MaaAssistantArknights/tap
brew install <formula>
```

## 可用软件 (Available software)

### Formulae

- `maa-cli`: MAA 命令行工具 (MAA CLI tool)。

**注意**：由于 GitHub 没有提供 `arm64` 架构的 runner，因此不提供 `maa-cli` 预编译 bottle。
如果你在 `arm64` 架构的 macOS 或者 Linux 上使用 `brew`安装 `maa-cli`，`brew` 会自动从源码编译。
macOS 用户也可以使用 `maa-cli-bin` 这个 cask 来安装 `maa-cli` 的通用二进制版本。

**Note**: Since GitHub does not provide `arm64` architecture runner, `maa-cli` does not provide pre-compiled bottle.
If you use `brew` to install `maa-cli` on `arm64` architecture macOS or Linux, `brew` will automatically compile from source.
For macOS users,  `maa-cli-bin` cask can also be used to install the universal binary version of `maa-cli`.

### Casks (only for macOS)

- `maa-cli-bin`: `maa-cli` 的二进制版本 (Binary version of `maa-cli`)；
- `maa-gui`: MAA macOS 图形界面 (MAA macOS GUI)；
- `maa-gui-beta`: MAA macOS 图形界面的测试版本 (Test version of MAA macOS GUI)。
