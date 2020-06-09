import pandas
file_name = open("SampleDump.tsv","r")
file_name_output = open("Sample.csv","w")

df = pandas.read_csv(file_name, sep="\t")

# Notes:
# - the `subset=None` means that every column is used
#    to determine if two rows are different; to change that specify
#    the columns as an array
# - the `inplace=True` means that the data structure is changed and
#   the duplicate rows are gone
df.drop_duplicates(subset="MUTATION_ID", inplace=True)

# Write the results to a different file
df.to_csv(file_name_output)
