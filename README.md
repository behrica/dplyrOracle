# README
Bjarki and Einar  
7 11 2016  




```r
library(dplyr)
library(dplyrOracle)
oracle_tables("fiskar")
```

```
## 
##    owner  table             space rows     analyzed           
## 1  fiskar vindhradi         nyt         13 2014-01-08 22:00:13
## 2  fiskar vindatt           nyt         18 2012-10-27 12:26:09
## 3  fiskar vedur             nyt         10 2012-10-27 12:26:09
## 4  fiskar valkvarnir        nyt      19234 2015-08-28 22:01:15
## 5  fiskar utibu             nyt          7 2012-10-27 12:26:09
## 6  fiskar umhverfi          nyt     183208 2016-05-04 22:01:37
## 7  fiskar typa              nyt         17 2012-10-27 12:22:31
## 8  fiskar tunfisk_faeda     nyt        310 2012-10-27 12:27:26
## 9  fiskar tuna_hardir       nyt       7857 2012-10-27 12:27:56
## 10 fiskar tuna_ferskir      nyt         62 2012-10-27 12:27:26
## 11 fiskar tuna_brad         nyt       3975 2012-10-27 12:27:26
## 12 fiskar togstodvar        nyt     236278 2015-11-04 22:01:19
## 13 fiskar togeyktir         nyt         12 2012-10-27 12:26:08
## 14 fiskar synaflokkar       nyt         35 2012-10-27 12:26:08
## 15 fiskar stodvar           nyt     323711 2016-09-26 22:01:28
## 16 fiskar stada_stodva      nyt          8 2015-08-26 22:01:10
## 17 fiskar stada_lengdir     nyt          5 2012-10-27 12:26:08
## 18 fiskar stada_kvarnir     nyt         15 2013-12-11 22:02:13
## 19 fiskar spurn             nyt          3 2012-10-27 12:26:07
## 20 fiskar sky               nyt         10 2012-10-27 12:26:07
## 21 fiskar skikar            nyt        266 2012-10-27 12:26:07
## 22 fiskar sjor              nyt         10 2012-10-27 12:26:07
## 23 fiskar oskjur            nyt     291673 2015-11-20 22:01:18
## 24 fiskar numer             nyt    1068092 2015-05-20 22:01:22
## 25 fiskar melting_kvarna    nyt          3 2012-10-27 12:27:26
## 26 fiskar melting_bradar    nyt          3 2012-10-27 12:27:26
## 27 fiskar linir             nyt      33412 2012-10-27 12:28:34
## 28 fiskar l_hafnir          nyt         92 2012-10-27 12:26:07
## 29 fiskar lengdir           nyt   11847756 2016-05-04 22:01:28
## 30 fiskar leidr_stodvar     nyt      64846 2014-01-08 22:00:21
## 31 fiskar leidr_numer       nyt     230179 2015-12-01 22:01:41
## 32 fiskar leidr_lengdir     nyt    2266635 2012-10-27 12:31:23
## 33 fiskar leidr_kvarnir     nyt    1560670 2014-01-17 22:01:25
## 34 fiskar leidangrar        nyt       8795 2014-05-05 22:00:21
## 35 fiskar kynthroski        nyt       2769 2012-10-27 12:27:26
## 36 fiskar kyn               nyt          2 2012-10-27 12:27:25
## 37 fiskar kvarnir           nyt    4220336 2015-10-28 22:01:48
## 38 fiskar kvarnaflokkar     nyt          6 2012-10-27 12:26:07
## 39 fiskar innyflafita       nyt          4 2012-10-27 12:26:07
## 40 fiskar innslatt_status   nyt         17 2012-10-27 12:26:07
## 41 fiskar ices_tegundir     nyt         21 2012-10-27 12:26:07
## 42 fiskar hafis             nyt         10 2012-10-27 12:26:07
## 43 fiskar g_vikmork         nyt        249 2012-10-27 12:26:07
## 44 fiskar g_trossur         nyt        222 2012-10-27 12:26:07
## 45 fiskar flokkar_sendingar nyt      13527 2012-10-27 12:28:40
## 46 fiskar flokkar           nyt          0 2012-10-27 08:42:01
## 47 fiskar beita             nyt          2 2012-10-27 12:27:25
```

```r
oracle_variables("fiskar.stodvar")
```

```
## 
##    name            Sclass    type     len  precision scale nullOK
## 1  synis_id        integer   number     NA 6            0  FALSE 
## 2  leidangur       character varchar2   40 0            0   TRUE 
## 3  dags            POSIXct   date       NA 0            0   TRUE 
## 4  skip            integer   number     NA 4            0   TRUE 
## 5  stod            integer   number     NA 5            0   TRUE 
## 6  reitur          integer   number     NA 4            0   TRUE 
## 7  smareitur       integer   number     NA 1            0   TRUE 
## 8  kastad_n_breidd integer   number     NA 6            0   TRUE 
## 9  kastad_v_lengd  integer   number     NA 6            0   TRUE 
## 10 hift_n_breidd   integer   number     NA 6            0   TRUE 
## 11 hift_v_lengd    integer   number     NA 6            0   TRUE 
## 12 dypi_kastad     integer   number     NA 4            0   TRUE 
## 13 dypi_hift       integer   number     NA 4            0   TRUE 
## 14 veidarfaeri     integer   number     NA 3            0   TRUE 
## 15 moskvastaerd    integer   number     NA 4            0   TRUE 
## 16 grandaralengd   integer   number     NA 3            0   TRUE 
## 17 heildarafli     integer   number     NA 7            0   TRUE 
## 18 londunarhofn    integer   number     NA 3            0   TRUE 
## 19 skiki           integer   number     NA 2            0   TRUE 
## 20 fjardarreitur   integer   number     NA 3            0   TRUE 
## 21 snt             POSIXct   date       NA 0            0   TRUE 
## 22 snn             character varchar2   60 0            0   TRUE 
## 23 sbt             POSIXct   date       NA 0            0   TRUE 
## 24 sbn             character varchar2   60 0            0   TRUE 
## 25 hnattstada      integer   number     NA 1            0   TRUE 
## 26 landsyni        integer   number     NA 2            0   TRUE 
## 27 aths            character varchar2  320 0            0   TRUE 
## 28 stada_stodvar   integer   number     NA 2            0   TRUE 
## 29 net_nr          integer   number     NA 2            0   TRUE 
## 30 synaflokkur     integer   number     NA 3            0   TRUE 
## 31 veidisvaedi     character varchar2  160 0            0   TRUE 
## 32 hitamaelir_id   numeric   number     NA 0         -127   TRUE 
## 33 maelingarmenn   character varchar2 4000 0            0   TRUE 
## 34 veidarfaeri_id  numeric   number     NA 0         -127   TRUE 
## 35 tog_aths        character varchar2 2000 0            0   TRUE 
## 36 medferd_afla    integer   number     NA 2            0   TRUE 
## 
##    323711 rows on 2016-09-26 22:01:28
```

