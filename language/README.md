# Lodashisp
(`_` = lodash)

Язык предназначен для выполнения последовательных вычислений над одним объектом. Он призван
существенно сократить количество кода в тех местах,
где нужно применить ряд операций над переменной.

## Подключение

Чтобы воспользоваться языком, нужно 
[скачать его](https://github.com/Dmitriy-kiselyov/LispLabs/blob/master/language/language.lisp)
в папку своего проекта и подключить следующим образом:

```common-lisp
(require "путь_к_файлу_языка")
```

## Синтаксис

Синтаксис языка довольно прост и прозрачен. Хватит всего несколько примеров, чтобы разобраться с ним польностью:

```common-lisp
(
	: 10
	+ _ 1 2 &	  ;13
	- 20 _ &	  ;7
	* -1 &		  ;-7
	* _ _ &		  ;49
	print
)
```

Рассмотрим построчно
1. `: 10` – первая строка выражения всегда начинается с `:`, далее значение нашей аккумулируемой переменной.
2. `+ _ 1 2 &` – вместо знака `_` подставляется значение на предыдущем шаге, в результате чего строчка превращается в хорошо знакомую
Lisp-конструкцию: `(+ 10 1 2)`, которая сразу вычисляется. Выражение всегда заканчивается знаком `&`. Перенос строки ставить не обязательно
3. `- 20 _ &` – вместо `_` подставляется `13`
4. `* -1 &` – в тех случаях, когда знака `_` нет, значение предыдущего шага автоматически подставляется в начало выражения. Эта строчка
аналогичка данной `* _ -1 &`
5. `* _ _ &` – использовать несколько `_` также можно
6. `print` – функция в конце вернет значение выражений, но, скорее всего, вам захочется его вывести.
Синтаксис вполне позволяет использовать это следующим образом

Совершенно не обязательно работать лишь с числами. Вот пример вычисления списка:
```common-lisp
(
	: (list 1 2 3 4 5)
	cdr _ &	                ;(2 3 4 5)
	cdr	&	        ;(3 4 5)
	append (list 6 7 8) _ &	;(6 7 8 3 4 5)
	print
)
```

Также знак `_` может быть спрятан глубоко внутри другой функции, он все равно успешно подставится
```common-lisp
(
	: 2
	print (list 1 _ 3)	; (1 2 3)
)
```

Функция работает с переменными из вне без всяких проблем:

```common-lisp
(setq a 5)
(setq b 3)

(
	: a
	+ b &
	print	; 8
)
```
