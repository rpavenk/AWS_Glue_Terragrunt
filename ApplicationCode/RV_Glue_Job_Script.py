import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

args = getResolvedOptions(sys.argv, ['JOB_NAME', 'SRC_DB', 'SRC_TABLE', 'DEST_DB', 'DEST_TABLE', 'SRC_CONNECTION', 'DEST_CONNECTION'])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

# Extract arguments
source_database = args['SRC_DB']
source_table = args['SRC_TABLE']
dest_database = args['DEST_DB']
dest_table = args['DEST_TABLE']
source_connection = args['SRC_CONNECTION']
dest_connection = args['DEST_CONNECTION']

# Script generated for node AWS Glue Data Catalog
AWSGlueDataCatalog_node12345 = glueContext.create_dynamic_frame.from_catalog(database=source_database, table_name=source_table, transformation_ctx="AWSGlueDataCatalog_node12345")

# Script generated for node AWS Glue Data Catalog
AWSGlueDataCatalog_node1713742861240 = glueContext.write_dynamic_frame.from_catalog(frame=AWSGlueDataCatalog_node12345, database=dest_database, table_name=dest_table, transformation_ctx="AWSGlueDataCatalog_node1713742861240")

job.commit()