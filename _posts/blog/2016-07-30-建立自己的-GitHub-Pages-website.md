---
published: true
layout: post
title: 建立自己的 GitHub Pages website
date: 2016-07-30T15:00:00.000Z
---

> GitHub Pages is designed to host your personal, organization, or project pages directly from a GitHub repository.

本篇紀錄使用**GitHub Pages服務**來建立的部落格的方式

1. [design my wireframe](#design-my-wireframe)
2. [開一個新的repository](#"開一個新的repository")
3. [建置頁面須知](#建置頁面須知)
4. [建置入口頁面](#建置入口頁面)

--------------------------------------------------------------------------------

# 1\. design my wireframe

簡單設計部落格的頁面

- 入口頁面
- 部落格頁面

![big-pic]({{ site.url }}/assets/images/blog-wireframe.jpg)

# 2\. 開一個新的repository

用github帳號建立一個repository,名稱為`username.github.io` ,<br>
以我的例子:`weichou1229.github.io`

# 3\. 建置頁面須知

> Jekyll is a simple, blog-aware, static site generator...<br>
> Jekyll also happens to be the engine behind GitHub Pages...

看Jekyll官網的說明,<br>
意思大概就是GitHub Pages是用Jekyll作為靜態頁面產生器,<br>
因此只要遵循**目錄**及**文件**的設定規範 ,就能建置好頁面.

以下是我部落格的目錄結構

```
    .
    ├── _config.yml             #=> 給產生器讀的設定檔
    ├── _includes/              #=> 放可重複使用的部件功能
    |   └── disqus.html         #=> 留言板功能的插件
    ├── _layouts/               #=> 樣板,用來給頁面產生器解析後生成頁面
    |   └── default.html         
    |   └── post.html            
    ├── _posts/                 #=> 存放PO文的內容
    |   └── post/               
    |       └── myArticle.html
    ├── assets/                 #=> 存放img,pdf,...之類的資源
    ├── css/                    #=> 存放css檔
    ├── blog/
    |   └── index.html          #=> 部落格頁面 http://weichou1229.github.io/blog/
    └── index.html              # => 入口頁面 http://weichou1229.github.io/
```

從官網可以得知,Jekyll engine產生靜態頁面的樣板設定從哪開始

- The front matter is where Jekyll starts to get really cool. Any file that contains a YAML front matter block will be processed by Jekyll as a special file.

  Jekyll會處理帶有**front matter**的檔案

- Jekyll traverses your site looking for files to process. Any files with YAML front matter are subject to processing. For each of these files, Jekyll makes a variety of data available via the Liquid templating system.

  Jekyll處理檔案時會使用**Liquid樣板系統**去解析要產生的內容

下一段落,試著去了解建置頁面的解析流程.

# 4\. 建置入口頁面

1. [新增根目錄`index.html`](#新增根目錄`index.html`)
2. [新增default樣板`./_layouts/default.html`](#新增default樣板`./_layouts/default.html`)

## 4-1\. 新增根目錄`index.html`

```
    ---
    layout: default
    title: weichou1229
    ---
    <div class="blurb">
    <h1>Hi there, I'm weichou!</h1>
    </div><!-- /.blurb -->
```

目錄結構中所有的index.html檔,在Jekyll官網文件中定義為`Page file` 用`---`符號包住的部分為Jekyll中定義的**front matter**,<br>
這邊是宣告變數的區塊,變數會用在樣板上或是Jekyll的其它功能,<br>
像是上面的layout即是告訴Jekyll去使用`_layouts目錄`下,名稱為default的樣板

新增default樣板`./_layouts/default.html`

```
<!DOCTYPE html>
    <html>
        <head>
            <title>{{ page.title }}</title>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <!-- link to main stylesheet -->
            <link href="//fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css">
            <link rel="stylesheet" type="text/css" href="/css/normalize.css">
              <link rel="stylesheet" type="text/css" href="/css/skeleton.css">
              <link rel="stylesheet" type="text/css" href="/css/main.css">
        </head>
        <body>
                <div class="container">
                        <header>
                            weichou1229
                        </header>

                        <nav>
                            <div class="row">
                                <div class="one column"><a href="/" >Home</a></div>
                                    <div class="one column"><a href="/blog">Blog</a></div>
                                    <!--<div class="one columns">CV</div> -->
                            </div>
                        </nav>

                        <section class="container">

                            {{ content }}

                        </section>

                        <footer>
                                    <ul>
                                        <li><a href="mailto:weichou1229@gmail.com">email</a></li>
                                        <li><a href="https://github.com/weichou1229">github.com/weichou1229</a></li>
                                        </ul>
                        </footer>
                </div>
        </body>
    </html>
```

`_layouts`目錄下的檔案,在Jekyll官網文件中定義為`Layout file`<br>
如上,html結構就如我一開始畫的wireframe,有header,nav,section,footer區塊<br>
可以發現被`左右各兩個大括弧`包住的部分，即是樣板引擎解析後,塞資料進去的位置<br>
進一步用下圖說明<br>
![big-pic]({{ site.url }}/assets/images/renderFileExample1.jpg)<br>
**在Page file(index.html)宣告的各種變數,和系統提供的變數,<br>
都會在呈現靜態頁面時搭配Layout File(default.html)使用**

如此,兩個html檔,入口頁面就建置好了!
