# 中文简历

基于 [billryan/resume](https://github.com/billryan/resume) 定制的一页中文简历，使用 XeLaTeX 编译。当前项目只保留中文入口。

## 日常使用

本地需要安装包含 XeLaTeX 和 latexmk 的 TeX 发行版，以及 GNU Make。字体已放在 `fonts/` 中，无需另行安装系统字体。以下命令均在项目根目录执行。

```sh
make
```

生成文件：`build/resume-zh_CN.pdf`。也可以用 `make zh_CN` 或直接运行 `latexmk`。

```sh
make watch  # 修改文件后自动重新编译，使用系统默认 PDF 预览器
make clean  # 删除 build/ 编译目录，不影响 releases/ 历史成品
```

如果不使用 Make，可以直接执行：

```sh
latexmk -xelatex -interaction=nonstopmode -halt-on-error -outdir=build resume-zh_CN.tex
```

在 Overleaf 中上传项目源码，将主文档设置为 `resume-zh_CN.tex`，编译器设置为 XeLaTeX。

## 修改位置

| 文件 | 用途 |
| --- | --- |
| `resume-zh_CN.tex` | 姓名、联系方式、教育背景、项目经历、技能和奖项 |
| `resume-zh-style.sty` | 中文字体选择、学校标签、标题间距、顶部照片与校徽布局 |
| `resume.cls` | 共用排版基础：页边距、字号、日期对齐和联系信息宏 |
| `fonts/` | 随项目携带的字体 |
| `build/` | 自动生成的 PDF 和中间文件，不纳入 Git |
| `releases/` | 按日期保存的历史 PDF 和版本说明 |

替换照片：修改 `resume-zh-style.sty` 中 `\resumeHeader` 内的图片路径，或替换对应图片。当前使用蓝底证件照和 `hit-logo_compressed.png`；白底照片与原始校徽作为备用素材保留。

切换中文字体：在 `resume-zh-style.sty` 中选择一套字体包，默认使用项目内的 Adobe 字体，也保留 Noto Sans / Noto Serif 中文字体备选。切换字体可能改变分页，需要重新检查 PDF。

## 保存当前版本

优化前的完整项目已固定在标签 `resume-v1-2026-11-03`，对应提交 `c37804b`。其中包含当时的简历内容、排版、字体和照片。

- `releases/2026-11-03/侯金科-简历-v1.pdf`：优化前源码编译的单页成品，可直接投递或查看。
- `releases/2026-11-03/resume-v1-source.zip`：优化前完整源码备份。压缩包仅在本地保存，不纳入 Git；可复制到其他磁盘备份。
- `releases/2026-11-03/README.md`：版本、编译环境和校验值。

即使本地压缩包丢失，也可以通过标签重新导出源码：

```sh
git archive --format=zip --output=resume-v1-source.zip resume-v1-2026-11-03
```

解压到另外一个文件夹，再按旧版说明编译，即可查看旧版本，不需要覆盖正在修改的简历。

标签和本地文件不会自动备份到远端。当前 `origin` 指向个人仓库 `Discard-001/resume`，`upstream` 指向原模板仓库 `billryan/resume`。本地压缩包仍需自行备份。推送分支与原版标签：

```sh
git push origin zh_CN
git push origin resume-v1-2026-11-03
```

## 以后保存投递版本

先编译并检查 PDF，再使用一个新的版本名和存档目录。例如：

```sh
make
mkdir -p releases/v2
cp build/resume-zh_CN.pdf releases/v2/侯金科-简历-v2.pdf
git add resume-zh_CN.tex resume-zh-style.sty resume.cls releases/v2
git commit -m "保存中文简历 v2 投递版本"
git tag -a resume-v2 -m "中文简历 v2 投递版本"
```

以上为后续操作示例；如果同时修改了其他字体、图片或配置文件，也应一起提交。历史成品使用新的目录和文件名保存，避免覆盖原版。

`.gitignore` 默认忽略编译 PDF，但允许 `releases/` 中的 PDF 纳入 Git。完整源码压缩包体积较大，按本地备份处理。

## 许可

沿用上游的 [MIT License](LICENSE)。字体各自的授权不包含在项目 MIT 许可中。
