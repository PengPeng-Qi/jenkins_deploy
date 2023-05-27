FROM node:18.16.0

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json 文件到工作目录
COPY package*.json ./

# 安装依赖
RUN npm install

# 复制所有源代码到工作目录
COPY . .

# 执行构建命令
RUN npm run build

# 配置 NGINX
FROM nginx:latest

# 复制构建生成的静态文件到 NGINX 的默认 HTML 目录
COPY --from=0 /app/dist /usr/share/nginx/html

# 暴露端口
EXPOSE 80

# 启动 NGINX 服务器
CMD ["nginx", "-g", "daemon off;"]