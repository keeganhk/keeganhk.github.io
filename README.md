# keeganhk.github.io — 个人学术主页

基于 Jekyll（academicpages / minimal-mistakes 主题）搭建，部署在 GitHub Pages：
<https://keeganhk.github.io>

---

## 想修改网站，编辑哪个文件？

| 想改的东西 | 编辑的文件 |
| --- | --- |
| **主页所有正文内容**（About / News / Research / Services / Selected Publications 等） | `_pages/about.md` |
| **左侧个人信息**（姓名、头像、简介、Google Scholar / GitHub 等链接） | `_config.yml`（`author:` 部分） |
| **网站标题、URL 等全局设置** | `_config.yml`（顶部 `Site Settings` 部分） |
| **视觉设计**（字体、配色、间距、论文卡片样式等） | `_sass/_custom.scss` |
| **加载的网页字体** | `_includes/head/custom.html` |
| **头像图片、论文缩略图** | `images/` 目录 |
| **PDF 等可下载文件** | `files/` 目录 |

> 绝大多数日常更新只需改 **`_pages/about.md`**（内容）和往 **`images/`**、**`files/`** 里放图片/PDF。

---

## 本地预览调试

在项目根目录打开 PowerShell，运行：

```powershell
.\serve.ps1 -Port 4001
```

然后浏览器打开 <http://localhost:4001/>。保存文件后会自动刷新（改 `_config.yml` 需按 `Ctrl+C` 重启）。

---

