关键词 “必须”("MUST")、“一定不可/一定不能”("MUST NOT")、“需要”("REQUIRED")、
“将会”("SHALL")、“不会”("SHALL NOT")、“应该”("SHOULD")、“不该”("SHOULD NOT")、
“推荐”("RECOMMENDED")、“可以”("MAY")和”可选“("OPTIONAL")的详细描述可参见RFC 2119[http://www.ietf.org/rfc/rfc2119.txt]

## 名词解释

- 公共分支: `test`
- 主分支：`master`
- 特性分支：需求开发的分支
- 修复分支：上线后需要修复功能的分支

## 规范

- **必须**设置大小写敏感 `git config core.ignorecase false`。
- **必须**设置忽略文件读写权限 `git config core.filemode false`。
- **一定不能**在公共分支上直接写代码并提交。
- 特性分支和修复分支**必须**是从`master`主分支`checkout`出来。
- 特性分支 **必须** 以`feature` 为前缀, 基于 JIRA 单的特性必须以 `feature-{开发者标识}-{需求描述}-{年月日}` 命名
- 修复分支 **必须** 以`hotfix`开头
- 已合并到主分支的特性分支或修复分支 **必须** 在远程仓库中删除

## git操作
- **回退** git reset --hard origin/master
     
