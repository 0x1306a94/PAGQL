# PAGQL


##### 修改循环次数

```
defaults write com.0x1306a94.PAGQL.PAGQL PlayerRepeatCount -int 1
# 如果执行上面命令报错 Domain com.0x1306a94.PAGQL.PAGQL does not exist, 则先执行下面这条命令
defaults write ~/Library/Containers/com.0x1306a94.PAGQL.PAGQL/Data/Library/Preferences/com.0x1306a94.PAGQL.PAGQL PlayerRepeatCount -int 4

defaults read com.0x1306a94.PAGQL.PAGQL
defaults write com.0x1306a94.PAGQL.PAGQL PlayerRepeatCount -int 1
```
#### build

```shell
git clone https://github.com/0x1306a94/PAGQL
cd PAGQL
git clone --depth 1 https://github.com/Tencent/libpag
cd libpag
./sync_deps.sh
git lfs install
git lfs pull
../
xed .
```
