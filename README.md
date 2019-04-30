# MaU19-1

大阪府立大学・マネジメント学類「マクロ経済学I」（担当：佐藤）の添付資料に掲載した図を生成するR のコードなどを集めたレポジトリです。

3つのフォルダから構成されており，データは「Data」，コードは「R」，作図の結果は「Graphics」においています。

- Data
- Graphics
- R

講義資料そのものは印刷して配布していますのでオンラインで公開しておりませんが，同業者の方のレビューは歓迎いたしますので，ご連絡ください。（佐藤健治宛： sato@eco.osakafu-u.ac.jp）

## 注意

コードは macOS 上でPDFファイルを作成するために `quartz()` 関数を多用しています。MS Windows, Ubuntu 等 ではそのままでは動作しません。

mac 以外で実行されたい場合には，`quartz()` を `pdf()` や `cairo_pdf()` 等に変更するとともにオプションを適宜変更
してくだささい。また， `theme_set()` 内の `base_family` は環境に応じて変更するか，削除してください。

## License

コードに対する権利は放棄しますが，データの著作権はデータの配布者に帰属しますので，再利用の際にはご注意ください。

These codes are licensed under CC0.

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.ja)

Data are not mine. Please visit the data providers' websites for more information.