---
layout: post
title: "webpack(5) ng2+typescript startup"
date: 2016-08-15T16:00:00.000Z
---

ng2+typescript樣板 ,以下操作用command line ,notepad++操作完成

--------------------------------------------------------------------------------

# Table of contents

1. [add dev package and ng2 package](#add-dev-package-and-ng2-package)
2. [add index page and entry point](#add-index-page-and-entry-point)

--------------------------------------------------------------------------------  

# 1\. add dev package and ng2 package

```
  # 初始化 : 用npm作為套件管理工具
  npm init

  # 安裝開發工具 : 我的基本款webpack套件
  npm install --save-dev webpack html-webpack-plugin webpack-browser-plugin

  # 安裝開發工具 : typescript , typings 和 typescript loader
  npm install --save-dev typescript ts-loader

  # 安裝應用程式套件 : ng2 core
  npm install --save @angular/core core-js reflect-metadata rxjs zone.js
  # 安裝應用程式套件 : ng2 common tool
  npm install --save @angular/common @angular/compiler @angular/platform-browser @angular/platform-browser-dynamic
```  
npm初始化後會產生package.json專案設定檔,  
這裡還需要再完成  
* [webpack設定檔][webpack.config.js]  
* 參照[官網][ng2DocTypescriptConfig]增加typescript設定檔:tsconfig.json, typings.json   

# 2\. add index page and entry point
在使用ng2之前,先加入SPA(single page application)的index頁面和程式進入點.

```
  # src/index.html
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
  </body>
  </html>

  # src/main.ts
  document.body.innerHTML = "hello world~"
```
接著在根目錄下指令`webpack`, 可以看到預設的browser開啟,畫面印出 **hello world~**  




[webpack.config.js]:https://github.com/weichou1229/webpack-practice/blob/master/ng2Startup/webpack.config.js
[tsconfig.json]:https://github.com/weichou1229/webpack-practice/blob/master/ng2Startup/tsconfig.json
[ng2DocTypescriptConfig]:https://angular.io/docs/ts/latest/guide/typescript-configuration.html
