---
layout: post
title: "spring boot + spring data mongoDB + spring data rest"
date: 2016-08-04T16:00:00.000Z
---

本篇紀錄使用最簡易的設定來建立server-api app,  
 spring boot + spring data mongoDB + spring data rest

--------------------------------------------------------------------------------

# Table of contents

1. [create POM file](#create-pom-file)
2. [create Domain class](#create-domain-class)
3. [create DAO interface](#create-dao-interface)
4. [create app entry](#create-app-entry)
5. [configure Repository Rest Configuration](#configure-Repository-Rest-Configuration)

--------------------------------------------------------------------------------  


# 1\. create POM file  
主要是在[pom.xml][pomFile]內增加以下lib依賴設定
* spring-boot-starter-parent
* spring-boot-starter-web
* spring-boot-starter-data-mongodb
* spring-boot-starter-data-rest

# 2\. create Domain class  
建立需要用到的[Domain][domainDir]類別
```
  /*------建立抽象的Domain類別來放常用的屬性------*/
  public abstract class Domain {
  	String creator;
  	Date createDate;
  	String updator;
  	Date updateDate;

    ...
  }

  /*------建立需要的Domain類別------*/
  public class Article extends Domain {
  	@Id
  	private String articleId;
  	private String title;
  	private String content;
  	private Long feedbackNum;

    ...
  }

```

# 3\. create DAO interface  
建立DAO介面,並繼承Spring的repository介面,這樣實作的部分spring會負責產生  
# 4\. create app entry  
建立App的主程式進入點  
# 5\. configure Repository Rest Configuration
設定Data rest

[pomFile]:https://github.com/weichou1229/brulamake/blob/3c5f14a3d253cb69e7b676ed1772c7af133e13ff/brulamake-api/pom.xml
[domainDir]:https://github.com/weichou1229/brulamake/tree/e09129853baab34a80662782313cbcefa243fb68/brulamake-api/src/main/java/io/brulamake/domain
