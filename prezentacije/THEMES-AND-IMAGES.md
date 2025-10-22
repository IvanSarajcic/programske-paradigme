# Reveal.js Теме и Прилагођавање

## Промена Теме (без компајлирања)

### Брза промена теме

У вашем HTML фајлу, промените овај ред:

```html
<link rel="stylesheet" href="../reveal.js/dist/theme/black.css">
```

Замените `black.css` са било којом од доступних тема:

| Тема | Фајл | Опис |
|------|------|------|
| **Black** | `black.css` | Тамна тема (тренутна) |
| **White** | `white.css` | Светла тема |
| **League** | `league.css` | Сива тема са плавим акцентима |
| **Beige** | `beige.css` | Беж тема |
| **Sky** | `sky.css` | Плава тема |
| **Night** | `night.css` | Црна тема са наранџастим |
| **Serif** | `serif.css` | Тема са серифним фонтом |
| **Simple** | `simple.css` | Минималистичка светла тема |
| **Solarized** | `solarized.css` | Solarized боје |
| **Moon** | `moon.css` | Тамно плава |
| **Dracula** | `dracula.css` | Dracula боје |
| **Blood** | `blood.css` | Тамна са црвеним |

### Пример:

```html
<!-- За светлу тему -->
<link rel="stylesheet" href="../reveal.js/dist/theme/white.css">

<!-- Или за night тему -->
<link rel="stylesheet" href="../reveal.js/dist/theme/night.css">
```

Ваш `custom-theme.css` ће и даље радити и надјачавати основну тему!

---

## Прилагођавање Теме (custom-theme.css)

Све прилагођене стилове додајте у `prezentacije/custom-theme.css`. Ево неких честих прилагођавања:

### Променити боје

```css
/* Промени позадину слајдова */
.reveal {
    background-color: #2c3e50;
}

/* Промени боју наслова */
.reveal h1, .reveal h2, .reveal h3 {
    color: #3498db;
}

/* Промени боју текста */
.reveal p, .reveal li {
    color: #ecf0f1;
}

/* Промени боју линкова */
.reveal a {
    color: #e74c3c;
}
```

### Променити величину фонта

```css
/* Већи наслови */
.reveal h1 {
    font-size: 3em;
}

.reveal h2 {
    font-size: 2em;
}

/* Већи текст */
.reveal p, .reveal li {
    font-size: 1.2em;
}
```

### Стилизовати слике

```css
/* Заобљене ивице слика */
.reveal img {
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(0,0,0,0.5);
}

/* Уклони сенку са слика */
.reveal img {
    box-shadow: none;
    border: none;
}
```

### Стилизовати код

```css
/* Већи код */
.reveal pre code {
    font-size: 1.2em;
    line-height: 1.4;
}

/* Другачија позадина кода */
.reveal pre {
    background-color: #282c34;
    border-left: 5px solid #61dafb;
}
```

---

## Додавање Слика

### Структура фолдера

```
prezentacije/
├── images/              ← Ставите слике овде
│   ├── diagram1.png
│   ├── screenshot.jpg
│   └── logo.svg
├── 02-imperativna-paradigma.html
└── custom-theme.css
```

### Основно додавање слике

```html
<section>
    <h2>Наслов</h2>
    <img src="images/diagram.png" alt="Дијаграм">
</section>
```

### Контрола величине слике

```html
<!-- Процентуална ширина -->
<img src="images/big.png" style="width: 80%;">

<!-- Фиксна ширина -->
<img src="images/small.png" style="width: 400px;">

<!-- Максимална величина -->
<img src="images/photo.jpg" style="max-width: 60%; height: auto;">
```

### Слика без сенке/ивице

```html
<img src="images/logo.png" style="background: none; border: none; box-shadow: none;">
```

### Слика и текст један поред другог

```html
<section>
    <div style="display: flex; align-items: center; gap: 2rem;">
        <div style="flex: 1;">
            <img src="images/diagram.png" style="width: 100%;">
        </div>
        <div style="flex: 1;">
            <h3>Објашњење</h3>
            <p>Текст поред слике...</p>
        </div>
    </div>
</section>
```

### Више слика у реду

```html
<section>
    <div style="display: flex; gap: 1rem; justify-content: center;">
        <img src="images/img1.png" style="width: 30%;">
        <img src="images/img2.png" style="width: 30%;">
        <img src="images/img3.png" style="width: 30%;">
    </div>
</section>
```

### Позадинска слика (цео слајд)

```html
<section data-background-image="images/background.jpg" 
         data-background-size="cover"
         data-background-opacity="0.3">
    <h2>Текст преко слике</h2>
</section>
```

---

## Напредна Прилагођавања

### Анимације

```html
<!-- Fade анимација -->
<img src="images/logo.png" class="r-stretch">

<!-- Zoom ефекат -->
<section data-auto-animate>
    <img src="images/small.png" style="width: 20%;">
</section>
<section data-auto-animate>
    <img src="images/small.png" style="width: 80%;">
</section>
```

### Иконице и емоџи

```html
<h2>Предности 👍</h2>
<ul>
    <li>✅ Једноставно</li>
    <li>✅ Брзо</li>
    <li>❌ Не подржава све</li>
</ul>
```

### Видео

```html
<section>
    <h2>Видео пример</h2>
    <video controls width="80%">
        <source src="images/demo.mp4" type="video/mp4">
    </video>
</section>
```

---

## Компајлирање (ако желите креирати нову тему)

**Напомена:** Не морате да компајлирате! Користите `custom-theme.css` за све измене.

Ако ипак желите да направите **потпуно нову тему од нуле**:

1. Инсталирајте зависности (већ урађено):
```bash
cd reveal.js
npm install
```

2. Копирајте постојећу тему:
```bash
cp css/theme/source/black.scss css/theme/source/my-theme.scss
```

3. Измените `my-theme.scss` фајл

4. Компајлирајте:
```bash
npm run build
```

5. Користите нову тему:
```html
<link rel="stylesheet" href="../reveal.js/dist/theme/my-theme.css">
```

**Али поново: За ваше потребе, `custom-theme.css` је довољан!**

---

## Брзе Референце

### Најчешће коришћени атрибути слајда

```html
<!-- Позадинска боја -->
<section data-background-color="#ff0000">

<!-- Позадинска слика -->
<section data-background-image="images/bg.jpg">

<!-- Прелаз/транзиција -->
<section data-transition="zoom">

<!-- Аутоматска анимација -->
<section data-auto-animate>
```

### Транзиције

У `<script>` делу, промените:
```javascript
Reveal.initialize({
    transition: 'slide', // none/fade/slide/convex/concave/zoom
});
```

### Напредне опције

```javascript
Reveal.initialize({
    hash: true,
    slideNumber: true,          // Прикажи бројеве слајдова
    transition: 'slide',        // Тип транзиције
    controls: true,             // Прикажи контроле
    progress: true,             // Прогрес бар
    center: true,               // Центрирај слајдове
    rtl: false,                 // Десно-на-лево (за арапски итд)
    autoSlide: 0,               // Аутоматско померање (0 = искључено)
    loop: false,                // Понављај презентацију
    shuffle: false,             // Насумични редослед
});
```
