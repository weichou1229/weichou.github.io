---
published: true
layout: post
title: "建立自己的 GitHub Pages website"
date: 2016-07-30 15:00:00
---

>GitHub Pages is designed to host your personal, organization, or project pages directly from a GitHub repository.  

　本篇紀錄使用GitHub Pages服務來建立的部落格的方式  

 1. [design my wireframe](#1)
 2. [開一個新的repository](#2)
 3. [建置頁面](#3)


--------------------------------------------------

### <a name="1"></a> 1. design my wireframe  
簡單設計部落格的頁面  

  * 入口頁面
  * 部落格頁面

<img src="{{ site.url }}/assets/images/blog-wireframe.jpg" width="100%"/>  


### <a name="2"></a> 2. 開一個新的repository  
　用github帳號建立一個repository,名稱為`username.github.io` ,  
　以我的例子:`weichou1229.github.io`  

### <a name="3"></a> 3. 建置頁面  
>Jekyll is a simple, blog-aware, static site generator...  
Jekyll also happens to be the engine behind GitHub Pages...  

　看Jekyll官網的說明,  
　意思大概就是GitHub Pages是用Jekyll作為靜態頁面產生器,  
　因此只要遵循產生器的規範設定 ,就能建置好頁面.  

　我的例子是採用以下結構  

    .
    ├── _config.yml     #=> 給產生器讀的設定檔
    ├── _includes/      #=> 放可重複使用的部件功能
    ├── _layouts/       #=> 樣板,用來給頁面產生器解析後生成頁面
    ├── _posts/         #=> 存放PO文的內容
    ├── blog/
    |   └── index.html  # => http://weichou1229.github.io/blog/
    └── index.html      # => http://weichou1229.github.io/
