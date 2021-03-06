pichef
======

Rasberrypi chef cookbooks

#警告
#このcookbookはRaspberrypiのsudoの設定などをいじります。実行時には別途rootでログインをしておいたり、バックアップをとったり、復旧できるようにしておいてください。

1. はじめに

 これは AmakataがRaspberrypi用の環境を構築するChefのリポジトリです。

1. ライセンス

 As Is ベースでご自由に参照してくだださい。
内部で利用しているコードにはそれぞれライセンスが別途定義されている場合があります。
個々のライセンスに従う様にしてください。

1. 構築方法

 まずRuby1.9が動作するLinux/Mac環境を用意しておいてください。

* sshの接続設定を.ssh/configに記述しておく
vim ~/.ssh/config
<pre>
Host pi
  Hostname xxx.xxx.xxx.xxx
  User pi
  IdentityFile ~/.ssh/id_rsa
  ForwardAgent yes
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentitiesOnly yes
  LogLevel FATAL
</pre>
xxx.xxx.xxx.xxxはRaspberrypiのIPアドレス
~/.ssh/id_rsaはsshの秘密鍵のパス
Raspberrypi側のpiユーザの.ssh/authorized_keysには対応する公開鍵を配置する。
こうしておくとssh piとするだけでRaspberrypiにsshできる。(RaspberrypiのsshはONにしておく必要あり)
これでchefの接続時に接続できないといったことがなくなる。
* kinfe をインストール
<pre>
sudo gem i knife-solo --no-ri --no-rdoc
</pre>
* berkshelfをインストール
<pre>
sudo gem i berkshelf --no-ri --no-rdoc
</pre>
* ワークスペースに入る
<pre>
cd pichef
</pre>
* berksでcookbooksのファイルをダウンロード
<pre>
berks install --path cookbooks
</pre>
* pi にchefをインストール
<pre>
knife solo prepare pi
</pre>
* pi にchefで環境を構築
<pre>
knife solo cook pi
</pre>



