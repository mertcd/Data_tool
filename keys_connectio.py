file = open("big_sample.tsv", "r")
fileW = open("tumour2.tsv", "w")
file3 = open("tumoure.tsv", "w")

# match tumour Id with indexes to create foreign keys
i = 0
keys = []
#for line in file2:#Appends all rows from distinct row file to
#    list = line.split("\t")
#    keys.append(list)

foreignKey = [["Primary site", "Site subtype 1", "Site subtype 2", "Site subtype 3"]]
aa = 0

for line in file:
    elemn = line.split("\t")  # Split the big table in to a array


    row = elemn[:3]
    row.append(elemn[3] + "\n")

    if aa!=0:
        try:

            fore = str(int(elemn[4])) + "," + str(keys.index(row) + 1) + "\n"
            fileW.write(fore)
        except:
            keys.append(row)
            fore = str(int(elemn[4])) + "," + str(keys.index(row)+1) + "\n"
            fileW.write(fore)
    aa = aa + 1

a = 1
for i in keys:
    file3.write(str(a)+","+",".join(i))
    a=a+1
