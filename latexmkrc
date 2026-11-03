# 默认使用 XeLaTeX；直接运行 latexmk 也只编译中文简历。
$pdf_mode = 5;
@default_files = ('resume-zh_CN.tex');
$out_dir = 'build';
$xelatex = 'xelatex -interaction=nonstopmode -halt-on-error %O %S';
