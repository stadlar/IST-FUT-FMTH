---
aspectratio: 169 
listings: true
title: Vinnulag við yfirferð
author: Kristinn Stefánsson  
date: 15.12.2021  
mainfont: DejaVu Sans
...

## Vinnulag - fundir

* Vikulegir fundir
* Fastameðlimir + 1-2 sérfræðingar hvers léns
  * Stefnumótandi ákvarðanir
  * Afgreiðsla *á *fyrirliggjandi* atriðum

## Vinnulag - yfirferð

* Gert ráð fyrir markvissri vinnu aðila á milli funda
* Nýta Github til fulls
* Til umræðna á _issues_
  * Brjóta smærra niður ef þörf reynist
  * Reyna þó í lengstu lög að halda okkur við stóru línurnar
* Fá tillögur í _Pull Requests_

## Github

Grein fyrir hvert YAML skjal + TS   

```
FUT master/  
|- feature/v6ts310and313/  
|- feature/v6ts312/  
|- feature/v6ts312/  
|- feature/v6ts311/   
```

## Using Pull Requests

1. Fork the Project
2. Checkout branch  
(`git checkout -b feature/v6ts310and313`)
3. Create a new feature branch  
(`git checkout -b feature/my310improvement`)
4. Commit your changes  
(`git commit -m 'Add example for domestic payments'`)
5. Push to the Branch  
(`git push origin feature/myimprovementsuggestion`)
6. Open a Pull Request and include further descriptions of the suggested change.
    1. A short but descriptive title
    2. The context of the suggested change.
    3. Why the this implementation was chosen?
    4. The implications of the change, benefits, or constraints.

## Quality Control

Check changes for consistency as well as error.  

Using linter and validation tools e.g. from Redocly

Can run under Docker as an alternative to installing the NPM tool:

```bash
docker run --rm -v $PWD:/spec redocly/openapi-cli 
lint 'Deliverables/IOBWS3.0.yaml'
```
In the project is a Redocly ignore file has been added ignore warnings from the 1.3.8 base, that are not under scope.

Using SwaggerAPI Editor can also help:

```bash
docker run --rm -d -p 8044:8080 --name="openapigui" 
-e SWAGGER_FILE=/tmp/Deliverables/IOBWS3.0.yaml 
-v $PWD:/tmp swaggerapi/swagger-editor
```

## Markdown fyrir skjöl

- Skjölum hefur verið snúið (aftur) í Markdown 
- Hægt að senda inn PR sem innifelur textabreytingar
- Tillaga að leyfa 'venjuleg' commit á v6 feature greinar
- Tryggir að útgáfustýring YAML og útgefinna PDF (geti) haldist í hendur

## Markdown skjöl

- Breytt í PDF til yfirlestrar reglubundið í ferlinu
- Stefnan að þau verði beint MD -> PDF
- Uppfærsla byrjar strax nú
- Tillögur vel þegnar í 'athugasemdum' á git skjölin

## Markdown leiðbeiningar

[Í boði Alnetsins](https://www.letmegooglethat.com/?q=github+markdown+cheat+sheet) :)

## Skipulag

-----------------------------------------------------------------------------------------------------
                    des   des                   jan   jan   jan   jan   feb   feb   feb   feb   mar  
------------------- ----- --------------------- ----- ----- ----- ----- ----- ----- ----- ----- -----
                    15    22                    5     12    19    26    2     9     16    23         
                                                                                                      
TS 310              x     x                     x     x           y     t     ú                      
                                                                                                      
TS 313                                                u     x     y     t     ú                      
                                                                                                      
YML                 x     x                     x     x     x     y     t     ú                      
-----------------------------------------------------------------------------------------------------

