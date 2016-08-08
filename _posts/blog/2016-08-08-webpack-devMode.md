---
layout: post
title: "webpack(3) development mode"
date: 2016-08-08T18:00:00.000Z
---

本篇紀錄使用webpack做為webapp開發工具,需要設定當程式碼變動時自動建置,建置後可以反映結果在本機的browser上
[github source code](https://github.com/weichou1229/webpack-practice/tree/master/devMode)
--------------------------------------------------------------------------------

# Table of contents
1. [watch mode](#watch-mode)
2. [html webpack plugin](#html-webpack-plugin)
3. [webpack browser plugin](#webpack-browser-plugin)

--------------------------------------------------------------------------------  

# 1\. watch mode  
webpack config檔設定監看模式,在程式碼變更時,會rebuild  

```
  ...
  module.exports = {
   watch:true,      #=> 增加這一屬性,就能增加監看模式
   entry: './src/app.js',
   output: {
    path: './bin',
    filename: 'app.bundle.js'
   },
   ...
```

# 2\. html webpack plugin
使用html webpack plugin可以在build完成後,產生html檔並加入app.bundle.js的資源標籤在html檔中  
安裝[html webpack plugin](https://github.com/ampedandwired/html-webpack-plugin)

```
npm install html-webpack-plugin --save-dev
```

增加設定在webpack config檔

```
 ...
 plugins: [
   new webpack.optimize.UglifyJsPlugin({
     compress: {
       warnings: false,
     },
     output: {
       comments: false,
     },
   }),
   new HtmlWebpackPlugin({          #=> 增加plugin
     filename: 'index.html',        #=> 產生的html檔名
     template: 'src/index.html'     #=> 使用樣板
   }),

   ...
```

如此,每次建置的時候都會產生html檔

# 3\. webpack browser plugin  
現在為了讓建置的成果直接顯示在本機browser上,使用webpack browser plugin  
安裝[webpack browser plugin](https://github.com/1337programming/webpack-browser-plugin)   

```
  npm install --save-dev webpack-browser-plugin
```
增加config設定

```
  ...
  plugins: [
    new webpack.optimize.UglifyJsPlugin({
      compress: {
        warnings: false,
      },
      output: {
        comments: false,
      },
    }),
    new HtmlWebpackPlugin({  
      filename: 'index.html',
      template: 'src/index.html'
    }),
    new WebpackBrowserPlugin({      #=> 增加plugin
      port: 9000                    #=> 設port
    })
  ]
```

接下來在命令列輸入`webpack`,可以看到以下內容,並會自動開啟系統預設的browser

```
  > webpack
  Hash: 8625c216039101bb1536
  Version: webpack 1.13.1
  Time: 572ms
          Asset       Size  Chunks             Chunk Names
  app.bundle.js  435 bytes       0  [emitted]  main
     index.html  224 bytes          [emitted]
     [0] ./src/app.js 78 bytes {0} [built]
     [1] ./src/cats.js 130 bytes {0} [built]
     [2] ./src/dogs.js 96 bytes {0} [built]
  Child html-webpack-plugin for "index.html":
          + 3 hidden modules
  [BS] Access URLs:
   -------------------------------------
         Local: http://localhost:9000
      External: http://192.168.56.1:9000
   -------------------------------------
            UI: http://localhost:3001
   UI External: http://192.168.56.1:3001
   -------------------------------------
  [BS] Serving files from: ./bin
```
每當原始碼變更的時候,會rebuild,reload

```
[BS] Reloading Browsers...
Hash: e844fb7c78afff9c0e1b
Version: webpack 1.13.1
Time: 72ms
        Asset       Size  Chunks             Chunk Names
app.bundle.js  434 bytes       0  [emitted]  main
   [1] ./src/cats.js 129 bytes {0} [built]
    + 2 hidden modules
Child html-webpack-plugin for "index.html":
        + 3 hidden modules
```
