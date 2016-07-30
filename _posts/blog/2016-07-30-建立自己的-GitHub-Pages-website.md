---
published: true
layout: post
title: "建立自己的 GitHub Pages website"
date: 2016-07-30 15:00:00
---

>GitHub Pages is designed to host your personal, organization, or project pages directly from a GitHub repository.  

　本篇紀錄使用**GitHub Pages服務**來建立的部落格的方式  

 1. [design my wireframe](#1)
 2. [開一個新的repository](#2)
 3. [建置頁面須知](#3)
 4. [建置頁面](#4)

--------------------------------------------------

### <a name="1"></a> 1. design my wireframe  
簡單設計部落格的頁面  

  * 入口頁面
  * 部落格頁面

<img src="{{ site.url }}/assets/images/blog-wireframe.jpg" width="100%"/>  


### <a name="2"></a> 2. 開一個新的repository  
　用github帳號建立一個repository,名稱為`username.github.io` ,  
　以我的例子:`weichou1229.github.io`  

### <a name="3"></a> 3. 建置頁面須知  
>Jekyll is a simple, blog-aware, static site generator...  
Jekyll also happens to be the engine behind GitHub Pages...  

　看Jekyll官網的說明,  
　意思大概就是GitHub Pages是用Jekyll作為靜態頁面產生器,  
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


* The front matter is where Jekyll starts to get really cool. Any file that contains a YAML front matter block will be processed by Jekyll as a special file.  

 Jekyll會處理帶有**front matter**的檔案  

* Jekyll traverses your site looking for files to process. Any files with YAML front matter are subject to processing. For each of these files, Jekyll makes a variety of data available via the Liquid templating system.  

 Jekyll處理檔案時會使用**Liquid樣板系統**去解析要產生的內容  

　下一段落,試著去了解建置頁面的解析流程.


### <a name="4"></a> 4. 建置頁面  
建置根目錄index.html　　

```
    ---
    layout: default
    title: weichou1229
    ---
    <div class="blurb">
    <h1>Hi there, I'm weichou!</h1>
    </div><!-- /.blurb -->
```
