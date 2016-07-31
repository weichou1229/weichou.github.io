---
published: true
layout: post
title: Create my GitHub Pages website
date: 2016-07-30T15:00:00.000Z
---

> GitHub Pages is designed to host your personal, organization, or project pages directly from a GitHub repository.

本篇紀錄使用**GitHub Pages服務**來建立部落格的方式

--------------------------------------------------------------------------------

# Table of contents

1. [design my wireframe](#design-my-wireframe)
2. [create a new repository](#create-a-new-repository)
3. [need to know when build pages](#need-to-know-when-build-pages)
4. [build entry page](#build-entry-page)
5. [build blog page](#build-blog-page)

--------------------------------------------------------------------------------

# 1\. design my wireframe

簡單設計部落格的頁面

- 入口頁面 entry page
- 部落格頁面 blog page

![big-pic]({{ site.url }}/assets/images/blog-wireframe.jpg)

# 2\. create a new repository

用github帳號建立一個repository,名稱為`username.github.io` ,<br>
以我的例子:`weichou1229.github.io`

# 3\. need to know when build pages

> Jekyll is a simple, blog-aware, static site generator...<br>
> Jekyll also happens to be the engine behind GitHub Pages...

看Jekyll官網的說明,<br>
意思大概就是GitHub Pages是用Jekyll作為靜態頁面產生器,<br>
因此**只要遵循目錄及文件的設定規範 ,就能建置好網站頁面.**

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

# 4\. build entry page

　4-1\. [add root index page](#add-root-index-page)  
　4-2\. [add default layout](#add-default-layout)

## 4-1\. add root index page
　在根目錄新增index.html如下
```
    ---
    layout: default
    title: weichou1229
    ---
    <div class="blurb">
    <h1>Hi there, I'm weichou!</h1>
    </div><!-- /.blurb -->
```

在我的目錄結構中所有index.html檔,在Jekyll官網文件中定義為`Page file`,  
用`---`符號包住的部分為Jekyll中定義的**front matter**,  
這邊是宣告變數的區塊,變數會用在樣板上或是Jekyll的其它功能,  
像是上面的`layout變數`即是告訴Jekyll去使用`_layouts目錄`下,名稱為default的樣板  

## 4-2\. add default layout
　建立`_layouty`資料夾並新增default.html如下
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

`_layouts`目錄下的檔案,在Jekyll官網文件中定義為`Layout file`  
如上,html結構就如我一開始畫的wireframe,有header,nav,section,footer區塊  
可以發現被`左右各兩個大括弧`包住的部分，即是樣板引擎解析後,塞資料進去的位置  
進一步用下圖說明  
![big-pic]({{ site.url }}/assets/images/renderFileExample1.jpg)  
**在Page file(index.html)宣告的各種變數,和系統提供的變數,  
都會在呈現靜態頁面時搭配Layout File(default.html)使用**

如此,加入兩個html檔後,入口頁面就建置好了!

# 5\. build blog page

　5-1\. [add blog index page](#add-blog-index-page)  
　5-2\. [add post layout page](#add-post-layout-page)  
　5-3\. [add post page](#add-post-page)  

## 5-1\. add blog index page
　建立`blog`資料夾,並在資料夾下新增部落格index.html主頁,用來**顯示文章清單**  

```  
  ---
  layout: default
  title: weichou1229's Blog
  ---
  <ul class="posts">
  	  {% for post in site.posts %}
  	    <li><span>{{ post.date | date_to_string }}</span> » <a href="{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a></li>
  	  {% endfor %}
  </ul>
```  

　如上,使用default的layout格式

## 5-2\. add post layout page
　定義一個layout給部落格文章用  

```  
  ---
  layout: default
  ---
  <h1>{{ page.title }}</h1>
  <p class="meta">{{ page.date | date_to_string }}</p>

  <div class="post">
    {{ content }}
  </div>
  <div>
  	{% include disqus.html %}
  </div>
```   

　可以看到這個layout檔又指定default為layout,`disqus.html`則是第三方的留言板功能.  

## 5-3\. add post page
>　To create a new post, all you need to do is create a file in the `_posts` directory.  
　How you name files in this folder is important. Jekyll requires blog post files to be named according to the following format:  
　**YEAR-MONTH-DAY-title.MARKUP**  

　官網上說要新增的po文放在`_posts`底下,並依規定格式命名.  
　所以建立`_posts`資料夾,並在`_posts`底下再多建一層`blog`資料夾,用來簡易分類靜態資源,    
之後新增部落格文章時,放在‵blog‵資料夾內.  
　當然也可以不建blog資料夾,還有很多方式設定,以我的例子,是用`permalink: /:path`的全域設定,
用途為Jekyll幫我們產生完post底下的靜態頁面後,會給定靜態資源的連結位址,位址格式就是用permalink定義.  
　所以建立個內容只有一行的`_config.yml`檔在根目錄  

```  
  permalink: /:path
```  


　接著資料夾開好,設定檔也有了,然後用我的例子說明...  
　建立`2016-07-30-Create-my-GitHub-Pages-website.md`在blog資料夾內.   

```  
  ---
  published: true
  layout: post
  title: Create my GitHub Pages website
  date: 2016-07-30T15:00:00.000Z
  ---

  ...內文省略

```  

　這邊的layout指到post.html  

　這樣簡易的部落格就算完成了,  
　[完整範例參考](https://github.com/weichou1229/weichou1229.github.io)
