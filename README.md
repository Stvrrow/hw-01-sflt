# Домашнее задание к занятию "`Disaster recovery и Keepalived»`" - `Стрельников Александр`

------

### Задание 1
- Дана [схема](1/hsrp_advanced.pkt) для Cisco Packet Tracer, рассматриваемая в лекции.
- На данной схеме уже настроено отслеживание интерфейсов маршрутизаторов Gi0/1 (для нулевой группы)
- Необходимо аналогично настроить отслеживание состояния интерфейсов Gi0/0 (для первой группы).
- Для проверки корректности настройки, разорвите один из кабелей между одним из маршрутизаторов и Switch0 и запустите ping между PC0 и Server0.
- На проверку отправьте получившуюся схему в формате pkt и скриншот, где виден процесс настройки маршрутизатора.

#### Решение

Скриншот процесса настройки маршрутизатора Router1

![Процесс настройки маршрутизатора](https://github.com/Stvrrow/hw-01-sflt/blob/main/img/img1.png)

Скриншот конфигурации интерфейсов GI 0/0 и GI 0/1 на маршрутизатора

![Конфигурация интерфейсов](https://github.com/Stvrrow/hw-01-sflt/blob/main/img/img2.png)

Скриншот работы команды ping от PC0 до Server0 после разрыва кабеля

![Работа после разрыва кабеля](https://github.com/Stvrrow/hw-01-sflt/blob/main/img/img3.png)

Ссылка на файл схемы формате pkt с выполненным заданием:

![pkt](https://github.com/Stvrrow/hw-01-sflt/blob/main/hsrp_advanced_modified.pkt)

------

### Задание 2
- Запустите две виртуальные машины Linux, установите и настройте сервис Keepalived как в лекции, используя пример конфигурационного [файла](1/keepalived-simple.conf).
- Настройте любой веб-сервер (например, nginx или simple python server) на двух виртуальных машинах
- Напишите Bash-скрипт, который будет проверять доступность порта данного веб-сервера и существование файла index.html в root-директории данного веб-сервера.
- Настройте Keepalived так, чтобы он запускал данный скрипт каждые 3 секунды и переносил виртуальный IP на другой сервер, если bash-скрипт завершался с кодом, отличным от нуля (то есть порт веб-сервера был недоступен или отсутствовал index.html). Используйте для этого секцию vrrp_script
- На проверку отправьте получившейся bash-скрипт и конфигурационный файл keepalived, а также скриншот с демонстрацией переезда плавающего ip на другой сервер в случае недоступности порта или файла index.html

#### Решение

Статус службы keepalived на серверах до удаления файла index.html на master сервере

![Службы до удаления index.html](https://github.com/Stvrrow/hw-01-sflt/blob/main/img/img4.png)

Веб страница nginx, работающая на master сервере

![nginx master](https://github.com/Stvrrow/hw-01-sflt/blob/main/img/img5.png)

После удаления файла index.html на master сервере (в данном случае просто переименовал его), отработал bash скрипт и backup сервер взял на себя роль master

![Службы после удаления index.html](https://github.com/Stvrrow/hw-01-sflt/blob/main/img/img6.png)

Веб страница nginx, работающая на backup сервере

![nginx backup](https://github.com/Stvrrow/hw-01-sflt/blob/main/img/img7.png)

Ссылка на файл конфигурации master сервера:
![keepalived_master.conf](https://github.com/Stvrrow/hw-01-sflt/blob/main/keepalived_master.conf)

Ссылка на файл конфигурации backup сервера:
![keepalived_backup.conf](https://github.com/Stvrrow/hw-01-sflt/blob/main/keepalived_backup.conf)

Ссылка на bash скрипт:
![check_web_service.sh](https://github.com/Stvrrow/hw-01-sflt/blob/main/check_web_service.sh)
