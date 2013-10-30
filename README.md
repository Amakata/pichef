pichef
======

Rasberrypi chef cookbooks

1. はじめに

これは AmakataがRaspberrypi用の環境を構築するChefのリポジトリです。

2. ライセンス

As Is ベースでご自由に参照してくだださい。
内部で利用しているコードにはそれぞれライセンスが別途定義されている場合があります。
個々のライセンスに従う様にしてください。

3. 構築方法

#Ruby1.9が動作する環境を用意する。

# kinfe をインストール
sudo gem i knife-solo --no-ri --no-rdoc
# berkshelfをインストール
sudo gem i berkshelf --no-ri --no-rdoc

# ワークスペースに入る
cd pichef
# berksでcookbooksのファイルをダウンロード
berks install --path cookbooks
# pi にchefをインストール
knife solo prepare pi
# pi にchefで環境を構築
knife solo cook pi





