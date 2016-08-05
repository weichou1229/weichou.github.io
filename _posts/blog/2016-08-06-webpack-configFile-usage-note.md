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
作為前一篇[webpack basic usage note][webpackBasicUsageNote]的後續,  
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
現在可以試試plugin,如文件的教學修改`webpack.config.js`

```
  const webpack = require('webpack');

   module.exports = {
  	entry: './src/app.js',
  	output: {
  	 path: './bin',
  	 filename: 'app.bundle.js'
  	},
  	plugins: [
  		new webpack.optimize.UglifyJsPlugin({
  			compress: {
  				warnings: false,
  			},
  			output: {
  				comments: false,
  			},
  		}),
  	]
   };
```

　在執行webpack之前,看到config引入了webpack模組,所以要先執行  

```
  npm install --save-dev webpack
```      
專案內就會多了`node_modules`,裡面包含webpack和webpack所依賴到的模組,  
這樣就可以在專案根目錄執行

```
webpack
```

最後,來看一下plugin的成效

```
  /**
  * 還沒加入UglifyJs Plugin之前
  * 打包出來的檔案大小是 1.86 kB
  **/

  > webpack
  Hash: 39cfbd987184544ceff5
  Version: webpack 1.13.1
  Time: 62ms
          Asset     Size  Chunks             Chunk Names
  app.bundle.js  1.86 kB       0  [emitted]  main
     [0] ./src/app.js 78 bytes {0} [built]
     [1] ./src/cats.js 131 bytes {0} [built]
     [2] ./src/dogs.js 95 bytes {0} [built]
```

```
  /**
  * 加入UglifyJs Plugin之後
  * 打包出來 0.436 kB ,差了4倍
  **/

  > webpack
  Hash: 39cfbd987184544ceff5
  Version: webpack 1.13.1
  Time: 215ms
         Asset       Size  Chunks             Chunk Names
  app.bundle.js  436 bytes       0  [emitted]  main
    [0] ./src/app.js 78 bytes {0} [built]
    [1] ./src/cats.js 131 bytes {0} [built]
    [2] ./src/dogs.js 95 bytes {0} [built]
```


[webpackBasicUsageNote]:https://weichou1229.github.io/blog/2016-08-05-webpack-basic-usage-note
[webpackSetupProject]:http://webpack.github.io/docs/usage.html#getting-serious
[webpackDocConfig]:http://webpack.github.io/docs/configuration.html
