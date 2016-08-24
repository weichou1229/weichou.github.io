---
layout: post
title: "webpack(5) ng2+typescript startup"
date: 2016-08-15T16:00:00.000Z
---

ng2+typescript樣板 ，以下操作用command line ,notepad++操作完成  
[github resource](https://github.com/weichou1229/webpack-practice/tree/master/ng2Startup) 

--------------------------------------------------------------------------------

# Table of contents

1. [add dev package and ng2 package](#add-dev-package-and-ng2-package)
2. [glance at the TypeScript Typings](#glance-at-the-typescript-typings)
3. [add index page and entry point](#add-index-page-and-entry-point)

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

# 2\. glance at the TypeScript Typings
>TypeScript Typings
>Many JavaScript libraries such as jQuery, the Jasmine testing library, and Angular itself, **extend the JavaScript environment with features and syntax** that the  **TypeScript compiler doesn't recognize natively** . When the compiler doesn't recognize something, it throws an error.
>We use **TypeScript type definition files — d.ts files** — to tell the compiler about the libraries we load.
>TypeScript-aware editors leverage these same definition files to display type information about library features.

以上從[ng2官網文件][ng2DocTypings]擷取,大概意思是指許多lib都會額外增加js原生沒有的功能或語法，  
導致ts工具在轉譯typescript時會不知道怎麼轉才好，所以需要額外提供lib的定義檔，  
所以避免轉譯出錯，需要使用 **typings** 這套件並根據typings.json來安裝定義檔來源.  

```
# 照ng2官網設定增加typings.json在專案根目錄,然後手動安裝

> .\node_modules\.bin\typings install
typings WARN deprecated 2016-08-19: "registry:dt/node#6.0.0+20160807145350" is deprecated (updated, replaced or removed)
typings WARN deprecated 2016-07-26: "registry:dt/core-js#0.0.0+20160602141332" is deprecated (updated, replaced or removed)

├── core-js (global)
├── jasmine (global)
└── node (global)
```


# 3\. add index page and entry point
在使用ng2之前，先加入SPA(single page application)的index頁面和程式進入點.

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
在根目錄下指令`webpack`， 可以看到預設的browser開啟,畫面印出 **hello world~**  

接著修改main.ts,　增加app.module.ts,　app.component.ts

```
// main.ts            #=>負責啟動ng2 context
  import 'core-js/es6';
  import 'reflect-metadata';
  require('zone.js/dist/zone');
  import 'rxjs';

  import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
  import { AppModule } from './app.module';

  platformBrowserDynamic().bootstrapModule(AppModule);

// app.module.ts      #=>ng2 context的設定
  import {BrowserModule} from '@angular/platform-browser';
  import {NgModule} from '@angular/core';
  import {AppComponent}  from './app.component';

  @NgModule({
    imports: [ BrowserModule ],
    declarations: [ AppComponent ],
    bootstrap:    [ AppComponent ]
  })
  export class AppModule {}

// app.component.ts   #=>應用程式元件
  import { Component } from '@angular/core';

  @Component({
    selector: 'body',
    template: '<h1>{{title}}</h1>',
  })
  export class AppComponent {
    title = 'Minimal NgModule';
  }
```

　　在根目錄下指令`webpack`， 可以看到預設的browser開啟,畫面印出 **Minimal NgModule**  

　　這邊要著墨的部分是ng2的核心：compiler，會將我們所撰寫的component,service編譯成browser可與應用程式互動的指令,這個動作會在應用程式初始化時完成。  
　　目前我採用的是JIT(Just in Time)的方式，也就是在客戶端才動態完成編譯。　因為官方已經開始提供AOT(Ahead of Time)，可直接先編譯好，只傳輸編譯後的檔案給客戶端，除了減少檔案傳輸流量,也減少客戶端初始化時間,　所以才有這兩種模式的區別，[官方當然是推薦新的模式][ng2BloggerRC5]。

[webpack.config.js]:https://github.com/weichou1229/webpack-practice/blob/master/ng2Startup/webpack.config.js
[tsconfig.json]:https://github.com/weichou1229/webpack-practice/blob/master/ng2Startup/tsconfig.json
[ng2DocTypescriptConfig]:https://angular.io/docs/ts/latest/guide/typescript-configuration.html
[ng2DocTypings]:https://angular.io/docs/ts/latest/guide/typescript-configuration.html#!#typings
[ng2BloggerRC5]:http://angularjs.blogspot.tw/2016/08/angular-2-rc5-ngmodules-lazy-loading.html
