## amazon_order_aggregation
### 概要
- Amazonで購入した合計金額と月ごとのサマリを出す
### 使い方
- 以下のサイトからAmazonの購入履歴をCSVでダウンロードできるようにするChromeの拡張機能をインストール
  - https://chrome.google.com/webstore/detail/%E3%82%A2%E3%83%9E%E3%82%BE%E3%83%B3%E6%B3%A8%E6%96%87%E5%B1%A5%E6%AD%B4%E3%83%95%E3%82%A3%E3%83%AB%E3%82%BF/jaikhcpoplnhinlglnkmihfdlbamhgig?hl=ja&gl=JP
  - Firefoxの場合はこっち
    - https://addons.mozilla.org/ja/firefox/addon/amzorderhistoryfilter/
- 拡張機能を使って購入履歴をCSVでダウンロードする
  - 拡張機能の使い方はこちらを参考にすると良い
    - https://memo.furyutei.work/entry/amzOrderHistoryFilter
  - `csvs/sample.csv_`にあるCSVのような形式のCSVがダウンロードできる
  - `.csv`しか集計対象に入らないので`sample.csv_`は削除不要
- `csvs`ディレクトリ下にダウンロードしたCSVを全てコピーする
- `ruby amazon_order_aggregation.rb`を実行
- 標準出力に購入月に対する合計購入額と前月比がカンマ区切りで出力されるのでCSVに保存するなりなんなりと

### 出力イメージ
```
購入月,合計金額,前月比
2019-05-01,3240,0
2019-06-01,2138,-1102
2019-07-01,25539,+23401
2019-08-01,38124,+12585
2019-09-01,28852,-9272
2019-10-01,19468,-9384
```
