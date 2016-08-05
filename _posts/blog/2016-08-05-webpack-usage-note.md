---
layout: post
title: "webpack usage note"
date: 2016-08-05T15:00:00.000Z
---

本篇紀錄從[webpack入門用法][webpackDocUsage],學習模組化的程式碼撰寫方式

--------------------------------------------------------------------------------

# Table of contents

1. [CommonJS Modules](#commonjs-modules)
2. [modules by webpack](#modules-by-webpack)
3. [how webpack implement](#how-webpack-implement)

--------------------------------------------------------------------------------  


# 1\. CommonJS Modules
[webpack文件][webpackDocUsage]上用的模組化撰寫語法在[webpack commonjs][webpakCommonjsModules],及[commonjs官網][commonjsModules]上都有描述該定義 ,如果有學過其他物件導向語言,概念上應該八九不離十.
如下有3支js, **app.js** 為應用程式的進入點.  

```
  //cats.js       :提供cats功能
  var cats = ['dave', 'henry', 'martha'];
  module.exports = cats;

  //dogs.js       :引用cats,然後提供dogs功能
  cats = require('./cats.js');
  var dogs = ['bruce', 'snoopy', 'pebuty'];
  module.exports = dogs;

  //app.js        :引用dogs,cats
  cats = require('./cats.js');
  dogs = require('./dogs.js');
  console.log(cats);
```  

雖然這麼寫,實際上module一開始就沒定義,  
這邊就可以讓webpack幫我們實作出模組化的概念.  

# 2\. modules by webpack

```
  //用npm安裝webpack
  npm install webpack -g
  //給程式進入點的檔名,和打包完成後的檔名
  webpack ./app.js app.bundle.js
```  
這時產出的app.bundle.js檔就能直接引用了

```
  <!DOCTYPE html>
  <html>
  <head>
    <script src="./app.bundle.js"></script>
  </head>
  <body>
    hi
  </body>
  </html>

  //如果用chrome瀏覽器,可以從console看到...
  ["dave", "henry", "martha"]
```

# 3\. how webpack implement
`app.bundle.js`的內容如下

```
  /**
  * 這是即刻調用的函式運算式 ( immediately invoked function expression,IIFE )
  * (fn)(args)
  * 可以看到args的部分用 app.js  cats.js  dog.js 組成
  * fn最後調用的 __webpack_require__(0) ,就是引用app.js作為應用程式進入點
  **/
  (
    function(modules) {                               // webpackBootstrap

     var installedModules = {};                       // The module cache

     function __webpack_require__(moduleId) {         // The require function

           if(installedModules[moduleId])                 // Check if module is in cache
             return installedModules[moduleId].exports;

           var module = installedModules[moduleId] = {    // Create a new module (and put it into the cache)
             exports: {},
             id: moduleId,
             loaded: false
           };

           // Execute the module function          :第一次會先載入作為主程式的app.js , 再藉由__webpack_require__載入其他require的模組
           modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

           module.loaded = true;                          // Flag the module as loaded

           return module.exports;                         // Return the exports of the module
     }

     __webpack_require__.m = modules;                 // expose the modules object (__webpack_modules__)

     __webpack_require__.c = installedModules;        // expose the module cache

     __webpack_require__.p = "";                      // __webpack_public_path__

     return __webpack_require__(0);                   // Load entry module and return exports
    }
  )
  (
   [
      function(module, exports, __webpack_require__) {

       cats = __webpack_require__(1);                 //從傳入的__webpack_require__來載入其他模組 ,調用完會回傳模組exports出來的參考
       dogs = __webpack_require__(2);
       console.log(cats);

      },
      function(module, exports) {

       var cats = ['dave', 'henry', 'martha'];      
       module.exports = cats;                         //這樣一個js檔只能exports一個模組功能 ,如果同個函式內exports第二個就會蓋掉第一個

      },
      function(module, exports, __webpack_require__) {

       cats = __webpack_require__(1);
       var dogs = ['bruce', 'snoopy', 'pebuty'];
       module.exports = dogs;

      }
    ]
  );
```



[webpackDocUsage]:http://webpack.github.io/docs/usage.html
[webpakCommonjsModules]:http://webpack.github.io/docs/commonjs.html
[commonjsModules]:http://www.commonjs.org/specs/modules/1.0/
