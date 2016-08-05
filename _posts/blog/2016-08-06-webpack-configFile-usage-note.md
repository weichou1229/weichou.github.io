---
layout: post
title: "webpack basic configure file usage note"
date: 2016-08-06
---

本篇紀錄簡易使用configure file來作為webpack的建置設定檔  

--------------------------------------------------------------------------------

# Table of contents

1. [setup my project](#setup-my-project)
2. [webpack config file](#webpack-config-file)
3. [use uglify js plugin](#use-uglify-js-plugin)

--------------------------------------------------------------------------------  

# 1\. setup my project
首先參照[官網的圖片][webpackSetupProject]來設置我的JS專案  

![big-pic](https://raw.githubusercontent.com/dtinth/webpack-docs-images/2459637650502958669ea6b11bf49dc0b3b083ae/usage/project-structure.png)   

```
  .
  ├── src/
  |   └── cats.js
  |   └── dogs.js       
  |   └── app.js   
  └── bin/              
  |   └── app.bundle.js         #=> 由webpack產出
  └── web.config.js
```

# 2\. webpack config file  
`web.config.js`是預設webpack會讀取的設定檔檔名,內容如下,  
這樣設定檔也被作為一個功能模組來使用.

```
  module.exports = {
      entry: './src/app.js',
      output: {
          path: './bin',
          filename: 'app.bundle.js'
      }
  };
```

接下來在專案根目錄執行`webpack`指令就會輸出`app.bundle.js`

# 3\. use uglify js plugin




[webpackSetupProject]:http://webpack.github.io/docs/usage.html#getting-serious
[webpackDocConfig]:http://webpack.github.io/docs/configuration.html
