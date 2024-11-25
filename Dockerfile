# ベースイメージとしてAmazon Linux 2023を使用
FROM public.ecr.aws/docker/library/amazonlinux:2023

# コンテナで利用するアプリケーションをインストール
RUN dnf -y update && \
dnf -y install httpd

# 外部からindex.htmlをコピー
COPY index.html /var/www/html/index.html
COPY httpd.conf /etc/httpd/conf/httpd.conf

# コンテナが利用するポート番号
EXPOSE 80

# コンテナ実行時に動かすコマンド
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]