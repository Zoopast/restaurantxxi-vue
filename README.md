# Restaurant XXI, Proyecto Portafolio de titulo DUOC 2022

App web que utiliza RoR 7 como Backend y Vue 3 como Frontend, asi mismo se tenia como requisito el conectarse a una BDD Oracle, por lo que se utilizaba una gema llamada [oracle-enhanced](https://github.com/rsim/oracle-enhanced).
Para los ultimos commits de esta app se eliminó este requisito y se volvió a la BDD postgresql inicial de RoR.

La app fue deployeada en Heroku a traves de un Docker container y la BDD se encontraba hosteada en la nube a traves de Azure siguiendo [el siguiente tutorial](https://learn.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/oracle-database-quick-create).

La app no esta terminada y tiene muchos errores pero creo que puede servir para alguien que se tengra que enfrentar a un problema similar, en caso de necesitar revisar como se hizo la conexión a la BDD Oracle revisar commit anteriores pero basicamente se copiaban de un ambiente local al docker los archivos necesarios para que "oracle-enhanced" pudiera conectarse a la BDD una vez estuviera en Heroku.