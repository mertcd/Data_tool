
insert into genes(Gene_name,Accession_Number,Gene_CDS_length,HGNC_ID,Genome_wide_screen)
select distinct Gene_name,Accession_Number,Gene_CDS_length,HGNC_ID,Genome_wide_screen
from project_sanger.cancer_sanger;
#Normalizing by removing duplicate rows.
#Added new primary key to histology data
insert into histological_classification(Histology_id,Primary_histology,Histology_subtype_1,Histology_subtype_2,Histology_subtype_3)
SELECT * FROM output_schema.histological_classification;





#foreign key for use of  joins added tumour date . Joins tumour table with 
insert into tumour(ID_tumour,ID_histology)
select distinct ID_tumour,ID_histology from tumour_histology;

insert into samples(ID_sample,Sample_Type,Sample_name,Pubmed_PMID)
select ID_sample,Sample_Type,Sample_name,Pubmed_PMID
from project_sanger.cancer_sanger;

insert into tumour_samples(ID_sample,Sample_Type,Sample_name,Pubmed_PMID)
select distinct ID_sample,Sample_Type,Sample_name,Pubmed_PMID
from samples;
select count(ID_tumour)
from tumour;
insert into tissiue2(ID_tumour,Tissue_ID)
select distinct ID_tumour, tissiue_id
from tissue_foreign_key;
#joins for tumour table#
insert into genes(ID_gene,Gene_Name, Accession_Number, Gene_CDS_Length, HGNC_ID, Genome_wide_screen )
select ID_gene ,Gene_Name, Accession_Number, Gene_CDS_Length, HGNC_ID, Genome_wide_screen
from cancer_database5.genes;

insert into histological_classification(ID_histology, Primary_histology, Histology_subtype_1,Histology_subtype_2,Histology_subtype_3)
select * from cancer_database5.histological_classification;

insert into tissue_of_origin(ID_tissue, Primary_site, Site_subtype_1, Site_subtype_2, Site_subtype_3)
select * from cancer_database5.tissue_of_origin;

insert into tumour_samples
SELECT * FROM cancer_database5.tumour_samples;

insert into tumour
SELECT * FROM cancer_database5.tumour;

insert into sample_mut_features
SELECT * FROM cancer_database5.sample_mut_features;

insert into mutation_genomic
select distinct Genomic_mutation_ID, GRCH, Mutation_genome_position, SNP, Mutation_Strand
from mutation.cancer_sanger;

insert into mutation_specs
select  distinct LEGACY_MUTATION_ID, FATHMM_prediction,FATHMM_score
from mutation.cancer_sanger;


insert into mutations 
select distinct MUTATION_ID, Mutation_CDS, Mutation_AA, Mutation_Description ,GENOMIC_MUTATION_ID, LEGACY_MUTATION_ID
from mutation.cancer_sanger;

#insert into mutations_has_genes
select distinct MUTATION_ID, ID_gene 
from mutation.cancer_sanger join genes on cancer_sanger.Gene_Name = genes.Gene_Name
limit 40;



insert into tumour_genes_foo
select Gene_name, ID_tumour
from cancer_sanger;

set global connect_timeout = 100;
insert into genes_has_tumour(tumour_ID_tumour, genes_ID_gene)
select  ID_gene,ID_tumour 
from project_sanger.tumour_genes_foo join genes on tumour_genes_foo.Gene_Name = genes.Gene_Name;

insert into resistance
select distinct ID_tumour, resistance_mur
from resistance
