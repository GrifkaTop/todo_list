# todo_list

### ТЗ:
сделать приложение на android, в котором можно хранить список задач.

---

### Задачи.

1. Написать основу. (кнопка "+" при нажатии вслывает окно в котором можно заполнить название задачи)
2. Сделать галочки
3. Сделать глазик
4. Сделать изменение задач
5. Сделать параметр задачи (сделать до где открывается календарь)
6. Сделать красивый свап задачи влево вправо.
7. Сделать темную тему
8. Протестировать
9. Отдать на тест кому нить еще


---

### Распределение кода по папкам

```
lib
    src
        common - сюда складываем то что общее (локализация / темы / виджеты)
        core - сюда складываем общие / фундаментальные вещи (БД  / конфиги / работа с сетью)
        feature
            app - ваша главная входная точка в приложение (приложение - material app / роутинг)
                bloc - тут ваша работа с бизнес логикой, нейминг основан на стейт менеджере
                data - тут ваша работа с датой (remote db / local db)
                domain - тут ваша доменная логика (service / repo / util)
                router - настройки для навигации (если используете сторонний роутинг) по необходимости
                widget - все виджеты, экраны
            theme - фича темы
                bloc - тут ваша работа с бизнес логикой, нейминг основан на стейт менеджере
                data - тут ваша работа с датой (remote db / local db)
                domain - тут ваша доменная логика (service / repo / util)
                router - настройки для навигации (если используете сторонний роутинг)
                widget - все виджеты, экраны
```