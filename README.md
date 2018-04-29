### 创建容器

请使用实际的路径替换以下命令中的 `/DOWNLOAD_DIR` 和 `CONFIG_DIR`，他们将容器中的下载目录和配置文件目录映射到你指定的主机路径上，以便于管理下载的文件和 Aria2 的配置。

```
sudo docker run -d \
--name aria2 \
-p 6800:6800 \
-p 6880:80 \
-p 6888:8080 \
-v /DOWNLOAD_DIR:/data \
-v /CONFIG_DIR:/config \
-e SECRET=SECRET_CODE \
getnas/aria2
```

> 注意：如果不需要浏览下载目录，则去掉 `-p 6888:8080` 参数。  
> 提示：如果希望 aria2 容器随 docker 自动运行，则添加 `--restart=always` 参数。  
> 提示：请用随意的一组字符串替换 `SECRET_CODE`，在浏览器中管理 aria2 时需要用这个安全代码认证身份，以防他人恶意使用。  
> 注意：如果设置了`SECRET`，在启动完成之后需要在页面配置相应的参数  

### 使用方法

* `http://host:6880` 打开 web 管理界面
* `http://host:6888` 浏览下载目录
