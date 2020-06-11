```
 _                           _           _            _             
| | __ _ _ __ __ ___   _____| |       __| | ___   ___| | _____ _ __ 
| |/ _` | '__/ _` \ \ / / _ \ |_____ / _` |/ _ \ / __| |/ / _ \ '__|
| | (_| | | | (_| |\ V /  __/ |_____| (_| | (_) | (__|   <  __/ |   
|_|\__,_|_|  \__,_| \_/ \___|_|      \__,_|\___/ \___|_|\_\___|_|

```
# 使用[docker](https://www.docker.com/)运行[laravel](https://laravel.com/)项目

## 获取项目
```
git clone https://github.com/L-Y/laravel-docker.git
```
## 编辑配置信息
```
cp .env.example .env
```
## 创建应用
```
docker-compose build app
```
## 清除项目配置缓存`bootstrap/cache/config.php`
```
php artisan cache:config
```
## 启动应用
```
docker-compose up -d
```
## 查看后台运行的容器
```
docker-compose ps
```
## 查看容器内文件
```
docker-compose exec app ls -l
```
## 安装项目依赖包
```
docker-compose exec app composer install
```
## 生成应用key
```
docker-compose exec app php artisan key:generate
```
## 浏览器访问地址(我这里设置的端口是9000)：
```
http://localhost:9000
```
# 其他命令
```
docker-compose logs nginx
docker-compose pause
docker-compose unpause
docker-compose down
docker-compose exec db bash
```
# Q&A
 
注:`composer install`安装`laravel`依赖包时如果想使用代理，可以使用`docker-compose exec app bash`进入交互模式，配置代理

1.局部)
```
composer config repo.packagist composer https://mirrors.aliyun.com/composer/
#删除配置
composer config --unset repos.packagist
```
2.全局)
```
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
composer config -g --unset repos.packagist
```
3.导入数据库数据到容器
```
sudo docker-composer exec  container_name mysql -uroot -p  dbname < data.sql
```
4.redis配置时修改.env文件,后面主机名修改为您的容器名，我这里是`redis`
```
REDIS_HOST=127.0.0.1 -> REDIS_HOST=redis
```

5.mysql配置时修改.env文件,后面主机名修改为您的容器名，我这里是`db`
```
DB_HOST=127.0.0.1 -> DB_HOST=db
```
