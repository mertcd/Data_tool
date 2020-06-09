def split_table(inFile, outFile,deliminator, *indexes):
    for line in inFile:
        list = line.split(deliminator)
        valueList= []
        for index in indexes:
            valueList.append(list[index])
        outFile.write(deliminator.join(valueList)+"\n")
def add_indexto_file(inFile, outFile,deliminator):
    index = 0
    for line in inFile:
        valueList = line.split(deliminator)
        valueList.insert(index)
        outFile.write(deliminator.join(valueList))



infile = open("Cancer_data.tsv", "r")
outfile = open("mutation_genomic.tsv", "w")

"""Gene name0	Accession Number1	Gene CDS length2	HGNC ID3	Sample name4	ID_sample5	ID_tumour6	Primary site7	Site subtype 1.8
# Site subtype9 2	Site subtype10 3	Primary histology11	Histology subtype12 1	Histology subtype13 2	Histology subtype14 3	Genome-wide screen15
# GENOMIC_MUTATION_ID16	LEGACY_MUTATION_ID17	MUTATION_ID18	Mutation CDS19	Mutation AA20	Mutation Description21	Mutation zygosity22	LOH23	GRCh24
# Mutation genome position25    Mutation strand26	SNP27	Resistance Mutation28	FATHMM prediction29	FATHMM score30	Mutation somatic status31
# Pubmed_PMID32	ID_STUDY33	Sample Type34	Tumour origin35	Age36
"""
split_table(infile,outfile,"\t",18,16,17,19,20,21,)
