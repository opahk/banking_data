# Banking Data

## updating the files

#### download and replace files (mind the specs)
* https://www.oenb.at/Statistik/Klassifikationen/SEPA-Zahlungsverkehrs-Verzeichnis.html
* https://www.six-interbank-clearing.com/de/home/bank-master-data/download-bc-bank-master.html
* https://www.bundesbank.de/de/aufgaben/unbarer-zahlungsverkehr/serviceangebot/bankleitzahlen/download-bankleitzahlen-602592
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
