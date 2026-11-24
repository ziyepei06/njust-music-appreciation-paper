# 南京理工大学 课程论文 LaTeX 模板

用于《欧美流行音乐鉴赏》课程的课程论文提交：学校只提供 Word 模版，
本仓库把它逐项复刻成 LaTeX 版本，方便习惯 LaTeX 的同学直接写作与排版。

把学校下发的 Word 模版（`original/学期论文模板（终）.doc`，课程里习惯叫“课程论文”）逐项复刻成 LaTeX 版本：
封面、摘要页（含整页细框与得分框）、各级标题、三线表、图题表题、参考文献页、页码页眉，
字号与位置均按官方导出的 `original/官方导出示例.pdf` 实测对齐。

## 目录结构

```
.
├── original/
│   ├── 学期论文模板（终）.doc    # 学校下发的原始 Word 模版
│   └── 官方导出示例.pdf          # 原模版导出成 PDF 的效果（对照用）
├── latex/
│   ├── term-paper.tex            # LaTeX 模板源文件（留空版）
│   └── logo.png                  # 封面校徽（从 .doc 中提取）
├── docs/
│   └── 作业要求.md                # 课程作业要求与格式要点
└── README.md
```

## 编译

需要 XeLaTeX（中文排版）与以下字体：

- 中文：宋体 `SimSun`、黑体 `SimHei`、楷体 `KaiTi_GB2312`
- 西文：`Times New Roman`、`Arial`

```bash
cd latex
xelatex term-paper.tex
xelatex term-paper.tex   # 第二遍处理交叉引用与页码
```

编译后在同目录生成 `term-paper.pdf`（仓库里不附带编译产物，请自行生成）。

或：

```bash
latexmk -xelatex term-paper.tex
```

> macOS 若未安装 Windows 字体，可把 `term-paper.tex` 导言区的
> `SimSun / SimHei / KaiTi_GB2312` 换成 `Songti SC / Heiti SC / Kaiti SC`，
> 版式不变，字形会略有差别。

## 怎么填

模板把可变信息集中放在导言区的几个 `\newcommand`，改这里即可：

```latex
\newcommand{\papertitlezh}{}        % 中文题目（封面两行、摘要页一行）
\newcommand{\papertitleen}{}        % 英文题目
\newcommand{\paperauthor}{}         % 作者
\newcommand{\paperid}{}             % 学号
\newcommand{\papercollege}{}        % 学院
\newcommand{\papermajor}{}          % 专业
\newcommand{\paperadvisor}{}        % 指导者
\newcommand{\paperdate}{二〇二六年十月}
```

封面题目较长时用 `\papertitlecoverzh`（在破折号后换行，两行各坐一条横线）；
页面里的空白横线、得分框、摘要页外框都已用 TikZ 定位好，不需要手动调。

正文用常规 `\section`、`\subsection`、`\subsubsection`；图表用 `figure[H]`、`table[H]`，
图题在下、表题在上，`\caption` 会自动按章编号（图 2.1、表 2.1）。

## 排版规格

| 项目 | 规格 |
| --- | --- |
| 纸张 / 版心 | A4；左右边距各 2 cm，上下 2.54 cm |
| 页眉 | 奇数页右侧、偶数页左侧排阿拉伯页码，五号 Times New Roman，下加 0.8 pt 横线 |
| 封面标题 | 黑体 53 pt，字距拉开 |
| 封面信息 | 标签宋体加粗 16 pt；填写值楷体_GB2312 16 pt |
| 题目 | 楷体_GB2312 16 pt，英文 Times New Roman |
| 摘要页 | 整页细框；Title / Abstract / Keywords 标签黑体 16 pt，正文 12 pt，1.5 倍行距 |
| 一级标题 | 小三（15 pt）黑体加粗，段前 0.26 cm、段后 0.23 cm |
| 二级标题 | 四号（14 pt）黑体加粗 |
| 三级标题 | 小四（12 pt）黑体加粗 |
| 正文 | 小四（12 pt）宋体 + Times New Roman，1.5 倍行距，首行缩进 2 字符 |
| 图表题 | 五号（10.5 pt）黑体，图题在下、表题在上，按章编号 |
| 三线表 | 顶线/底线 1.5 pt、栏目线 0.75 pt，表内五号 |
| 参考文献 | 另起一页，小三 Times New Roman 居中；条目小四、18 pt 行距、悬挂缩进 |
| 附录 | 另起一页，`Appendix A` 小三黑体 |

## 与 Word 模版的差异

1. **封面不印说明文字**：原 .doc 顶部的蓝色/红色说明框（“双面打印格式模板……”）属于使用说明，正式论文不需要，未复刻。
2. **References 前的空白**：原模版为“空 2 行”后接标题，本模板把标题固定在 4.75 cm，效果一致。
3. **得分框、整页细框**用 TikZ 绘制，位置按原 PDF 实测（误差 < 0.1 cm），未使用图片。
4. 原模版中的蓝色示例文字（“××××××（四号 Times New Roman 字体）”等）是填写提示，模板里改为留空，只保留标签。

## 说明

- 本仓库面向课程论文提交，不含任何课程内容；
- 封面的作者、学号、学院、专业、指导者与题目均留空，填写位置与格式已排好；
- 校徽等素材版权归南京理工大学所有，仅限校内课程作业使用。
