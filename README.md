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
