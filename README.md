## Биоинформатика. Лабораторная работа 2

- Используемое ПО: Jmol
- Импользуемая структура белка на Protein Data Bank: [link](https://www.rcsb.org/structure/7M7I)

Jmol оказался довольно прост в использовании для решения поставленных задач, поэтому запись скринкаста с необходимыми действиями мне показалась излишней. Далее я приведу скриншоты разных представлений выбранной структуры и опишу команды, при помощи которых я получил результат.

Все взаимодействие с Jmol происходит через специальную консоль. Запустить ее можно через контекстное меню, которое вызывается кликом правой кнопкой мыши в область визаулизации. 

<p align="center">
  <img src="./images/console.png" />
</p>

### Wireframe

`wireframe on/off` в консоли.

<p align="center">
  <img src="./images/wireframe.png" />
</p>

### Backbone

`backbone on/off` в консоли.

<p align="center">
  <img src="./images/backbone.png" />
</p>

### Spacefill

`spacefill on/off` в консоли.

<p align="center">
  <img src="./images/spacefill.png" />
</p>

### Ribbons

Аналогом ribbons в Jmol является `cartoon`. Активируется при помощи `cartoon on/off` в консоли.

<p align="center">
  <img src="./images/ribbons.png" />
</p>

### Molecular surface

`geoSurface on/off` в консоли

<p align="center">
  <img src="./images/mol_surface.png" />
</p>


### Цветовая модель CPK

`color cpk` в консоли.

<p align="center">
  <img src="./images/cpk.png" />
</p>

### Раскраска структуры различными цветами по частям

`color chain` в консоли.

<p align="center">
  <img src="./images/color_parts.png" />
</p>


### Изображение публикационного качества

Попробовав найти способ получить изображение публикационного качества в Jmol, наткнулся на команду `capture`, которая позоляет создавать анимации. [link](https://sourceforge.net/p/jmol/mailman/message/33283565/)

Анимацию получил командой `capture [имя_файла] SPIN y`.

<p align="center">
  <img src="./images/spin.gif" />
</p>