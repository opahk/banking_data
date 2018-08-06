# Banking Data

## updating the files

#### download and replace files (mind the specs)
* https://www.oenb.at/idakilz/kiverzeichnis?action=toDownloadPage
* https://www.six-interbank-clearing.com/de/home/bank-master-data/download-bc-bank-master.html
* https://www.bundesbank.de/Redaktion/DE/Standardartikel/Aufgaben/Unbarer_Zahlungsverkehr/bankleitzahlen_download.html
* https://www.betaalvereniging.nl/aandachtsgebieden/giraal-betalingsverkeer/bic-sepa-transacties/

#### bump version and adjust changelog
```
lib/banking_data/version.rb
```
```
README.md
```

lib/banking_data/version.rb`

#### push to rubygems (after pr was merged)
``` shell
gem build
gem push
```
