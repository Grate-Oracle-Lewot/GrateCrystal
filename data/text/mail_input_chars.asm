; see engine/menus/naming_screen.asm

MailEntry_Uppercase:
	db "A B C D E F G H I J"
	db "K L M N O P Q R S T"
	db "U V W X Y Z   . ? !"
	db "0 1 2 3 4 5 6 7 8 9"
	db "“ ” ( ) [ ] - : ", $9d, " &"
	db "lower  DEL   END   "

MailEntry_Lowercase:
	db "a b c d e f g h i j"
	db "k l m n o p q r s t"
	db "u v w x y z   , <INV_QU> <INV_EX>"
	db "' 'd 'l 'm 'r 's 't 'v é <FLOAT>"
	db "… ♂ ♀ ¥ / × <PK> <MN> <PO> <KE>"
	db "UPPER  DEL   END   "
