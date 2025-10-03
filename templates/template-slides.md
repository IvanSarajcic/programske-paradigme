---
marp: true
theme: default
paginate: true
size: 16:9
style: |
  section {
    background: #1a1a1a;
    color: #ffffff;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    padding: clamp(20px, 4vh, 60px) clamp(40px, 5vw, 80px);
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
  }
  h1 {
    color: #4fc3f7;
    font-size: clamp(1.8rem, 4vw, 2.5rem);
    margin-bottom: clamp(0.5rem, 2vh, 1rem);
    border-bottom: 3px solid #4fc3f7;
    padding-bottom: 0.5rem;
  }
  h2 {
    color: #81d4fa;
    font-size: clamp(1.4rem, 3vw, 2rem);
    margin-top: clamp(0.8rem, 2vh, 1.5rem);
    margin-bottom: clamp(0.4rem, 1vh, 0.8rem);
  }
  h3 {
    color: #b3e5fc;
    font-size: clamp(1.2rem, 2.5vw, 1.6rem);
    margin-top: clamp(0.6rem, 1.5vh, 1rem);
    margin-bottom: clamp(0.3rem, 0.8vh, 0.6rem);
  }
  p, li {
    font-size: clamp(0.9rem, 2vw, 1.2rem);
    line-height: 1.6;
    margin-bottom: clamp(0.3rem, 1vh, 0.8rem);
  }
  ul, ol {
    margin-left: clamp(1rem, 3vw, 2rem);
    margin-bottom: clamp(0.5rem, 1.5vh, 1rem);
  }
  li {
    margin-bottom: clamp(0.2rem, 0.8vh, 0.6rem);
  }
  code {
    background: #2d2d2d;
    color: #4fc3f7;
    padding: 2px 8px;
    border-radius: 4px;
    font-size: 0.95em;
  }
  pre {
    background: #2d2d2d;
    border-left: 4px solid #4fc3f7;
    padding: clamp(0.8rem, 2vh, 1.5rem);
    border-radius: 8px;
    overflow-x: auto;
    margin: clamp(0.5rem, 1.5vh, 1rem) 0;
    max-height: 60vh;
  }
  pre code {
    background: none;
    color: #e0e0e0;
    font-size: clamp(0.75rem, 1.8vw, 1rem);
    line-height: 1.5;
    padding: 0;
  }
  table {
    border-collapse: collapse;
    width: 100%;
    margin: clamp(0.5rem, 1.5vh, 1rem) 0;
    font-size: clamp(0.8rem, 1.8vw, 1rem);
  }
  th {
    background: #2d2d2d;
    color: #4fc3f7;
    padding: clamp(0.4rem, 1vh, 0.8rem);
    text-align: left;
    border-bottom: 2px solid #4fc3f7;
  }
  td {
    padding: clamp(0.4rem, 1vh, 0.8rem);
    border-bottom: 1px solid #333;
  }
  tr:hover {
    background: #252525;
  }
  strong {
    color: #4fc3f7;
    font-weight: 600;
  }
  em {
    color: #81d4fa;
    font-style: italic;
  }
  blockquote {
    border-left: 4px solid #4fc3f7;
    padding-left: clamp(0.8rem, 2vw, 1.5rem);
    margin: clamp(0.5rem, 1.5vh, 1rem) 0;
    color: #b3e5fc;
    font-style: italic;
  }
  img {
    max-width: 100%;
    max-height: 60vh;
    display: block;
    margin: clamp(0.5rem, 1.5vh, 1rem) auto;
    border-radius: 8px;
  }
  footer {
    color: #666;
    font-size: clamp(0.7rem, 1.5vw, 0.9rem);
  }
---

<!-- Title Slide -->
# [НАСЛОВ ЛЕКЦИЈЕ]

**Програмске парадигме**
Четврти разред гимназије

---

<!-- Slide 2: Objectives -->
## Циљеви часа

Данас ћемо научити:

- 🎯 [Циљ 1]
- 🎯 [Циљ 2]
- 🎯 [Циљ 3]
- 🎯 [Циљ 4]

---

<!-- Slide 3: Main Concept 1 -->
## [Концепт 1]: [Наслов]

### Шта је [концепт]?

[Кратка дефиниција концепта]

**Кључне карактеристике:**
- [Карактеристика 1]
- [Карактеристика 2]
- [Карактеристика 3]

---

<!-- Slide 4: Example 1 -->
## Пример: [Опис примера]

```programming-language
// Код пример - кратак и јасан
// Максимално 10-15 линија кода
// Са коментарима који објашњавају кључне делове

function example() {
    // Имплементација
}
```

**Објашњење:**
[Кратко објашњење шта код ради]

---

<!-- Slide 5: Visual Comparison -->
## [Наслов поређења]

| Аспект | Приступ А | Приступ Б |
|--------|-----------|-----------|
| **[Аспект 1]** | [Вредност А] | [Вредност Б] |
| **[Аспект 2]** | [Вредност А] | [Вредност Б] |
| **[Аспект 3]** | [Вредност А] | [Вредност Б] |

---

<!-- Slide 6: Main Concept 2 -->
## [Концепт 2]: [Наслов]

### [Поднаслов]

[Објашњење концепта]

**Предности:**
- ✅ [Предност 1]
- ✅ [Предност 2]

**Недостаци:**
- ❌ [Недостатак 1]
- ❌ [Недостатак 2]

---

<!-- Slide 7: Detailed Explanation -->
## [Детаљно објашњење]

### [Подтема 1]
[Објашњење...]

### [Подтема 2]
[Објашњење...]

> **Напомена:** [Важна напомена или савет]

---

<!-- Slide 8: Code Example 2 -->
## Практичан пример

**Задатак:** [Опис задатка]

```programming-language
// Решење задатка
// Са кључним деловима обележеним коментарима

class Example {
    // Имплементација
}
```

---

<!-- Slide 9: Key Points -->
## Кључне тачке

### Шта смо научили:

1. **[Тачка 1]** - [Кратко објашњење]
2. **[Тачка 2]** - [Кратко објашњење]
3. **[Тачка 3]** - [Кратко објашњење]
4. **[Тачка 4]** - [Кратко објашњење]

---

<!-- Slide 10: Practical Application -->
## Када користити?

### [Приступ/Концепт А]
- 👍 [Случај употребе 1]
- 👍 [Случај употребе 2]

### [Приступ/Концепт Б]
- 👍 [Случај употребе 1]
- 👍 [Случај употребе 2]

---

<!-- Slide 11: Summary -->
## Резиме

**Данас смо научили:**

- [Резиме тачка 1]
- [Резиме тачка 2]
- [Резиме тачка 3]

**Следећи час:**
[Најава следеће теме]

---

<!-- Slide 12: Homework -->
## Домаћи задатак 📝

### Задатак 1
[Опис задатка који ученици треба да ураде]

### Задатак 2 (опционо)
[Додатни задатак за вежбање]

**Рок:** [Следећи час / датум]

---

<!-- Final Slide: Questions -->
## Питања?

**Контакт:**
- Email: [email]
- Консултације: [време и место]

---

**Хвала на пажњи!** 🎓
