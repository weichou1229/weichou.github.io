---
layout: post
title: "webpack(4) use loader"
date: 2016-08-09T16:00:00.000Z
---

本篇紀錄使用webpack loader來做模組或資源載入時的處理作業  

--------------------------------------------------------------------------------

# Table of contents

1. [npm package handling](#npm-package-handling)
2. [typescript](#typescript)
3. [typescript loader](#typescript-loader)

--------------------------------------------------------------------------------  

# 1\. npm package handling
　首先，我要把套件安裝的部分用npm設定檔來統一管理，在根目錄加上 **package.json** ,  
所以在根目錄位子下指令`npm init`來幫助建立package.json.

```
  .
  ├── src/                     
  |   └── cats.js
  |   └── dogs.js       
  |   └── app.js   
  ├── bin/              
  |   └── app.bundle.js         
  ├── node_modules/             
  |   └── webpack/
  |   └── ...
  ├── package.json        #=> npm設定檔
  └── web.config.js
```

然後把依賴的開發套件加入設定檔中

```
npm install --save-dev webpack html-webpack-plugin webpack-browser-plugin
```
跑完上面這個指令,就能看到npm安裝完套件,並加入依賴設定到package.json設定檔中    

```
{
  ....(省略)

  "author": "Bruce",
  "license": "ISC",
  "devDependencies": {
    "html-webpack-plugin": "^2.22.0",
    "webpack": "^1.13.1",
    "webpack-browser-plugin": "^1.0.12"
  }
}
```

# 2\. typescript  
因為後面我要學習使用ng2+typescript,所以在這邊改寫js成ts  
1. 改掉副檔名js->ts
2. require的檔案名稱js->ts
3. webpack.congfig.js內的entry->src/app.ts  

然後重新執行`webpack`,運行正常,因為還是js語法,所以browser看得懂.  

這時若將require改成ts的模組語法　**export　import**,webpack建置就會失敗.

# 3\. typescript loader
為了可以將ts編譯成browser看得懂的js,安裝ts以及[ts loader][tsLoaderGithub]套件

```
  npm install --save-dev typescript ts-loader
```  
並直接使用[ts-loader][tsLoaderGithub]裡的範例設定,  
增加 **tsconfig.json** 檔

```
  \\tsconfig.json
  {
    "compilerOptions": {
      "target": "es5",
      "sourceMap": true
    },
    "exclude": [
      "node_modules"
    ]
  }
```

以及webpack解析的附檔名格式和loader  

```
  \\webpack.config.js
  ...
  resolve: {
    extensions: ['', '.webpack.js', '.web.js', '.ts', '.tsx', '.js']	        #=> 是webpack可解析處理的附檔名 .
  },
  module: {
    loaders: [
      { test: /\.ts?$/, loader: 'ts-loader' }                                 #=>　遇到這類附檔名就用什麼loader
    ]
  },

```

這樣就成功加上ts loader了.  


[tsLoaderGithub]:https://github.com/TypeStrong/ts-loader#typescript-loader-for-webpack
