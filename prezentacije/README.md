# Презентације - Програмске парадигме

Презентације за курс Програмских парадигми, направљене помоћу Reveal.js.

## Први пут - Инсталација

Ако немате `reveal.js` фолдер, треба га инсталирати (само први пут):

```bash
# У root фолдеру пројекта
git clone https://github.com/hakimel/reveal.js.git
cd reveal.js
npm install
```

**Напомена:** `reveal.js/` фолдер је у `.gitignore` и неће бити праћен у git-у.

## Како користити

### Отварање презентације

1. Једноставно отворите HTML фајл у прегледачу (двоструки клик)
2. Или покрените локални сервер за бољу перформансу:

```bash
cd "reveal.js"
npm start
```

Затим отворите: `http://localhost:8000/prezentacije/02-imperativna-paradigma.html`

### Навигација

- **Стрелице** ←↑→↓ - Кретање кроз слајдове
- **Space** - Следећи слајд
- **Esc** или **O** - Преглед свих слајдова
- **S** - Режим говорника (Speaker view)
- **F** - Цео екран (Fullscreen)
- **?** - Помоћ

### Карактеристике

- **Fragments** - Садржај се појављује корак по корак (класа `fragment`)
- **Code highlighting** - Аутоматско обојавање кода
- **Line numbers** - `data-line-numbers` на `<code>` тагу
- **Speaker notes** - Додајте `<aside class="notes">Напомене...</aside>`

## Структура

```
prezentacije/
├── 02-imperativna-paradigma.html    - Презентација за лекцију 2
├── TEMPLATE.html                     - Шаблон за нове презентације
├── custom-theme.css                  - Прилагођена тема (не мења се при компајлирању!)
├── README.md                         - Упутство (овај фајл)
└── ...                               - Остале презентације

reveal.js/                            - Reveal.js framework
```

## Како додати нову презентацију

1. **Копирајте TEMPLATE.html** и преименујте га
2. Промените `<title>` и садржај слајдова
3. Користите исту структуру са `<section>` за слајдове
4. Немојте мењати фајлове у `reveal.js/dist/` - они се регенеришу при компајлирању!

## Како додати слике

1. Ставите слике у `prezentacije/images/` фолдер
2. Користите их у HTML:
```html
<img src="images/ime-slike.png" alt="Опис" style="width: 60%;">
```

Детаљна упутства: **[THEMES-AND-IMAGES.md](THEMES-AND-IMAGES.md)**

## Промена теме

Промените у HTML фајлу:
```html
<link rel="stylesheet" href="../reveal.js/dist/theme/white.css">
```

Доступне теме: `black`, `white`, `league`, `beige`, `sky`, `night`, `serif`, `simple`, `solarized`

**Видети:** [THEMES-AND-IMAGES.md](THEMES-AND-IMAGES.md) за све опције

## Прилагођавање стилова

**ВАЖНО:** Не мењајте `reveal.js/dist/theme/black.css` - биће обрисан при компајлирању!

Уместо тога, додајте своје стилове у `custom-theme.css`:
- Овај фајл се учитава после reveal.js теме
- Ваши стилови надјачавају подразумеване
- Неће бити обрисан при компајлирању

## Примери корисних функција

### Вертикални слајдови (поткатегорије)

```html
<section>
    <section>Главна тема</section>
    <section>Детаљ 1</section>
    <section>Детаљ 2</section>
</section>
```

### Напомене за говорника

```html
<section>
    <h2>Наслов</h2>
    <p>Текст на слајду</p>
    <aside class="notes">
        Ово виде само у режиму говорника (притисни S)
    </aside>
</section>
```

### Истицање редова кода

```html
<pre><code data-line-numbers="1,3-5">
// ред 1 је истакнут
int x = 5;
// редови 3-5 су истакнути
while (x > 0) {
    x--;
}
</code></pre>
```

## Теме

Промените тему у `<head>` секцији:

```html
<link rel="stylesheet" href="../reveal.js/dist/theme/black.css">
```

Доступне теме: `black`, `white`, `league`, `beige`, `sky`, `night`, `serif`, `simple`, `solarized`

## Извоз у PDF

1. Отворите презентацију у Chrome/Edge
2. Додајте `?print-pdf` на крај URL-а
3. File → Print → Save as PDF

Пример: `http://localhost:8000/prezentacije/02-imperativna-paradigma.html?print-pdf`
