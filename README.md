# random-levels-of-dirs-and-files-given-arguments

Compile:<br>
chmod +x generate.sh<br>
Running:<br>
./generate.sh dir_name num_of_files num_of_dirs levels<br>

Εξήγηση:<br>
- dir_name: το directory όπου θα γραφτούν τα αρχεία.
- num_of_files: το συνολικό πλήθος των αρχείων
- num_of_dirs: το συνολικό πλήθος των directories
- levels: σε πόσα επίπεδα θα κατανέμονται τα directories

Το script κάνει τα εξής:<br>
1. Κάνει ελέγχους για νούμερα εισόδου
2. Αν το dir_name δεν υπάρχει το δημιουργεί
3. Δημιουργεί τα directory names με τυχαία αλφαριθμητικά μήκους από 1 έως 8 χαρακτήρες και
γράμματα (π.χ. 138kjd ή jkkm180k)
4. Ξεκινάει και φτιάχνει τα directories επίπεδο-επίπεδο μέχρι να φτιάξει num_of_dirs directories
σε levels επίπεδα. Για παράδειγμα αν έχουμε τα ονόματα aaa, bbb, cc, dddd, eee
(num_of_dirs=5) και levels=2 τότε θα φτιάξουμε με τη σειρά:<br>
a. dir_name/aaa/<br>
b. dir_name/aaa/bbb<br>
c. dir_name/cc/<br>
d. dir_name/cc/dddd<br>
e. dir_name/eee<br>
5. Αντίστοιχα δημιουργούνται num_of_files τυχαία ονόματα αρχείων από 1 έως 8 χαρακτήρες. Τα
αρχεία αυτά κατανεμένονται ομοιόμορφα στα directories που δημιουργούνται με round-robin
σειρά. Για παράδειγμα αν έχουμε τα ονόματα f1, f2, f3 … f10 τότε η τελική ιεραρχία θα έχει ώς
εξής:<br>
a. dir_name/f1<br>
b. dir_name/f7<br>
c. dir_name/aaa/f2<br>
d. dir_name/aaa/f8<br>
e. dir_name/aaa/bbb/f3<br>
f. dir_name/aaa/bbb/f9<br>
g. dir_name/cc/f4<br>
h. dir_name/cc/f10<br>
i. dir_name/cc/dddd/f5<br>
j. dir_name/eee/f6<br>
6. Σε καθένα από αυτά τα αρχεία γράφει ένα τυχαίο αλφαριθμητικό από 1 kb έως 128 kb.
