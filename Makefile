.DEFAULT_GOAL := pdf

.PHONY: all pdf zh_CN watch clean

all: pdf

# latexmk 自动检测正文、样式、图片等依赖，并按需重复编译。
pdf:
	latexmk -xelatex -interaction=nonstopmode -halt-on-error -outdir=build resume-zh_CN.tex

zh_CN: pdf

watch:
	latexmk -xelatex -interaction=nonstopmode -halt-on-error -outdir=build -pvc resume-zh_CN.tex

# 只清理编译目录，保留 releases 中的历史成品。
clean:
	$(RM) -r build
